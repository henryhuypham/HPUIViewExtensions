//
//  ViewController.swift
//  HPUIViewExtensions
//
//  Created by Huy Pham on 11/02/2015.
//  Copyright (c) 2015 Huy Pham. All rights reserved.
//

import UIKit
import HPUIViewExtensions

class ViewController: UIViewController {
    @IBOutlet weak var imageButton: HPButton!
    @IBOutlet weak var label: HPLabel!
    @IBOutlet weak var labelHeight: NSLayoutConstraint!
    @IBOutlet weak var textField: HPTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.setError("Hahaha")
    }
}

