//___FILEHEADER___

import UIKit

typealias NavButtonSelector = () -> Void

class NavigationBarItem: NSObject {

    // MARK: - Members
    var title: String?
    var imageName: String?
    var tag: Int?
    var onClickSelector: NavButtonSelector

    // MARK: - Constructors
    init(title: String?, imageName: String?, tag: Int?, onClickSelector: @escaping NavButtonSelector) {
        self.title = title
        self.imageName = imageName
        self.tag = tag
        self.onClickSelector = onClickSelector

        super.init()
    }

    convenience init(title: String, tag: Int, onClickSelector: @escaping NavButtonSelector) {
        self.init(title: title, imageName: nil, tag: tag, onClickSelector: onClickSelector)
    }

    convenience init(imageName: String, tag: Int, onClickSelector: @escaping NavButtonSelector) {
        self.init(title: nil, imageName: imageName, tag: tag, onClickSelector: onClickSelector)
    }

    convenience init(title: String, onClickSelector: @escaping NavButtonSelector) {
        self.init(title: title, imageName: nil, tag: nil, onClickSelector: onClickSelector)
    }

    convenience init(imageName: String, onClickSelector: @escaping NavButtonSelector) {
        self.init(title: nil, imageName: imageName, tag: nil, onClickSelector: onClickSelector)
    }
}
