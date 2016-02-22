//
//  HPTextField.swift
//  Pods
//
//  Created by Huy Pham on 11/2/15.
//
//

import UIKit

@IBDesignable
public class HPTextField: UITextField {
    
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
    
    
    // MARK: Padding
    
    @IBInspectable public var paddingStart: Float = 0
    
    @IBInspectable public var paddingEnd: Float = 0
    
    @IBInspectable public var paddingTop: Float = 0
    
    @IBInspectable public var paddingBottom: Float = 0
    
    override public func textRectForBounds(bounds: CGRect) -> CGRect {
        return super.textRectForBounds(makeRectInset(bounds))
    }
    
    override public func editingRectForBounds(bounds: CGRect) -> CGRect {
        return super.editingRectForBounds(makeRectInset(bounds))
    }
    
    private func makeRectInset(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(CGFloat(paddingTop), CGFloat(paddingStart), CGFloat(paddingBottom), CGFloat(paddingEnd)))
    }

    
    // MARK: Placeholder
    
    @IBInspectable public var placeholderColor: UIColor? {
        didSet {
            let holderStr = NSAttributedString(string: self.placeholder!, attributes: [NSForegroundColorAttributeName: self.placeholderColor!])
            self.attributedPlaceholder = holderStr
        }
    }
    
    
    // MARK: Error Icon & Message
    
    public func setError(message: String) {
        let errorIcon = UIImageView(frame: CGRectMake(0, 0, 25, 25))
        errorIcon.contentMode = .ScaleAspectFit
        errorIcon.image = UIImage(named: "ic_error")
        
        self.rightView = errorIcon
        self.rightViewMode = .UnlessEditing
    }
}
