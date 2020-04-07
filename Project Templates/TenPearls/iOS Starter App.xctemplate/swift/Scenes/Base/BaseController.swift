// ___FILEHEADER___

import UIKit

class BaseController: UIViewController, ErrorHandling, NavigationBarProtocol {

    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadView(viewName: self.getViewName())
        self.setupNavigationBar()
        (self.view as? BaseView)?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        (self.view as? BaseView)?.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        (self.view as? BaseView)?.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        (self.view as? BaseView)?.viewWillDisappear()
    }
    
    // MARK: - Back/Hamburger Button handling
    
    func createBackBarButton() -> NavigationBarItem {
        let menuButton = NavigationBarItem(type: .imageButton(image: UIImage(named: "back-btn")), target: self, onClickSelector: #selector(onActionBack(sender:)))
        return menuButton
    }
    
    @objc
    func onActionBack(sender: UIBarButtonItem) {
        if isModal {
            dismiss(animated: true, completion: nil)
        } else {
            _ = pop()
        }
    }
    
    func createMenuBarButton() -> NavigationBarItem {
        let menuButton = NavigationBarItem(type: .imageButton(image: UIImage(named: "menu-btn")), target: self, onClickSelector: #selector(onMenuButtonTapped))
        return menuButton
    }
    
    @objc
    func onMenuButtonTapped() {
    }
    
    // MARK: - Navigation Bar Protocol Implementation
    func navigationBarRightButtons() -> [NavigationBarItem] {
        return []
    }
    
    func navigationBarLeftButtons() -> [NavigationBarItem] {
        return []
    }
}
