//
//  ViewController.swift
//  get-postmethod-bigfish
//
//  Created by iroid on 24/11/21.
//  Copyright © 2021 iroid. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource {
    var getdata = NSMutableData()
    var jsondata = NSArray()
    var dict = NSDictionary()
    
    @IBOutlet weak var collview: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsondata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newcollcell = collview.dequeueReusableCell(withReuseIdentifier: "fcollv", for: indexPath)as! firstCollectionViewCell
        self.dict = jsondata[indexPath.item]as! NSDictionary
        newcollcell.id.text = dict["recipe_id"]as? String
        newcollcell.name.text = dict["name"]as? String
        newcollcell.difficult.text = dict["difficulty"]as? String
        newcollcell.cooktime.text = dict["cookingtime"]as? String
        
        let getimg = String(describing: self.dict["image"]!)
        let urlimg = URL(string: getimg)
        let dataimg = try?Data(contentsOf: urlimg!)
        newcollcell.imgv.image=UIImage(data: dataimg!)
        
        

        return newcollcell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let view = UIStoryboard(name: "Main", bundle: nil)
        let newui = view.instantiateViewController(withIdentifier: "sec_view")as! second_ViewController
        self.navigationController?.pushViewController(newui, animated: true)
        self.dict = jsondata[indexPath.item]as! NSDictionary
        newui.idstr = self.dict["recipe_id"]as! String
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        let url_str = URL(string: "http://iroidtechnologies.in/bigfish/Bigfish_cntrl/HealthyFish_Recipes")
        let req_url = URLRequest(url: url_str!)
        let task = URLSession.shared.dataTask(with: req_url) {(data,request,error) in
          if let mydata = data
          {do{
            print("mydata---------->>>",mydata)}
            do{
               
                self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: [])as! NSArray
                do{
                    DispatchQueue.main.async {
                        self.collview.reloadData()
                    }
                }
                
            }catch{
                print("error------>>",error.localizedDescription)}
            
        }
        
        
    }

task.resume()
}
}
