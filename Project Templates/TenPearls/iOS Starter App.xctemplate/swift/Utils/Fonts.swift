// ___FILEHEADER___.

import Foundation
import UIKit

class Fonts {

    // MARK: - Fonts Method
    
    static func font(withType type: FontType, andFontSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.regular)
    }

}
