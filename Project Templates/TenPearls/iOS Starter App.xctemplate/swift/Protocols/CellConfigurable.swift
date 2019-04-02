// ___FILEHEADER___.

import Foundation

protocol CellConfigurable {
    
    associatedtype ModelType
    var model: ModelType? { get set }
    var indexpath: IndexPath? { get set }
    
    func configureWithModel(_ model: ModelType, indexpath: IndexPath)
    
}
