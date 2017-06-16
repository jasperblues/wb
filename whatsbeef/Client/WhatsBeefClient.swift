////////////////////////////////////////////////////////////////////////////////
//
//  Freelancer
//  Copyright 2017 Freelancer
//  All Rights Reserved.
//
//  NOTICE: Prepared by Jasper Blues, on behalf of Freelancer
//
////////////////////////////////////////////////////////////////////////////////

import Foundation
import Cache
import PromiseKit

class WhatsBeefClient {

    private(set) var serviceUrl: URL
    private(set) var responseParser: ResponseParser
    private(set) var cache: Cache<Data>

    init(serviceUrl: URL, responseParser: ResponseParser, cache: Cache<Data>) {
        self.serviceUrl = serviceUrl
        self.responseParser = responseParser
        self.cache = cache
    }

    func load(start: Int) -> Promise<[Program]> {
        let url = urlFor(start: start)
        return loadFromCache(url: url).recover { _ in
            return self.loadFromNetwork(url: url)
        }
    }

    func loadFromCache(url: URL) -> Promise<[Program]> {

        return Promise { fulfill, reject in
            cache.clearExpired()
            self.cache.object("\(url)") { (data: Data?) in
                if (data != nil) {
                    print("$$ Fulfilling from cache")
                    fulfill(self.responseParser.parse(response: data!))
                } else {
                    reject(AppError.cachedObjectDoesNotExist(key: "\(url)"))
                }
            }
        }
    }

    func loadFromNetwork(url: URL) -> Promise<[Program]> {

        return Promise { fulfill, reject in
            DispatchQueue.global(qos: .userInitiated).async {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if (error != nil) {
                        reject(error!)
                    } else {
                        self.cache.add("\(url)", object: data!, expiry: .date(Date()
                                .addingTimeInterval(60 * 60)))
                        print("$$ Fulfilling from network")
                        fulfill(self.responseParser.parse(response: data!))
                    }
                }.resume()
            }
        }
    }

    private func urlFor(start: Int) -> URL {

        let parameters: [URLQueryItem] = [
                URLQueryItem(name: "start", value: "\(start)"),
        ]

        var urlComponents = URLComponents()
        urlComponents.scheme = serviceUrl.scheme
        urlComponents.host = serviceUrl.host
        urlComponents.port = serviceUrl.port
        urlComponents.path = serviceUrl.path
        urlComponents.queryItems = parameters

        return urlComponents.url!
    }

}


