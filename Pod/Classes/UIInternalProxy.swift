//
//  UIInternalProxyObject.swift
//  Pods
//
//  Created by Huy Pham on 11/2/15.
//
//

import Foundation

class UIInternalProxy {
    
    var subjectView: UIView?
    
    required init(subjectView: UIView) {
        self.subjectView = subjectView
    }
    
    // MARK: Border
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.subjectView!.layer.borderColor = self.borderColor?.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.subjectView!.layer.borderWidth = self.borderWidth
        }
    }
    
    
    // MARK: Corner
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.subjectView!.layer.cornerRadius = self.cornerRadius
            self.subjectView!.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var topLeftRounded: Bool = true {
        didSet {
            Utils.roundCorners(self.subjectView!, corners: getRoundedConfig(), radius: self.cornerRadius)
        }
    }
    
    @IBInspectable var topRightRounded: Bool = true {
        didSet {
            Utils.roundCorners(self.subjectView!, corners: getRoundedConfig(), radius: self.cornerRadius)
        }
    }
    
    @IBInspectable var botLeftRounded: Bool = true {
        didSet {
            Utils.roundCorners(self.subjectView!, corners: getRoundedConfig(), radius: self.cornerRadius)
        }
    }
    
    @IBInspectable var botRightRounded: Bool = true {
        didSet {
            Utils.roundCorners(self.subjectView!, corners: getRoundedConfig(), radius: self.cornerRadius)
        }
    }
    
    
    // MARK: Helpers
    
    private func getRoundedConfig() -> UIRectCorner {
        var corners: UIRectCorner = []
        
        if self.topLeftRounded {
            corners = corners.union(.TopLeft)
        }
        if self.topRightRounded {
            corners = corners.union(.TopRight)
        }
        if self.botLeftRounded {
            corners = corners.union(.BottomLeft)
        }
        if self.botRightRounded {
            corners = corners.union(.BottomRight)
        }
        
        return corners
    }
}
