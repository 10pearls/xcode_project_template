//___FILEHEADER___

import UIKit

class TableViewCell: UITableViewCell, NibLoadable, ReusableView {

    var cellData: AnyObject?
    var cellIndex: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func instance<T: TableViewCell>() -> T {
        
        guard let cell = Bundle.main.loadNibNamed(T.NibName, owner: self, options: nil)?[0] as? T else {
            fatalError("Could not load Cell with Nib Name: \(T.NibName)")
        }
        
        return cell
    }
    
    func updateData(_ data: AnyObject) {
        cellData = data
    }
    
    func updateDate(_ data: AnyObject, indexPath: IndexPath) {
        cellData = data
        cellIndex = indexPath
    }
}
