//___FILEHEADER___

import Foundation

protocol ErrorConvertible {
    func errorMessage() -> String
}

extension ErrorConvertible {
    
    func errorMessage() -> String {
        return "Something went wrong!"
    }
}

enum ParsingError: ErrorConvertible {
    
    case invalidJSON
    
    func errorMessage() -> String {
        
        let errors: [ParsingError: String] = [ .invalidJSON: "Invalid JSON"]
        
        return errors[self] ?? "Something went wrong!"
    }
}

enum RequestError: Int, ErrorConvertible {
    
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case pageNotFound = 404
    case requestTimeOut = 408
    case somethingWentWrong = -1
    
    func errorMessage() -> String {
        
        let errors: [RequestError: String] = [ .badRequest: "Bad Request",
                                               .unauthorized: "You are not authorized",
                                               .forbidden: "Forbidden",
                                               .pageNotFound: "Page not found",
                                               .requestTimeOut: "Request timeout"]
        
        return errors[self] ?? "Something went wrong!"
    }
}

enum ParseServiceResult {
    case success(BaseEntity)
    case failure(String)
}

typealias ParseServiceResponse = (ParseServiceResult) -> Void
