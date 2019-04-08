// ___FILEHEADER___

import UIKit

class RootController: UIViewController {
    
    var current: UIViewController
    
    init() {
        self.current = LoginController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.current = LoginController()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildController(controller: current)
    }
    
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParentViewController: nil)
        addChildViewController(new)
        new.view.frame = view.bounds
        
        transition(from: current,
                   to: new,
                   duration: 0.3,
                   options: [.transitionCrossDissolve, .curveEaseOut],
                   animations: nil,
                   completion: { [weak self] _ in
                    self?.current.removeFromParentViewController()
                    new.didMove(toParentViewController: self)
                    self?.current = new
                    completion?()
                   }
                )
    }
    
    func addChildController(controller: UIViewController) {
        addChildViewController(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParentViewController: self)
    }
}
