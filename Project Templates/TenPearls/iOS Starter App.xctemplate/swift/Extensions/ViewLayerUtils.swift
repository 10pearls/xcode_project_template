// ___FILEHEADER___.

import UIKit

extension UIView {

    func setShadow(color: UIColor = UIColor.black, radius: CGFloat = 1.0, opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
    
    func setRounded() {
        let radius = frame.width / 2
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func setBorder(color: UIColor = UIColor.black, width: CGFloat = 0.5) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func addDashedBorder(color: UIColor = UIColor.red) {
        
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = [6, 3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath
        self.layer.addSublayer(shapeLayer)
    }

    func setCornerRadius(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat, bounds: CGRect) {        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
