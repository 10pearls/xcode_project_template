//___FILEHEADER___

import UIKit

class ButtonFactory: NSObject {

    // MARK: - For Navigation bar Buttons
    class func getNavBarButtonFrom(navBarItem: NavigationBarItem) -> UIButton {
                
        let barItemButton = UIButton(type: .custom)
        barItemButton.setTitle(navBarItem.title, for: .normal)
        barItemButton.setTitleColor(UIColor.black, for: .normal)
        barItemButton.addTarget(for: .touchUpInside, navBarItem.onClickSelector)
        barItemButton.tag = navBarItem.tag ?? 0
        barItemButton.sizeToFit()
        return barItemButton
    }
}

// MARK: - Clouser + UIButton Target
class ClosureSleeve {
    let closure: NavButtonSelector

    init (_ closure: @escaping NavButtonSelector) {
        self.closure = closure
    }

    @objc
    func invoke () {
        closure()
    }
}

// MARK: - UIButton Target
extension UIButton {
    func addTarget(for controlEvents: UIControlEvents, _ closure: @escaping NavButtonSelector) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
