//  Created on ___DATE___.

import UIKit

class CollectionViewCell: UICollectionViewCell, NibLoadable, ReusableView {

    class func instance<T: CollectionViewCell>() -> T {
        
        guard let cell = Bundle.main.loadNibNamed(T.NibName, owner: self, options: nil)?[0] as? T else {
            fatalError("Could not load Cell with Nib Name: \(T.NibName)")
        }
        
        return cell
    }
}
