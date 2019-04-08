// ___FILEHEADER___

import Foundation
import Alamofire

enum Result {
    case success(Decodable?)
    case failure(ErrorConvertible?)
}

typealias ServiceResponse = (Result) -> Void

protocol ServiceRequestAdaptor {
    static func request<T: Decodable>(_ urlRequest: URLRequestConvertible, model: T.Type, onCompletion: @escaping ServiceResponse)
    static func multipartRequest<T: Decodable>(_ urlRequest: URLRequestConvertible, formData: [(key: String, data: Data)], model: T.Type, onCompletion: @escaping ServiceResponse)
}
