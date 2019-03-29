//  Created on 29/03/2019.

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
    
    var data = [TableViewCompatible]()
    
}

extension TableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = data[indexPath.row]
        return model.cellForTableView(tableView: tableView, atIndexPath: indexPath, actionButtons: nil)
    }
    
}
