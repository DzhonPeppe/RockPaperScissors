//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by John Peppe on 15.06.2021.
//  Copyright © 2021 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var history: [RPSMatch]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellID = "HistoryCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)
        
        let match = self.history[(indexPath as NSIndexPath).row]
        
        cell.textLabel!.text = victoryStatusDescription(match)
        cell.detailTextLabel!.text = "\(match.p1) vs. \(match.p2)"
        
        return cell
    }
    
    func victoryStatusDescription(_ match: RPSMatch) -> String {
        if (match.p1 == match.p2) {
            return "Tie"
        } else if (match.p1.defeats(match.p2)) {
            return "Win!"
        } else {
            return "Loss"
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
}
