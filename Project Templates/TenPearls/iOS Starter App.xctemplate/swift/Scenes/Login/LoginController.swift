// ___FILEHEADER___.

import UIKit

class LoginController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func login(user: User) {
        HTTPAuthService.Login(userName: user.username, password: user.password) { result in
            switch result {
            case .success( _):
                print("Success")
                
            case .failure( _):
                print("Error")
            }
        }.makeRequest(ApiResponse<User>.self)
    }
    
    func register() {
        push(Controller: LoginController())
    }
    
    func forgotPassword() {
        
    }
    
}
