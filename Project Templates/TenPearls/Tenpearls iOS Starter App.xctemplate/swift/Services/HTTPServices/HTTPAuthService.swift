//  Created on ___DATE___.

import UIKit

struct HTTPAuthService {
    
    struct Login: HTTPRequestProtocol {        
    
        var userName: String
        var password: String
        
        func paramDictionary() -> [String: AnyObject]? {
            return nil
        }
        
        func urlAttributes() -> (method: RequestHTTPMethod, url: String) {
            return (method: RequestHTTPMethod.post, url: "")
        }
        
        func headers() -> [String: String]? {
            return nil
        }
    }
}
