//
//  HPUIViewExtensions.swift
//  Pods
//
//  Created by Henry Pham on 8/18/17.
//
//

import Foundation

public enum LocalizationMode {
    case None
    case ByKey
    case ByContent
}

public class HPUIViewExtensions {
    
    private static var sharedInstance: HPUIViewExtensions!
    
    public var localizationMode: LocalizationMode = .None
    
    public class var shared: HPUIViewExtensions {
        get {
            objc_sync_enter(self)
            defer {
                objc_sync_enter(self)
            }
            
            sharedInstance = sharedInstance ?? {
                return HPUIViewExtensions()
            }()
            
            return sharedInstance
        }
    }
}
