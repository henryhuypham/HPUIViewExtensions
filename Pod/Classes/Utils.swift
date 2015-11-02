//
//  Utils.swift
//  Pods
//
//  Created by Huy Pham on 11/2/15.
//
//

import UIKit

class Utils {
    class func roundCorners(view: UIView, corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        view.layer.mask = mask
        
        // Reset corner radius to make Bezier Path to work
        view.layer.cornerRadius = 0
    }
}