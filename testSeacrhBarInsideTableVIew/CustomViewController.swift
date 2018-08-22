//
//  CustomTableViewController.swift
//  testSeacrhBarInsideTableVIew
//
//  Created by Evgheni on 21/06/2018.
//  Copyright © 2018 Evgheni. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableHeaderView = searchController.searchBar
        }
    }
	
    lazy var searchController: UISearchController! = {
       let controller = UISearchController(searchResultsController: CustomTableViewController())
        controller.searchResultsUpdater = self
        controller.searchBar.barTintColor = .blue
        return controller
    }()
	
	let storyBoard = UIStoryboard(name: "Main", bundle: nil)
	
	override func viewDidLoad() {
        super.viewDidLoad()

		tableView.dataSource = self
		tableView.delegate = self

		definesPresentationContext = true
        
        navigationController?.navigationBar.isTranslucent = false
    }
}


// MARK: - Table view data source
extension CustomViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}
	
	 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return 25
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "aCell", for: indexPath)
		
		cell.textLabel?.text = "TEST TEST"
		
		return cell
	}
}


extension CustomViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		let text = searchController.searchBar.text
        print(text)
	}
}

extension CustomViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "Results")
		navigationController?.pushViewController(vc, animated: true)
	}
	
}

