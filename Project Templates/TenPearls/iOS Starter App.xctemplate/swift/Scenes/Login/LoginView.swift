//  Created on 29/03/2019.

import UIKit

class LoginView: BaseView {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        (controller as? LoginController)?.login(user: User(username: txtEmail.text!, password: txtPassword.text!))
    }
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        (controller as? LoginController)?.register()
    }
    
    @IBAction func buttonForgotPassword(_ sender: UIButton) {
        (controller as? LoginController)?.forgotPassword()
    }
}
