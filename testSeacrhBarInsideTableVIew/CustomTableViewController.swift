//
//  CustomTableViewController.swift
//  testSeacrhBarInsideTableVIew
//
//  Created by Evgheni on 21/06/2018.
//  Copyright © 2018 Evgheni. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
		tableView.contentInsetAdjustmentBehavior = .never

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
		cell.textLabel?.text = "RESULT RESULT RESULT"
        return cell
    }
	
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Results")
        navigationController?.pushViewController(vc, animated: true)
    }
}
