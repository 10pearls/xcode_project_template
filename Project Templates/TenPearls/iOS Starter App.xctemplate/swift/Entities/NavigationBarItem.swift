//  Created on 10/17/18.

import UIKit

class NavigationBarItem: NSObject {
    
    // MARK: - Members
    var title: String?
    var image: UIImage?
    var tag: Int?
    var onClickSelector: Selector
    var target: Any
    
    // MARK: - Constructors
    init(title: String?, image: UIImage?, tag: Int?, target: Any, onClickSelector: Selector) {
        self.title = title
        self.image = image
        self.tag = tag
        self.onClickSelector = onClickSelector
        self.target = target
        
        super.init()
    }
    
    convenience init(title: String, tag: Int, target: Any, onClickSelector: Selector) {
        self.init(title: title, image: nil, tag: tag, target: target, onClickSelector: onClickSelector)
    }
    
    convenience init(image: UIImage, tag: Int, target: Any, onClickSelector: Selector) {
        self.init(title: nil, image: image, tag: tag, target: target, onClickSelector: onClickSelector)
    }
    
    convenience init(title: String, target: Any, onClickSelector: Selector) {
        self.init(title: title, image: nil, tag: nil, target: target, onClickSelector: onClickSelector)
    }
    
    convenience init(image: UIImage, target: Any, onClickSelector: Selector) {
        self.init(title: nil, image: image, tag: nil, target: target, onClickSelector: onClickSelector)
    }
}
