//___FILEHEADER___

import UIKit

protocol NavigationBarProtocol {
    func navigationBarRightButtons() -> [NavigationBarItem]
    func navigationBarLeftButtons() -> [NavigationBarItem]
}
