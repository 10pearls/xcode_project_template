//  Created on 29/03/2019.

import MBProgressHUD
import UIKit

extension BaseController {
    
    func showLoader() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func hideLoader() {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    func showLoaderWith(message: String) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = message
    }
    
}
