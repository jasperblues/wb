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


/**
* Global error type. It might be worth splitting these into separate types, eg CacheError.
*/

enum AppError: Error, CustomStringConvertible {

    case cachedObjectDoesNotExist(key: String)
    case networkError(code: Int)
    case unexpectedError(message: String)
    case nsError(nsError: NSError)

    var description: String {
        switch self {
        case .cachedObjectDoesNotExist(let key):
            return "Object for key '\(key) does not exist."
        case .networkError:
            return "Network error"
        case .unexpectedError(let message):
            return "Unexpected error: \(message)"
        case .nsError(let nsError):
            return nsError.description
        }
    }

}