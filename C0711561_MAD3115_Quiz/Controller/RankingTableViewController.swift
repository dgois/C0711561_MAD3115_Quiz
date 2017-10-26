//
//  RankingTableViewController.swift
//  C0711561_MAD3115_Quiz
//
//  Created by MacStudent on 2017-10-23.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class RankingTableViewController: UITableViewController {
    
    var ranking = [String: RankingItem]()
    
    var myUserDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()

        ranking = RankingManagement().getRanking()
    }

    fileprivate func configureNavigationBar() {
        self.title = "Ranking"
        
        let backButton = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goToHome))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func goToHome() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ranking.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rankingTableViewCell", for: indexPath) as! RankingTableViewCell
        
        let keys = Array(ranking.keys)
        
        if let rankingItem = ranking[keys[indexPath.row]] {
            cell.lblUserName.text = rankingItem.userName
            cell.lblHighestScore.text = String(rankingItem.higestScore)
            
            if let lowerstScore = rankingItem.lowestScore {
                cell.lblLowestScore.text = String(lowerstScore)
            } else {
                cell.lblLowestScore.text = " --- "
            }
            
            cell.lblAttempts.text = String(rankingItem.attempts)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
