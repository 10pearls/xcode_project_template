// ___FILEHEADER___.

import Foundation

class ServiceError: Decodable {
    
    var statusCode: Int?
    var message: String?
    var status: Int?
    
}

extension ServiceError: ErrorConvertible {
    
    func errorMessage() -> String {
        return message ?? ""
    }
    
    func errorCode() -> Int {
        return statusCode ?? -1
    }
}
