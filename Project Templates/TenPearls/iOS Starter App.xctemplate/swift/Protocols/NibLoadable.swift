// ___FILEHEADER___.

import UIKit

protocol NibLoadable { }

extension NibLoadable where Self: UIView {
    
    static var NibName: String {
        return String(describing: self)
    }
    
    static var Nib: UINib {
        return UINib(nibName: NibName, bundle: nil)
    }
    
}
