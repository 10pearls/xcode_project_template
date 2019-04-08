// ___FILEHEADER___

import UIKit

enum BarItemType {
    
    case titleButton(title: String)
    case imageButton(image: UIImage)
    
}

class NavigationBarItem: NSObject {
    
    // MARK: - Members
    
    var title: String?
    var image: UIImage?
    var tag: Int?
    var onClickSelector: Selector
    var target: Any
    
    // MARK: - Constructors
    
    init(type: BarItemType, tag: Int? = 0, target: Any, onClickSelector: Selector) {
        self.tag = tag
        self.onClickSelector = onClickSelector
        self.target = target
        
        switch type {
        case .titleButton(let title):
            self.title = title
        case .imageButton(let image):
            self.image = image
        }
        
        super.init()
    }
    
}

