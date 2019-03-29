//  Created on 05/11/2018.

import Foundation

protocol CellConfigurable {
    
    associatedtype ModelType
    var model: ModelType? { get set }
    var indexpath: IndexPath? { get set }
    
    func configureWithModel(_ model: ModelType, indexpath: IndexPath)
    
}
