//___FILEHEADER___.

import Foundation
import UIKit

extension BaseController {

    // MARK: - Navigation Bar Handling
    
    func setupNavigationBar() {
        setupRightNavigationButtons(rightBarButtons: navigationBarRightButtons())
        setupLeftNavigationButtons(leftBarButtons: navigationBarLeftButtons())

        //Do everything else with the Nav Bar here...
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
    
    // MARK: - Back/Hamburger Creation
    
    func createBackBarButton() -> NavigationBarItem {
        return NavigationBarItem(type: .imageButton(image: #imageLiteral(resourceName: "back_arrow")),
                                 target: self,
                                 onClickSelector: #selector(onActionBack(sender:)))
    }
    
    func createMenuBarButton() -> NavigationBarItem {
        return NavigationBarItem(type: .imageButton(image: #imageLiteral(resourceName: "back_arrow")),
                                 target: self,
                                 onClickSelector: #selector(onMenuButtonTapped))
    }
    
    // MARK: - Actions For Back/Ham burger menu
    
    @objc
    func onActionBack(sender: UIBarButtonItem) {
        if isModal {
            dismiss()
            return
        }
        
        _ = pop()
    }
    
    @objc
    func onMenuButtonTapped() {
        //Do the Menu Toggling here...
    }
    
}
