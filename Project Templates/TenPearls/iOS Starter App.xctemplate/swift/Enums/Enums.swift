// ___FILEHEADER___.

import Foundation
import UIKit

enum FontType: String {
    
    case light = "SFProDisplay-Light"
    case regular = "SFProDisplay-Regular"
    case medium = "SFProDisplay-Medium"
    case semiBold = "SFProDisplay-Semibold"
    case bold = "SFProDisplay-Bold"
    
}

enum BarItemType {
    
    case titleButton(title: String)
    case imageButton(image: UIImage)
    
}
