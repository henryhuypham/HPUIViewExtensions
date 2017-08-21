//
//  HPLabel.swift
//  Pods
//
//  Created by Huy Pham on 11/2/15.
//
//

import UIKit

@IBDesignable
public class HPLabel: UILabel {
    
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
    
    
    // MARK: Text
    
    override public var text: String? {
        get {
            return super.text
        }
        
        set(newText) {
            super.text = Utils.localizeWithDefinedMode(text: newText)
        }
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
    
    
    // MARK: Padding
    
    @IBInspectable public var paddingStart: Float = 0
    
    @IBInspectable public var paddingEnd: Float = 0
    
    @IBInspectable public var paddingTop: Float = 0
    
    @IBInspectable public var paddingBottom: Float = 0
    
    override public func drawText(in rect: CGRect) {
        super.drawText(in: makeRectInset(bounds: bounds))
    }
    
    override public func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        return super.textRect(forBounds: makeRectInset(bounds: bounds), limitedToNumberOfLines: numberOfLines)
    }
    
    private func makeRectInset(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(CGFloat(paddingTop), CGFloat(paddingStart), CGFloat(paddingBottom), CGFloat(paddingEnd)))
    }
    
    public override func didMoveToWindow() {
        for ct: NSLayoutConstraint in self.constraints {
            if type(of: ct) !== NSLayoutConstraint.self {
                continue
            }
            if (ct.firstAttribute == NSLayoutAttribute.height && ct.firstItem as? HPLabel == self) || (ct.secondAttribute == NSLayoutAttribute.height && ct.secondItem as? HPLabel == self) {
                print(ct.constant)
                ct.constant += (CGFloat(paddingTop) + CGFloat(paddingBottom))
                break
            }
        }
    }
}
