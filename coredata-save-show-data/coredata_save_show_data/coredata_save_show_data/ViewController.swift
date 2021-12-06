//
//  ViewController.swift
//  coredata_save_show_data
//
//  Created by iroid on 10/11/21.
//  Copyright © 2021 iroid. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var ename: UITextField!
    @IBOutlet weak var eid: UITextField!
    @IBOutlet weak var ebranch: UITextField!
    @IBOutlet weak var eshift: UITextField!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func save_btn(_ sender: Any) {
        let newemp = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)
        newemp.setValue(ename.text, forKey: "emp_name")
        newemp.setValue(eid.text, forKey: "emp_id")
        newemp.setValue(ebranch.text, forKey: "emp_branch")
        newemp.setValue(eshift.text, forKey: "shift")
        do {
            try context.save()
            self.ename.text=""
            self.eid.text=""
            self.ebranch.text=""
            self.eshift.text=""
            
        } catch  {
            print("Error....!")
        }
        
    }
    
    @IBAction func showdetail_btn(_ sender: Any) {
        
        let storyboard : UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let nextv = storyboard.instantiateViewController(withIdentifier: "secview")as! sec_ViewController
        self.present(nextv, animated: true, completion: nil)
        
        
        
    }
}

