//  Created on 29/03/2019.

import UIKit

class Label: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFont()
    }
    
}

extension UILabel {
    
    func setFont() {
        if let face = font.fontDescriptor.object(forKey: .face) as? String {
            switch face {
            case "Regular":
                font = Fonts.regularFontWithSize(fontSize: font.pointSize)
            case "Bold":
                font = Fonts.boldFontWithSize(fontSize: font.pointSize)
            case "Light":
                font = Fonts.lightFontWithSize(fontSize: font.pointSize)
            case "Medium":
                font = Fonts.mediumFontWithSize(fontSize: font.pointSize)
            case "Semibold":
                font = Fonts.semiBoldFontWithSize(fontSize: font.pointSize)
            default:
                font = Fonts.regularFontWithSize(fontSize: font.pointSize)
            }
        }
    }
    
}
