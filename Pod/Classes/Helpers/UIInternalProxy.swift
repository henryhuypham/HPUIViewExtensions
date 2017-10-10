//
//  UIInternalProxyObject.swift
//  Pods
//
//  Created by Huy Pham on 11/2/15.
//
//

import Foundation

class UIInternalProxy {
    
    weak var subjectView: UIView?
    
    required init(subjectView: UIView) {
        self.subjectView = subjectView
    }
    
    
    // MARK: Border
    
    var borderColor: UIColor? {
        didSet {
            guard let subjectView = subjectView else {
                return
            }
            subjectView.layer.borderColor = self.borderColor?.cgColor
        }
    }
    
    var borderWidth: CGFloat = 0 {
        didSet {
            guard let subjectView = subjectView else {
                return
            }
            subjectView.layer.borderWidth = self.borderWidth
        }
    }
    
    
    // MARK: Corner
    
    var cornerRadius: CGFloat = 0 {
        didSet {
            guard let subjectView = subjectView else {
                return
            }
            subjectView.layer.cornerRadius = self.cornerRadius
            subjectView.layer.masksToBounds = true
        }
    }
    
    var topLeftRounded: Bool = true {
        didSet {
            guard let subjectView = subjectView else {
                return
            }
            Utils.roundCorners(view: subjectView, corners: getRoundedConfig(), radius: self.cornerRadius)
        }
    }
    
    var topRightRounded: Bool = true {
        didSet {
            guard let subjectView = subjectView else {
                return
            }
            Utils.roundCorners(view: subjectView, corners: getRoundedConfig(), radius: self.cornerRadius)
        }
    }
    
    var botLeftRounded: Bool = true {
        didSet {
            guard let subjectView = subjectView else {
                return
            }
            Utils.roundCorners(view: subjectView, corners: getRoundedConfig(), radius: self.cornerRadius)
        }
    }
    
    var botRightRounded: Bool = true {
        didSet {
            guard let subjectView = subjectView else {
                return
            }
            Utils.roundCorners(view: subjectView, corners: getRoundedConfig(), radius: self.cornerRadius)
        }
    }
    
    
    // MARK: Helpers
    
    private func getRoundedConfig() -> UIRectCorner {
        var corners: UIRectCorner = []
        
        if self.topLeftRounded {
            corners = corners.union(.topLeft)
        }
        if self.topRightRounded {
            corners = corners.union(.topRight)
        }
        if self.botLeftRounded {
            corners = corners.union(.bottomLeft)
        }
        if self.botRightRounded {
            corners = corners.union(.bottomRight)
        }
        
        return corners
    }
}
