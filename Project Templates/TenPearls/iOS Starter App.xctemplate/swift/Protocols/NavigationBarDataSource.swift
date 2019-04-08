// ___FILEHEADER___

import UIKit

protocol NavigationBarProtocol {
    
    func setupNavigationBar()
    func navigationBarRightButtons() -> [NavigationBarItem]
    func navigationBarLeftButtons() -> [NavigationBarItem]
    
}

extension NavigationBarProtocol where Self: BaseController {
    
    // MARK: - Navigation Bar Handling
    
    func setupNavigationBar() {
        setupRightNavigationButtons(rightBarButtons: navigationBarRightButtons())
        setupLeftNavigationButtons(leftBarButtons: navigationBarLeftButtons())

        //Do everything else with the Nav Bar here...
    }
    
    func navigationBarRightButtons() -> [NavigationBarItem] {
        return []
    }
    
    func navigationBarLeftButtons() -> [NavigationBarItem] {
        return []
    }
    
    private func setupRightNavigationButtons(rightBarButtons: [NavigationBarItem]) {
        navigationItem.setRightBarButtonItems(nil, animated: false)
        navigationItem.setRightBarButtonItems(self.createNavigationBarItems(navBarItems: rightBarButtons), animated: true)
    }
    
    private func setupLeftNavigationButtons(leftBarButtons: [NavigationBarItem]) {
        navigationItem.setLeftBarButtonItems(nil, animated: false)
        navigationItem.setLeftBarButtonItems(self.createNavigationBarItems(navBarItems: leftBarButtons), animated: true)
    }
    
    // MARK: - UIBarButton Creation
    
    private func createNavigationBarItems(navBarItems: [NavigationBarItem]) -> [UIBarButtonItem] {
        var barButtonItems = [UIBarButtonItem]()
        
        barButtonItems.append(contentsOf: navBarItems.map({ self.getBarButtonFrom(navBarItem: $0) }))
        
        return barButtonItems
    }
    
    private func getBarButtonFrom(navBarItem: NavigationBarItem) -> UIBarButtonItem {
        return UIBarButtonItem(customView: ButtonFactory.getNavBarButtonFrom(navBarItem: navBarItem))
    }
    
}