// ___FILEHEADER___

import UIKit

extension BaseController {
    
    func getViewName() -> String {
        let file = String(describing: type(of: self)).split(separator: ".").last!
        if !file.hasSuffix("Controller") {
            throwException(message: "Invalid class name. Name should end with string 'controller' (e.g. SampleController)")
        }
        
        return file.replacingOccurrences(of: "Controller", with: "View")
    }
    
    func loadView(viewName: String) {
        if Bundle.main.path(forResource: viewName, ofType: "nib") == nil {
            throwException(message: "\(viewName) nib/class not found in project.")
        }
        let nibs: UINib = UINib(nibName: viewName, bundle: nil)
        
        var array: [AnyObject] = nibs.instantiate(withOwner: nil, options: nil) as [AnyObject]
        if array.isEmpty {
            throwException(message: "\(viewName) nib doesn't have any view (IB error)")
        }
        
        if !(array[0] is BaseView) {
            throwException(message: "\(viewName) nib should be subclass of \(viewName) -> BaseView (IB error).")
        }
        
        let view: BaseView = (array[0] as? BaseView)!
        view.controller = self
        self.view = view
    }
    
}
