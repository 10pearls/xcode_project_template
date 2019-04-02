// ___FILEHEADER___.

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
                font = Fonts.font(withType: .regular, andFontSize: font.pointSize)
            case "Bold":
                font = Fonts.font(withType: .bold, andFontSize: font.pointSize)
            case "Light":
                font = Fonts.font(withType: .light, andFontSize: font.pointSize)
            case "Medium":
                font = Fonts.font(withType: .medium, andFontSize: font.pointSize)
            case "Semibold":
                font = Fonts.font(withType: .semiBold, andFontSize: font.pointSize)
            default:
                font = Fonts.font(withType: .regular, andFontSize: font.pointSize)
            }
        }
    }
    
}
