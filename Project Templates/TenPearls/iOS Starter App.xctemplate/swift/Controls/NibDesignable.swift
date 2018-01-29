//___FILEHEADER___

import UIKit
@IBDesignable
class NibDesignable: BaseView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        nibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nibSetup()
    }
}

extension NibDesignable {
    
    func nibSetup() {
        
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibObject: Any? = nib.instantiate(withOwner: self, options: nil).first
        
        guard let nibView: UIView = nibObject as? UIView, nibObject is UIView else {
            fatalError("nib could not be loaded")
        }
        
        return nibView
    }
}
