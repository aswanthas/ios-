//
//  sec_ViewController.swift
//  coredata_save_show_data
//
//  Created by iroid on 10/11/21.
//  Copyright © 2021 iroid. All rights reserved.
//

import UIKit

class sec_ViewController: UIViewController,UITabBarDelegate,UITableViewDataSource {
    @IBOutlet weak var table_view: UITableView!
    var employee : [Employee] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let onrecord = employee[indexPath.row]
        cell.textLabel?.text = onrecord.emp_name! + "" + onrecord.emp_id! + "" + onrecord.emp_branch! + "" + onrecord.shift!
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {
            let emp = employee[indexPath.row]
            context.delete(emp)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do{
                employee = try context.fetch(Employee.fetchRequest())
            }
            catch{
                print("Error....!")
            }
            
        }
        tableView.reloadData()
        
        
    }
    
    
    func fetchdata()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
             employee = try context.fetch(Employee.fetchRequest())
        } catch  {
            print("Error......!")
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.fetchdata()
        self.table_view.reloadData()
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
