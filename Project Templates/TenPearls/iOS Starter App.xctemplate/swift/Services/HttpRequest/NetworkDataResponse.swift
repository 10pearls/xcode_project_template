// ___FILEHEADER___

import Foundation
import Alamofire

protocol ErrorConvertible {
    func errorMessage() -> String
    func errorCode() -> Int
    func debugMessage() -> String?
}

extension ErrorConvertible {

    func errorMessage() -> String {
        return "Something went wrong!"
    }
    
    func errorCode() -> Int {
        return 0
    }
    
    func debugMessage() -> String? {
        return nil
    }
}

extension AFError: ErrorConvertible {
    func errorMessage() -> String {
        return self.localizedDescription
    }
    
    func errorCode() -> Int {
        return self._code
    }
    
    func debugMessage() -> String? {
        return self.errorDescription
    }
}

extension NSError: ErrorConvertible {
    func errorMessage() -> String {
        return self.localizedDescription
    }
    
    func errorCode() -> Int {
        return self.code
    }
    
    func debugMessage() -> String? {
        return self.debugDescription
    }
}
