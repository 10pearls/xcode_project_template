// ___FILEHEADER___

import UIKit

extension UIViewController {
    
    var isModal: Bool {
        
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar || false
    }
    
    func push(Controller controller: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(controller, animated: animated)
    }
    
    func pop(animated: Bool = true) -> UIViewController? {
        return navigationController?.popViewController(animated: animated)
    }
    
    func present(controller: UIViewController) {
        present(controller, animated: true, completion: nil)
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
