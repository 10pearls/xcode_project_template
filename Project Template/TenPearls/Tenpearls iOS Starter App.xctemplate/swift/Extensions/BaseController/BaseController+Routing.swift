//  Created on ___DATE___.

import UIKit

extension BaseController {
    
    func push(Controller controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func present(Controller controller: UIViewController) {
        present(controller, animated: true, completion: nil)
    }
    
    func popViewController() {
       _ = navigationController?.popViewController(animated: true)
    }
    
    func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    func isModal() -> Bool {
        
        if let presentingController = presentingViewController {
            
            if presentingController is UINavigationController {
                return false
            }
            return true
        }
        if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController {
            return true
        }
        if self.tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        
        return false
    }
}
