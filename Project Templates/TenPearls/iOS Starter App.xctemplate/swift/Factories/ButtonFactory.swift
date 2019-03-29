//  Created on 29/03/2019.

import UIKit

class ButtonFactory: NSObject {

    // MARK: - For Navigation bar Buttons
    class func getNavBarButtonFrom(navBarItem: NavigationBarItem) -> UIButton {
        
        let barItemButton = UIButton(type: .custom)
        barItemButton.setImage(navBarItem.image, for: .normal)
        barItemButton.setTitle(navBarItem.title, for: .normal)
        barItemButton.setTitleColor(UIColor.black, for: .normal)
        barItemButton.addTarget(navBarItem.target, action: navBarItem.onClickSelector, for: .touchUpInside)
        barItemButton.tag = navBarItem.tag ?? 0
        barItemButton.sizeToFit()
        return barItemButton
    }
    
}
