//
//  signup_ViewController.swift
//  login&signup
//
//  Created by Iroid on 06/12/21.
//  Copyright © 2021 Iroid. All rights reserved.
//

import UIKit

class signup_ViewController: UIViewController {

    @IBOutlet weak var signup_btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        let backgrount = UIImageView(frame: UIScreen.main.bounds)
        backgrount.image=UIImage(named: "shopping")
        backgrount.contentMode = .scaleAspectFill
        self.view.insertSubview(backgrount, at: 0)
        backgrount.alpha = 0.1
        // Do any additional setup after loading the view.
        signup_btn.layer.cornerRadius=20
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
