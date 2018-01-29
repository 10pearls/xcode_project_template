//___FILEHEADER___

import UIKit

extension BaseController {
    
    func throwException(message: String) {
        let exception = NSException(name: NSExceptionName(rawValue: message), reason: nil, userInfo: nil)
        exception.raise()
    }
    
    func handleError(_ error: ErrorConvertible?) {
        if let err = error {
            print(err.errorMessage())
        }
    }
}
