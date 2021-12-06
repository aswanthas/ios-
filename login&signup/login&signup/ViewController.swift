//
//  ViewController.swift
//  login&signup
//
//  Created by Iroid on 03/12/21.
//  Copyright © 2021 Iroid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var signin_btn: UIButton!
    
    @IBOutlet weak var signup_btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let backgrount = UIImageView(frame: UIScreen.main.bounds)
        backgrount.image=UIImage(named: "shopping")
        backgrount.contentMode = .scaleAspectFill
        self.view.insertSubview(backgrount, at: 0)
        backgrount.alpha = 0.1
        
        
        signin_btn.layer.cornerRadius=20
        
            signup_btn.layer.cornerRadius=20
        
    }

    @IBAction func signup_act(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "signup") as? signup_ViewController
        self.navigationController?.pushViewController(vc!, animated: true)

        
    }
    
}

