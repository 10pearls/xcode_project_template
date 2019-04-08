// ___FILEHEADER___
//
// https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.md#custom-encoding

import Foundation
import Alamofire

struct JSONArrayEncoding: ParameterEncoding {
    private let array: [Any]
    
    init(array: [Any]) {
        self.array = array
    }
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        let data = try JSONSerialization.data(withJSONObject: array, options: [])
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        if let body = String(data: data, encoding: .utf8) {
            print(body)
        }
        urlRequest.httpBody = data
        
        return urlRequest
    }
}
