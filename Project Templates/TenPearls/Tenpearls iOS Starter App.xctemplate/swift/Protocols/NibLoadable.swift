//  Created on ___DATE___.

import UIKit

protocol NibLoadable: class { }

extension NibLoadable where Self: UIView {
    
    static var NibName: String {
        return String(describing: self)
    }
}
