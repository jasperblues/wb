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

extension ApplicationAssembly {

    struct InfraConfig {
        static let serviceUrl = URL(string: "https://www.whatsbeef.net/wabz/guide.php")!
        static let cacheConfig = Config(frontKind: .memory, backKind: .disk)
    }

    func whatsBeefClient() -> WhatsBeefClient {
        return shared(
                WhatsBeefClient(serviceUrl: InfraConfig.serviceUrl,
                        responseParser: ResponseParser(),
                        cache: cache())
        )
    }

    func cache() -> Cache<Data> {
        return shared(
                Cache<Data>(name: "WhatsBeefCache", config: InfraConfig.cacheConfig)
        )
    }

}
