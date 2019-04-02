// ___FILEHEADER___.

import UIKit

class Appearance: NSObject {
    
    class func setTransparentNavigationBar() {
        UINavigationBar.appearance().backgroundColor = UIColor.clear
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor.clear
    }
    
    class func defaultTheme() {
        setupNavigationBar()
        setupTabBar()
        setupTabBarItem()
    }
    
    class func setupNavigationBar() {
        let navAppearance = UINavigationBar.appearance()
        navAppearance.tintColor = UIColor.black
    }
    
    class func setupTabBar() {
        let appearance = UITabBar.appearance()
        appearance.itemPositioning = .centered
        appearance.itemSpacing = 0
        appearance.tintColor = UIColor.black
        
        if #available(iOS 10.0, *) {
            appearance.unselectedItemTintColor = UIColor.gray
        }
    }
    
    class func setupTabBarItem() {
        let appearance = UITabBarItem.appearance()
        
        appearance.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.gray], for: .normal)
        appearance.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.black], for: .selected)
    }
    
    class func setStatusBarBackgroundColor(color: UIColor) {
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {
            return
        }
        
        statusBar.backgroundColor = color
    }
    
}
