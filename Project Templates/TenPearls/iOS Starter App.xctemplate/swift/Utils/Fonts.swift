// ___FILEHEADER___

import Foundation
import UIKit

class Fonts {

    // MARK: - Fonts
    
    private static let appFonts = ["Light": "SFProDisplay-Light",
                                   "Regular": "SFProDisplay-Regular",
                                   "Medium": "SFProDisplay-Medium",
                                   "SemiBold": "SFProDisplay-Semibold",
                                   "Bold": "SFProDisplay-Bold"]
    
    // MARK: - Fonts Method
    
    static func font(face: String = "Regular", fontSize: CGFloat) -> UIFont {
        guard let fontName = appFonts[face], let font = UIFont(name: fontName, size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.regular)
        }
        
        return font
    }
    
}

