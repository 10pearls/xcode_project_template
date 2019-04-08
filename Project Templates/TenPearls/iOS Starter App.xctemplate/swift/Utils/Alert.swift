// ___FILEHEADER___

import Foundation
import UIKit

class Alert {
    
    class func show(title: String, message: String, okTitle: String, cancelTitle: String?, completionBlock:@escaping (_ okPressed: Bool) -> Void) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if !okTitle.isEmpty {
            let okAction = UIAlertAction(title: okTitle, style: .default) { _ in
                completionBlock(true)
            }
            
            alertController.addAction(okAction)
        }
        
        if let cancel = cancelTitle {
            let cancelOption = UIAlertAction(title: cancel, style: .cancel, handler: { _ in
                completionBlock(false)
            })
            alertController.addAction(cancelOption)
        }
        
        if let topController = AppDelegate.instance?.window?.rootViewController {
            topController.present(alertController, animated: true, completion: nil)
        }
        
        return alertController
    }
    
    class func show(title: String, message: String, completionBlock:@escaping (_ okPressed: Bool) -> Void) -> UIAlertController {
        return self.show(title: title, message: message, okTitle: "OK", cancelTitle: nil, completionBlock: completionBlock)
    }
    
    class func show(title: String, message: String) -> UIAlertController {
        return self.show(title: title, message: message, okTitle: "OK", cancelTitle: nil) { _ in
            
        }
    }
    
}
