//
//  second_ViewController.swift
//  get-postmethod-bigfish
//
//  Created by iroid on 24/11/21.
//  Copyright © 2021 iroid. All rights reserved.
//

import UIKit

class second_ViewController: UIViewController {
   
    @IBOutlet weak var id_txtfld: UITextField!
    var idstr = String()
    var getdata = NSMutableData()
    
    var jsondata = NSDictionary()
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name_txtv: UITextView!
    @IBOutlet weak var cooktime_txtv: UITextView!
    @IBOutlet weak var diffculty_txtv: UITextView!
    @IBOutlet weak var h2c_txtv: UITextView!
    @IBOutlet weak var increadience_txtv: UITextView!
    var rname = String()
    var rcooktime = String()
    var rdiffculty = String()
    var rhtc = String()
    var rincreadience = String()
    var rimgurl = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = true
        
        self.id_txtfld.text = idstr
        let urlstr = URL(string: "http://iroidtechnologies.in/bigfish/Bigfish_cntrl/HealthyFish_Recipes_Detail")
        var requrl = URLRequest(url: urlstr!)
        requrl.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        requrl.httpMethod = "post"
        let poststring = "recipe_id=\(idstr)"
        print("poststring------->>/",poststring)
        requrl.httpBody=poststring.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: requrl){(data,response,error)in
            let mydata = data
            do{
                print("mydata",mydata!)
                
            
            do{
                self.getdata.append(mydata!)
                self.jsondata = try JSONSerialization.jsonObject(with: self.getdata as Data, options: []) as! NSDictionary
                print("jsondata---->",self.jsondata)
                DispatchQueue.main.async {
                    self.rname = String(describing: self.jsondata["name"]!)
                    self.rcooktime = String(describing: self.jsondata["cooking time"]!)
                    self.rdiffculty=String(describing: self.jsondata["difficulty"]!)
                    self.rhtc=String(describing: self.jsondata["how to cook"]!)
                    self.rincreadience=String(describing: self.jsondata["ingredience"]!)
                    
                    self.rimgurl=String(describing: self.jsondata["image"]!)
                    let urlimg = URL(string: self.rimgurl)
                    let dataimg = try? Data(contentsOf: urlimg!)
                    
                    self.name_txtv.text=self.rname
                    self.cooktime_txtv.text=self.rcooktime
                    self.diffculty_txtv.text=self.rdiffculty
                    self.h2c_txtv.text=self.rhtc
                    self.increadience_txtv.text=self.rincreadience
                    self.img.image=UIImage(data: dataimg!)
                    
                    
                }
                
            }
        }
            catch{
                print("error----->>",error.localizedDescription)
                
            }
        };task.resume()
        
       
      
        
        
        
        
        
        // Do any additional setup after loading the view.
        
        
        
        
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
