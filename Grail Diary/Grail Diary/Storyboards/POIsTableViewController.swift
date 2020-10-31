//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Marc Jacques on 10/31/20.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var pois = [POI]()
    
    @IBOutlet weak var tableview: UITableView!
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "POIDetailShowSegue" {
            if let indexPath = tableview.indexPathForSelectedRow,
               let poiDVC = segue.destination as? POIDetailViewController {
                poiDVC.poi = pois[indexPath.row]
            }
        }
    }
}



extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = pois[indexPath.row]
        cell.poi = poi
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableview.reloadData()
    }
    
    
}
