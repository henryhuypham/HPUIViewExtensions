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
    
    var borderColor: UIColor? {
        didSet {
            self.subjectView!.layer.borderColor = self.borderColor?.CGColor
        }
    }
    
    var borderWidth: CGFloat = 0 {
        didSet {
            self.subjectView!.layer.borderWidth = self.borderWidth
        }
    }
    
    
    // MARK: Corner
    
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.subjectView!.layer.cornerRadius = self.cornerRadius
            self.subjectView!.layer.masksToBounds = true
        }
    }
    
    var topLeftRounded: Bool = true {
        didSet {
            Utils.roundCorners(self.subjectView!, corners: getRoundedConfig(), radius: self.cornerRadius)
        }
    }
    
    var topRightRounded: Bool = true {
        didSet {
            Utils.roundCorners(self.subjectView!, corners: getRoundedConfig(), radius: self.cornerRadius)
        }
    }
    
    var botLeftRounded: Bool = true {
        didSet {
            Utils.roundCorners(self.subjectView!, corners: getRoundedConfig(), radius: self.cornerRadius)
        }
    }
    
    var botRightRounded: Bool = true {
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
