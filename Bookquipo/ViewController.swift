//
//  ViewController.swift
//  Bookquipo
//
//  Created by Elmy on 24/11/20.
//  Copyright © 2020 Elmy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = true
        let myColor = UIColor.white
        emailView.layer.borderColor = myColor.cgColor
        passwordView.layer.borderColor = myColor.cgColor

        emailView.layer.borderWidth = 1.0
        passwordView.layer.borderWidth = 1.0
    }
}

