//___FILEHEADER___

import Foundation

enum Result {
    case success(Decodable)
    case failure(ErrorConvertible?)
}

typealias ServiceResponse = (Result) -> Void

enum RequestHTTPMethod: String {
    
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
    
}

protocol ServiceRequestAdaptor {

    static func request<T: Decodable>(_ params: RequestProtocol, model: T.Type, onComplete: @escaping ServiceResponse)
}
