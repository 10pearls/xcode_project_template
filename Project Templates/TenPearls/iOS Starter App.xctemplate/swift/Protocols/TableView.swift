// ___FILEHEADER___

import Foundation
import UIKit

protocol TableViewCellProtocol {
    
    associatedtype TYPE
    var model: TYPE? { get set }
    var indexPath: IndexPath? { get set }
    func configureWithModel(_: TYPE, indexPath: IndexPath)
}

protocol TableViewCompatible {
    
    var reuseIdentifier: String { get }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath, actionButtons: [UIButton]?) -> UITableViewCell
    
}

class TableView: UITableView {
    
    var data: [TableViewCompatible]?
    
}

extension TableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let unwrapData = data {
            return unwrapData.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let unwrapData = data {
            let model = unwrapData[indexPath.row]
            return model.cellForTableView(tableView: tableView, atIndexPath: indexPath, actionButtons: nil)
        }

        return UITableViewCell()
    }
    
}
