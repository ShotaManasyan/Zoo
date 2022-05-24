//
//  AnimalListTableViewController.swift
//  Zoo
//
//  Created by Shota Manasyan on 19.05.22.
//

import UIKit

class AnimalListTableViewController: UITableViewController {

    var animalList: [String] = ["Birds", "Fishs", "Mammals", "Reptiles", "Amphibians"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
        
    }

   

}
