//  Created on 19/09/2018.

import UIKit

class Button: UIButton {
    
    // MARK: - Life Cycle Methods
    
    init(image: UIImage, state: UIControl.State) {
        super.init(frame: CGRect.zero)
        setImage(image, for: state)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    private func initialize() {
        titleLabel?.setFont()
    }
    
}
