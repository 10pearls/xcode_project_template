//___FILEHEADER___

import UIKit

class TableViewHeaderFooterView: UITableViewHeaderFooterView, NibLoadable, ReusableView {

    class func instance<T: TableViewHeaderFooterView>() -> T {
        
        guard let header = Bundle.main.loadNibNamed(T.NibName, owner: self, options: nil)?[0] as? T else {
            fatalError("Could not load Header with Nib Name: \(T.NibName)")
        }
        
        return header
    }
}
