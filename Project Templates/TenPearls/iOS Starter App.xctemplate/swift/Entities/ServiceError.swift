//  Created on 14/09/2018.

import Foundation

class ServiceError: Decodable {
    
    var statusCode: Int?
    var message: String?
    var status: Int?
    
    enum CodingKeys: String, CodingKey {
        case meta
    }
    
    enum ChildKeys: String, CodingKey {
        case message
        case status
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let meta = try container.nestedContainer(keyedBy: ChildKeys.self, forKey: .meta)
        message = try meta.decodeIfPresent(String.self, forKey: .message)
        status = try meta.decodeIfPresent(Int.self, forKey: .status)
    }
}

extension ServiceError: ErrorConvertible {
    
    func errorMessage() -> String {
        var errMsg = ""
        
        #if DEBUG
            if let statusCode = statusCode {
                errMsg += "status code -> \(statusCode)\n"
            }
        #endif
        
        if let message = message, !message.isEmpty {
            errMsg += "\(message)\n"
        }
        
        return errMsg
    }
    
    func errorCode() -> Int {
        return statusCode ?? -1
    }
}
