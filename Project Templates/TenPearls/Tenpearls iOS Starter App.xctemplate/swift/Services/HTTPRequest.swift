//  Created on ___DATE___.

import Alamofire
import Foundation

struct HTTPRequest: ServiceRequestAdaptor {
    private static var completionHandler: ServiceResponse?
        
    static func request<T: Decodable>(_ params: RequestProtocol, model: T.Type, onComplete: @escaping ServiceResponse) {
        
        if let req: HTTPRequestProtocol = params as? HTTPRequestProtocol, params is HTTPRequestProtocol {
            completionHandler = onComplete
            
            let manager: SessionManager = Alamofire.SessionManager.default
            let operation = manager.request(req.urlAttributes().url,
                                            method: req.urlAttributes().method.toAlamofireHttpMethod(),
                                            parameters: req.paramDictionary(),
                                            encoding: JSONEncoding.default,
                                            headers: req.headers())
            
            operation.responseJSON { response -> Void in
                
                if response.result.error != nil {
                    
                    if let httpResponse = operation.response {
                        let error = RequestError(rawValue: httpResponse.statusCode) ?? .somethingWentWrong
                        self.onError(error)
                    } else {
                        let error = RequestError.somethingWentWrong
                        self.onError(error)
                    }
                } else {
                    self.onResponse(response, operation: operation, model: model)
                }
            }
        }
    }
    
    static func onError(_ error: ErrorConvertible?) {
        completionHandler?(.failure(error))
    }
    
    static func onResponse<T: Decodable>(_ response: DataResponse<Any>, operation: Alamofire.Request, model: T.Type) {
        
        if let data = response.data {

            let httpResponse = operation.response!

            if 200 ... 299 ~= httpResponse.statusCode {
                onSuccessResponse(data, model: model)
            } else {
                let error = RequestError(rawValue: httpResponse.statusCode) ?? .somethingWentWrong
                onError(error)
            }
        } else {
            let error = RequestError.somethingWentWrong
            onError(error)
        }
    }
    
    static func onSuccessResponse<T: Decodable>(_ data: Data, model: T.Type) {
        
        var decodedObject: Decodable?
        
        do {
            decodedObject = try JSONDecoder().decode( model, from: data)
            completionHandler?(.success(decodedObject!))
            
        } catch _ {
            let error = ParsingError.invalidJSON
            onError(error)
        }
    }
}

extension RequestHTTPMethod {
    
    internal func toAlamofireHttpMethod() -> HTTPMethod {
        
        let alamoFireHttpMethod: [RequestHTTPMethod: HTTPMethod] = [
            
            .get: .get,
            .post: .post,
            .put: .put,
            .delete: .delete,
            .head: .head,
            .patch: .patch,
            .connect: .connect,
            .options: .options,
            .trace: .trace
        ]
        
        return alamoFireHttpMethod[self] ?? .get
    }
}
