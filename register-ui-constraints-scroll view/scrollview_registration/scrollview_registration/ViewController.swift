//
//  ViewController.swift
//  scrollview_registration
//
//  Created by Iroid on 08/12/21.
//  Copyright © 2021 Iroid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var male_btn: UIButton!
    @IBOutlet weak var age_vfld: UIView!
    @IBOutlet weak var female_btn: UIButton!
    @IBOutlet weak var activity_fld: UIView!
    @IBOutlet weak var current_weightfld: UIView!
    @IBOutlet weak var height_fld: UIView!
    
    @IBOutlet weak var next_btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        male_btn.layer.cornerRadius=10
        male_btn.layer.borderWidth=1
        male_btn.layer.borderColor = UIColor.black.cgColor
        
        female_btn.layer.cornerRadius=10
        female_btn.layer.borderWidth=1
        female_btn.layer.borderColor = UIColor.black.cgColor
        
        age_vfld.layer.cornerRadius=25
        age_vfld.layer.borderWidth=1
        age_vfld.layer.borderColor=UIColor.black.cgColor
        
        activity_fld.layer.cornerRadius=25
        activity_fld.layer.borderWidth=1
        activity_fld.layer.borderColor=UIColor.black.cgColor
        
        current_weightfld.layer.cornerRadius=25
        current_weightfld.layer.borderWidth=1
        current_weightfld.layer.borderColor=UIColor.black.cgColor
        
        height_fld.layer.cornerRadius=25
        height_fld.layer.borderWidth=1
        height_fld.layer.borderColor=UIColor.black.cgColor
        
        next_btn.layer.cornerRadius=20
        next_btn.layer.borderWidth=1
        next_btn.layer.borderColor=UIColor.black.cgColor
    }


}

