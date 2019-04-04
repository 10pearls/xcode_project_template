// ___FILEHEADER___.

protocol ErrorHandling {
    
    func throwException(message: String)
    func handleError(_ error: ErrorConvertible?)
    func forceLogoutUser()
    
}

extension ErrorHandling where Self: ActivityIndicator {

    func throwException(message: String) {
        let exception = NSException(name: NSExceptionName(rawValue: message), reason: nil, userInfo: nil)
        exception.raise()
    }

    func handleError(_ error: ErrorConvertible?) {
        hideLoader()

        if error?.errorCode() == 401 {
            forceLogoutUser()
            return
        }
        if let err = error {
            _ = Alert.show(title: "Error", message: err.errorMessage())
        }

    }

    func forceLogoutUser() {
        //Do Your Stuff here...
    }

}

