//___FILEHEADER___

import UIKit

protocol HTTPRequestProtocol: RequestProtocol {
    func urlAttributes() -> (method: RequestHTTPMethod, url: String)
    func headers() -> [String: String]?
    func baseURL() -> String
}

extension HTTPRequestProtocol {
    
    func makeRequest<T: Decodable>(_ model: T.Type, block: @escaping ServiceResponse ) {
        HTTPRequest.request(self, model: model, onComplete: block)
    }
    
    func baseURL() -> String {
        return ""
    }
}
