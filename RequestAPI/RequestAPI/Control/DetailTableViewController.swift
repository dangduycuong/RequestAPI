//
//  DetailTableViewController.swift
//  RequestAPI
//
//  Created by Cuong on 7/24/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var receivedUser: [User]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if receivedUser?.count == nil {
            return ""
        } else {
            return "UserID \(receivedUser![0].userId)"
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if receivedUser?.count == nil {
            return 0
        } else {
            return receivedUser!.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell

        // Configure the cell...
        cell.idLabel.text = String(receivedUser![indexPath.row].id)
        cell.titleLabel.text = receivedUser![indexPath.row].title
        cell.completedLabel.text = String(receivedUser![indexPath.row].completed)
        
        // set color
        var color = UIColor.blue
//        cell.idLabel.textColor = color
        cell.titleLabel.textColor = color
        
        cell.sttLabel.text = "\(indexPath.row + 1)"
        cell.sttLabel.textColor = UIColor.cyan
        
        if receivedUser![indexPath.row].completed == true {
            cell.completedLabel.textColor = UIColor.green
        } else {
            cell.completedLabel.textColor = UIColor.red
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
