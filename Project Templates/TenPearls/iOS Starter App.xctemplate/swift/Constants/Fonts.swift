//  Created on 13/07/2018.

import Foundation
import UIKit

class Fonts {

    // MARK: - Fonts Method
    static func regularFontWithSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: FontType.regular.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.regular)
    }

    static func boldFontWithSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: FontType.bold.rawValue, size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }

    static func lightFontWithSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: FontType.light.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.light)
    }

    static func semiBoldFontWithSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: FontType.semiBold.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.semibold)
    }

    static func mediumFontWithSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: FontType.medium.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.medium)
    }
}
