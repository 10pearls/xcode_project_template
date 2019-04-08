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
        current.willMove(toParent: nil)
        addChild(new)
        new.view.frame = view.bounds
        
        transition(from: current,
                   to: new,
                   duration: 0.3,
                   options: [.transitionCrossDissolve, .curveEaseOut],
                   animations: nil,
                   completion: { [weak self] _ in
                    self?.current.removeFromParent()
                    new.didMove(toParent: self)
                    self?.current = new
                    completion?()
                   }
                )
    }
    
    func addChildController(controller: UIViewController) {
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }
}