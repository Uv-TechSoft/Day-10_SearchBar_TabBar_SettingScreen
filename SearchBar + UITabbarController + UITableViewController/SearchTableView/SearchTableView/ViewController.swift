//
//  ViewController.swift
//  SearchTableView
//
//  Created by Yogesh Patel on 29/10/21.
//

import UIKit

struct ContactModel{
    var fistname: String
}

class ViewController: UIViewController {

    @IBOutlet weak var contactTableView: UITableView!

//    var arrData = [String]()
    var contactArray = [ContactModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
   
}

// MARK: - Helper Methods
extension ViewController{
    
    func configuration(){
        contactTableView.dataSource = self
        contactTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        contactArray = getAllContacts()
        
        searchConfiguration()
    }
      
    func getAllContacts() -> [ContactModel]{
        return [
            ContactModel(fistname: "Uvesh"),
            ContactModel(fistname: "Mihir"),
            ContactModel(fistname: "Yogesh"),
            ContactModel(fistname: "Pratik"),
            ContactModel(fistname: "Ashish"),
            ContactModel(fistname: "Ashwinder")
        ]
    }
    
//    func getAllContacts() -> [String]{
//        return ["Uvesh", "Mihir", "Yogesh", "Pratik", "Ashish", "Ashwinder"]
//    }
    
    func searchConfiguration(){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        self.title = "Contacts"
        self.definesPresentationContext = true
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else{
            return UITableViewCell()
        }
        cell.textLabel?.text = contactArray[indexPath.row].fistname
        return cell
    }
}

extension ViewController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text else { return }
        print(searchString)
        
        if searchString.isEmpty{
            contactArray = getAllContacts()
        }else{
            
            contactArray = getAllContacts().filter{
                $0.fistname.lowercased().contains(searchString.lowercased())
            }
            
            /*
            arrData = getAllContacts().filter{
                $0.lowercased().contains(searchString.lowercased())
            }
            */
            
            /*
            for number in arrData{
                number.lowercased().contains(searchString.lowercased())
            }
            */
        }
        
        contactTableView.reloadData()
        
    }
}

/*
 model firstname add lastname
 searchkaro firstname and lastname banne thi
 cell - subtitle
 textlabel - firstname
 detailtextlabel - lastname
 */
