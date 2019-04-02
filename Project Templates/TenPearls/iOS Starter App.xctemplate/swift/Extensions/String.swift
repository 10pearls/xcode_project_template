// ___FILEHEADER___.

import UIKit

extension String {

    func toClass() -> AnyClass? {
        
        if let info = Bundle.main.infoDictionary {
            
            guard let targetName: String = info["CFBundleName"] as? String, info["CFBundleName"] is String else {
                return nil
            }
            
            let className = "\(targetName).\(self)"
            return NSClassFromString(className)
        }
        return nil
    }
    
}
