//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Marc Jacques on 10/30/20.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clueTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var clueText = ""
        
        for clue in poi.clues {
            clueText += "\(clue)"
        }
        clueTextView.text = clueText
    }
}
