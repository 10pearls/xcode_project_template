// ___FILEHEADER___.

import UIKit

protocol ActivityIndicator {
    
    func showLoader()
    func hideLoader()
    func showLoaderWith(message: String)
    
}

extension UIView: ActivityIndicator {
    
    func showLoader() {
        MBProgressHUD.showAdded(to: self, animated: true)
    }

    func hideLoader() {
        MBProgressHUD.hide(for: self, animated: true)
    }

    func showLoaderWith(message: String) {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.label.text = message
    }
    
}

extension UIViewController: ActivityIndicator {
    
    func showLoader() {
        self.view.showLoader()
    }
    
    func hideLoader() {
        self.view.hideLoader()
    }
    
    func showLoaderWith(message: String) {
        self.view.showLoaderWith(message: message)
    }
    
}