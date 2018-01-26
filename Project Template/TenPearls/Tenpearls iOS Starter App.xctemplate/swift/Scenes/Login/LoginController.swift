//  Created on ___DATE___.

import UIKit

class LoginController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func login(user: User) {
    }
    
    func register() {
    }
    
    func forgotPassword() {
    }
}
