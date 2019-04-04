// ___FILEHEADER___.

import UIKit
import MBProgressHUD

class BaseController: UIViewController {

    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadView(viewName: self.getViewName())
        self.setupNavigationBar()
        (self.view as? BaseView)?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
        
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
    
}

//MARK: - Navigation Bar Protocol Implementation

extension BaseController: NavigationBarProtocol {
    
    func navigationBarRightButtons() -> [NavigationBarItem] {
        return [] //Will be overriden by individual Controllers
    }
    
    func navigationBarLeftButtons() -> [NavigationBarItem] {
        return [] //Will be overriden by individual Controllers
    }
    
}

// MARK: - Activity Indicator Implementation

extension BaseController: ActivityIndicator {
    
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