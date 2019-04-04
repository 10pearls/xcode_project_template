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
            font = Fonts.font(face: face, fontSize: font.pointSize)
        }
        
    }
    
}
