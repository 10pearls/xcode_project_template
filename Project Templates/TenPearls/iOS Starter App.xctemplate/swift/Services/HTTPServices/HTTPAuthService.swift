// ___FILEHEADER___

import UIKit

struct HTTPAuthService {
    
    struct Login: HTTPRequestProtocol {
    
        var userName: String
        var password: String
        var serviceResponse: ServiceResponse
        
        func paramDictionary() -> [String: AnyObject]? {
            return nil
        }
        
        func urlAttributes() -> (method: HttpRequestMethod, endpoint: String) {
            return (method: .post, endpoint: "/login")
        }
        
        func headers() -> [String: String]? {
            return nil
        }
    }
    
}
