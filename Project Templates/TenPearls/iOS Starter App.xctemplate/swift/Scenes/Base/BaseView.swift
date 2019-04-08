// ___FILEHEADER___

import UIKit

class BaseView: UIView, ViewLifeCycle {

    weak var controller: BaseController?
    
    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var shadowRadius: Int = 0
    @IBInspectable var shadowColor: UIColor = UIColor.black
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setBorder()
        setCornerRadius()
        setShadowRadius()
    }
    
    func setBorder() {
        
        if borderWidth > 0 {
            self.layer.borderWidth = self.borderWidth
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    func setCornerRadius() {
        
        if self.cornerRadius > 0 {
            self.layer.cornerRadius = self.cornerRadius
            self.clipsToBounds = true
        }
    }
    
    func setShadowRadius() {
        
        if shadowRadius > 0 {
            
            self.layer.cornerRadius = self.cornerRadius
            self.layer.shadowColor = self.shadowColor.cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize.zero
            self.layer.shadowRadius = CGFloat(self.shadowRadius)
            self.layer.masksToBounds = false
        }
    }
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    func viewDidAppear() {
        
    }
    
    func viewWillDisappear() {
        
    }
}
