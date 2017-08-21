//
//  Utils.swift
//  Pods
//
//  Created by Huy Pham on 11/2/15.
//
//

import UIKit

class Utils {
    
    // MARK: Image Utils
    
    class func roundCorners(view: UIView, corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
        
        // Reset corner radius to make Bezier Path to work
        view.layer.cornerRadius = 0
    }
    
    class func imageWithSolidColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    // MARK: Image Utils
    
    class func localize(text: String) -> String? {
        return NSLocalizedString(text, comment: "")
    }
    
    class func localizeWithDefinedMode(text: String?) -> String? {
        guard let text = text else {
            return nil
        }
        
        switch HPUIViewExtensions.shared.localizationMode {
        case .ByKey, .ByContent:
            return Utils.localize(text: text)
        default:
            return text
        }
    }
}
