//
//  ViewController.swift
//  SearchTabelView_Day10
//
//  Created by Imam MohammadUvesh on 29/10/21.
//

import UIKit
struct contactModel
{
    var firstName: String
    var lastName: String
}
class ViewController: UIViewController {
    // MARK: TableView Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Declare Array
  // var arrData = ["Uvesh","Imam","Bilal","Rabbani","Mehdihasan","Yogesh","Mihir"]
    var arrayData = [contactModel]()
    // MARK: Main Helper Function
    override func viewDidLoad() {
        super.viewDidLoad()
         controller()
    }
}

// MARK: ViewController Main Extension
extension ViewController
{
    // MARK: TableView DataSource Controlling Fucntion
    func controller()
    {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        arrayData = getallContacts()
        searchControl()
    }
    func getallContacts() -> [contactModel]
    {
      return  [ contactModel (firstName: "Uvesh",lastName: "Imam"),
                contactModel(firstName: "Bilal",lastName: "Bimam"),
                contactModel(firstName: "Rabbani",lastName: "Rimam"),
                contactModel(firstName: "Mehdihasan",lastName: "Mimam"),
                contactModel(firstName: "Yogesh",lastName: "Patel"),
                contactModel(firstName: "Mihir",lastName: "Kumar")
              ]
    }
//    func getallContacts() -> [String]
//    {
//        return ["Uvesh","Imam","Bilal","Rabbani","Mehdihasan","Yogesh","Mihir"]
//    }
    
   func searchControl()
    {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        self.title = "Contact"
        self.definesPresentationContext = true
    }
}


// MARK: TableViewDataSource
extension ViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
       cell?.textLabel?.text = arrayData[indexPath.row].firstName
        cell?.detailTextLabel?.text = arrayData[indexPath.row].lastName
        return cell!
    }
    
}

// MARK: SearchResultUpdating
extension ViewController:UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text else{ return }
        print(searchString)
        if searchString.isEmpty
        {
            arrayData = getallContacts()
            
         //   arrData = ["Uvesh","Imam","Bilal","Rabbani","Mehdihasan","Yogesh","Mihir"]
        }
        else
        {
            arrayData = getallContacts().filter
            {
                $0.firstName.lowercased().contains(searchString.lowercased()) || $0.lastName.lowercased().contains(searchString.lowercased())
            }
//            arrData = ["Uvesh","Imam","Bilal","Rabbani","Mehdihasan","Yogesh","Mihir"].filter
//            {
//                $0.lowercased().contains(searchString.lowercased())
//            }
            /*
            for number in arrData{
                number.lowercased().contains(searchString.lowercased())
            }
            */
        }
        tableView.reloadData()
    }
}
