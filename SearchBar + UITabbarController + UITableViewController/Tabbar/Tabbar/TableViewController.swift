//
//  TableViewController.swift
//  Tabbar
//
//  Created by Yogesh Patel on 29/10/21.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var btnSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        btnSwitch.isOn = true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            if indexPath.row == 0{
                print(#function)
            }
        }
        
    }
}
