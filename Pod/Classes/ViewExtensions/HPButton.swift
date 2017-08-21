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
    
    
    // MARK: Background
    
    @IBInspectable public var bgColor: UIColor? {
        didSet {
            setBackgroundImage(Utils.imageWithSolidColor(color: self.bgColor!, size: self.bounds.size), for: .normal)
            setBackgroundImage(Utils.imageWithSolidColor(color: self.tintColor!, size: self.bounds.size), for: .highlighted)
        }
    }
    
    @IBInspectable public var bgImage: UIImage? {
        didSet {
            setBackgroundImage(bgImage, for: .normal)
            setBackgroundImage(bgImage, for: .highlighted)
        }
    }
    
    
    // MARK: Button Image
    
    public var buttonImageMode: UIViewContentMode? {
        didSet {
            self.imageView?.contentMode = self.buttonImageMode!
        }
    }
    
    @IBInspectable var btImageMode: String? {
        didSet {
            let mode = btImageMode?.replacingOccurrences(of: " ", with: "").lowercased()
            switch mode! {
                case "bottom":
                    self.buttonImageMode = .bottom
                case "bottomleft":
                    self.buttonImageMode = .bottomLeft
                case "bottomright":
                    self.buttonImageMode = .bottomRight
                case "center":
                    self.buttonImageMode = .center
                case "left":
                    self.buttonImageMode = .left
                case "redraw":
                    self.buttonImageMode = .redraw
                case "right":
                    self.buttonImageMode = .right
                case "aspectfill":
                    self.buttonImageMode = .scaleAspectFill
                case "aspectfit":
                    self.buttonImageMode = .scaleAspectFit
                case "scaletofill":
                    self.buttonImageMode = .scaleToFill
                case "top":
                    self.buttonImageMode = .top
                case "topleft":
                    self.buttonImageMode = .topLeft
                case "topright":
                    self.buttonImageMode = .topRight
                default:
                    self.buttonImageMode = .scaleAspectFit
            }
        }
    }
    
    @IBInspectable public var buttonImage: UIImage? {
        didSet {
            self.imageView?.contentMode = buttonImageMode ?? .scaleAspectFit
            
            self.contentHorizontalAlignment = .fill
            self.contentVerticalAlignment = .fill
            
            setImage(self.buttonImage!, for: .normal)
            setImage(self.buttonImage!, for: .highlighted)
        }
    }
}
