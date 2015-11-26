//
//  HPUIView.swift
//  Pods
//
//  Created by Huy Pham on 11/2/15.
//
//

import UIKit

@IBDesignable
public class HPView: UIView {
    
    var internalProxy: UIInternalProxy?
    
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        internalProxy = UIInternalProxy(subjectView: self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        internalProxy = UIInternalProxy(subjectView: self)
    }
    
    
    // MARK: Border
    
    @IBInspectable public var borderColor: UIColor? {
        didSet {
            self.internalProxy?.borderColor = self.borderColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            self.internalProxy?.borderWidth = self.borderWidth
        }
    }
    
    
    // MARK: Corner
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            self.internalProxy?.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable public var topLeftRounded: Bool = true {
        didSet {
            self.internalProxy?.topLeftRounded = self.topLeftRounded
        }
    }
    
    @IBInspectable public var topRightRounded: Bool = true {
        didSet {
            self.internalProxy?.topRightRounded = self.topRightRounded
        }
    }
    
    @IBInspectable public var botLeftRounded: Bool = true {
        didSet {
            self.internalProxy?.botLeftRounded = self.botLeftRounded
        }
    }
    
    @IBInspectable public var botRightRounded: Bool = true {
        didSet {
            self.internalProxy?.botRightRounded = self.botRightRounded
        }
    }
}

