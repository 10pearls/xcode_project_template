// ___FILEHEADER___

import UIKit

class TextView: UITextView {
    
    // MARK: - Life Cycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    private func initialize() {
        setFont()
    }
    
}

extension UITextView {
    
    func setFont() {
        if let face = font?.fontDescriptor.object(forKey: .face) as? String, let pointSize = font?.pointSize  {
            font = Fonts.font(face: face, fontSize: pointSize)
        }
        
    }
    
}
