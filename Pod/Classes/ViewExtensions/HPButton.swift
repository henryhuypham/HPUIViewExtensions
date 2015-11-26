//
//  HPButton.swift
//  Pods
//
//  Created by Huy Pham on 11/2/15.
//
//

import UIKit

@IBDesignable
public class HPButton: UIButton {
    
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
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.internalProxy?.borderColor = self.borderColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.internalProxy?.borderWidth = self.borderWidth
        }
    }
    
    
    // MARK: Corner
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.internalProxy?.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable var topLeftRounded: Bool = true {
        didSet {
            self.internalProxy?.topLeftRounded = self.topLeftRounded
        }
    }
    
    @IBInspectable var topRightRounded: Bool = true {
        didSet {
            self.internalProxy?.topRightRounded = self.topRightRounded
        }
    }
    
    @IBInspectable var botLeftRounded: Bool = true {
        didSet {
            self.internalProxy?.botLeftRounded = self.botLeftRounded
        }
    }
    
    @IBInspectable var botRightRounded: Bool = true {
        didSet {
            self.internalProxy?.botRightRounded = self.botRightRounded
        }
    }
    
    
    // MARK: Background
    
    @IBInspectable var bgColor: UIColor? {
        didSet {
            setBackgroundImage(Utils.imageWithSolidColor(self.bgColor!, size: self.bounds.size), forState: UIControlState.Normal)
            setBackgroundImage(Utils.imageWithSolidColor(self.tintColor!, size: self.bounds.size), forState: UIControlState.Highlighted)
        }
    }
    
    
    // MARK: Button Image
    
    var buttonImageMode: UIViewContentMode? {
        didSet {
            self.imageView?.contentMode = self.buttonImageMode!
        }
    }
    
    @IBInspectable var btImageMode: String? {
        didSet {
            let mode = btImageMode?.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString
            switch mode! {
                case "bottom":
                    self.buttonImageMode = UIViewContentMode.Bottom
                case "bottomleft":
                    self.buttonImageMode = UIViewContentMode.BottomLeft
                case "bottomright":
                    self.buttonImageMode = UIViewContentMode.BottomRight
                case "center":
                    self.buttonImageMode = UIViewContentMode.Center
                case "left":
                    self.buttonImageMode = UIViewContentMode.Left
                case "redraw":
                    self.buttonImageMode = UIViewContentMode.Redraw
                case "right":
                    self.buttonImageMode = UIViewContentMode.Right
                case "aspectfill":
                    self.buttonImageMode = UIViewContentMode.ScaleAspectFill
                case "aspectfit":
                    self.buttonImageMode = UIViewContentMode.ScaleAspectFit
                case "scaletofill":
                    self.buttonImageMode = UIViewContentMode.ScaleToFill
                case "top":
                    self.buttonImageMode = UIViewContentMode.Top
                case "topleft":
                    self.buttonImageMode = UIViewContentMode.TopLeft
                case "topright":
                    self.buttonImageMode = UIViewContentMode.TopRight
                default:
                    self.buttonImageMode = .ScaleAspectFit
            }
        }
    }
    
    @IBInspectable var buttonImage: UIImage? {
        didSet {
            self.imageView?.contentMode = buttonImageMode ?? .ScaleAspectFit
            
            self.contentHorizontalAlignment = .Fill
            self.contentVerticalAlignment = .Fill
            
            setImage(self.buttonImage!, forState: .Normal)
            setImage(self.buttonImage!, forState: .Highlighted)
        }
    }
}
