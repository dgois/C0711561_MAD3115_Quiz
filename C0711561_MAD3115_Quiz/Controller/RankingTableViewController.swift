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
        
        setBackgroundImage()
    }

    fileprivate func configureNavigationBar() {
        self.title = "Ranking"
        
        let backButton = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goToHome))
        navigationItem.leftBarButtonItem = backButton
    }
    
    fileprivate func setBackgroundImage() {
        let backgroundImage = UIImage(named: "background-login-image.jpg")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        self.tableView.backgroundColor = UIColor(white: 1, alpha: 0.5)
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
        
        setCellValue(indexPath, cell)
        //setBackgroundCellColor(indexPath, cell)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    fileprivate func setCellValue(_ indexPath: IndexPath, _ cell: RankingTableViewCell) {
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
    }
    
    fileprivate func setBackgroundCellColor(_ indexPath: IndexPath, _ cell: RankingTableViewCell) {
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: CGFloat(0.844), green: CGFloat(0.783), blue: CGFloat(0.545), alpha: CGFloat(1.0))
        } else {
            cell.backgroundColor =  UIColor(red: CGFloat(0.564), green: CGFloat(0.654), blue: CGFloat(0.471), alpha: CGFloat(1.0))
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

}
