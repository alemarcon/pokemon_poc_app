//
//  CustomError.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 03/11/21.
//

import Foundation

enum CustomErrorCode: Int {
    case notFound = 404
    case explicitlyCancelled = 500
    case generic = 600
    case jsonSerialization = 700
    case dataNil = 800
    case timeout = 900
    case noConnection = 1000
}


/// Custom error to throws network error
enum CustomError: Error {
    
    /// Error throws in case of 404 HTTP error
    case notFound(String)
    /// Error throws in case of explicitly cancelled HTTP request
    case explicitlyCancelled
    /// Generic error throws in any other network error
    case generic(Int, String)
    /// Error throws in case of json serialization error
    case jsonSerialization
    /// Error throws in case of response data nil
    case dataNil
    //// Error throws in timeout case
    case timeout
    /// Error throws in case of missing internet connection
    case noConnection
}

extension CustomError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        
        case .notFound(let message):
            let format = NSLocalizedString(Localized.error_404.rawValue, comment: "")
            return String(format: format, String(message))
            
        case .explicitlyCancelled:
            return NSLocalizedString(Localized.explicitly_cancelled_error.rawValue, comment: "")
            
        case .generic(let code, let message):
            let format = NSLocalizedString(Localized.generic_error_code_msg.rawValue, comment: "")
            return String(format: format, String(code), String(message))
            
        case .jsonSerialization:
            return NSLocalizedString(Localized.json_error.rawValue, comment: "")
            
        case .dataNil:
            return NSLocalizedString(Localized.data_nil_error.rawValue, comment: "")
        case .timeout:
            return NSLocalizedString(Localized.timeout_error.rawValue, comment: "")
        case .noConnection:
            return NSLocalizedString(Localized.offline_error.rawValue, comment: "")
        }
        
    }
    
    var customErrorCode: CustomErrorCode {
        switch self {
        case .notFound:
            return .notFound
        case .explicitlyCancelled:
            return .explicitlyCancelled
        case .generic:
            return .generic
        case .jsonSerialization:
            return .jsonSerialization
        case .dataNil:
            return .dataNil
        case .timeout:
            return .timeout
        case .noConnection:
            return .noConnection
        }
    }
}
