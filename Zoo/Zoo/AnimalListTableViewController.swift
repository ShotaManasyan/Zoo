//
//  AnimalListTableViewController.swift
//  Zoo
//
//  Created by Shota Manasyan on 19.05.22.
//

import UIKit

class AnimalListTableViewController: UITableViewController {
    
    var BirdslList = ["Woodpecker", "Сrow", "Peacock", "Rooster", "Vulture"]
    var FishList = ["Goldfish", "Oscar", "Zander", "Sword Fish", "Neon Tetra"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BirdslList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        
        cell.textLabel?.text = BirdslList[indexPath.row]
        
        return cell
    }
}


