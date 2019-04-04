// ___FILEHEADER___.

import UIKit

class TextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Find a way to set up fonts
        
        setFont()
    }
    
}

extension UITextField {
    
    func setFont() {
        if let face = font?.fontDescriptor.object(forKey: .face) as? String, let pointSize = font?.pointSize  {
            font = Fonts.font(face: face, fontSize: pointSize)
        }
        
    }
    
}
