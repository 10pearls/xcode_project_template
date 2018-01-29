//___FILEHEADER___

import Foundation
import UIKit

extension BaseController {

    // MARK: - Navigation Bar Handling
    func setupNavigationBar() {
        setupRightNavigationButtons(rightBarButtons: self.navigationBarRightButtons())
        setupLeftNavigationButtons(leftBarButtons: self.navigationBarLeftButtons())

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

    private func createNavigationBarItems(navBarItems: [NavigationBarItem]) -> [UIBarButtonItem] {
        var barButtonItems = [UIBarButtonItem]()
        
        barButtonItems.append(contentsOf: navBarItems.map({ self.getBarButtonFrom(navBarItem: $0) }))

        return barButtonItems
    }

    private func getBarButtonFrom(navBarItem: NavigationBarItem) -> UIBarButtonItem {
        return UIBarButtonItem(customView: ButtonFactory.getNavBarButtonFrom(navBarItem: navBarItem))
    }
    
    func createBackBarButton() {
        
        let backImage = #imageLiteral(resourceName: "slider_back")
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(onActionBack(sender:)))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc
    func onActionBack(sender: UIBarButtonItem) {
        
        if isModal() {
            dismissViewController()
        } else {
            popViewController()
        }
    }
}
