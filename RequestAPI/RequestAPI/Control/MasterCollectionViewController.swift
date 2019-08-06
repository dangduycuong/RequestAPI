//
//  MasterCollectionViewController.swift
//  RequestAPI
//
//  Created by Cuong on 7/24/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MasterCollectionViewController: UICollectionViewController {
    
    var totalUser: [User]?
    
    var displayUserID = [Int]()
    
    let WIDTH_SCREEN = UIScreen.main.bounds.width
    let numberOfItems: CGFloat = 3
    let padding: CGFloat = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        setDataFromAPI()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tempUser.removeAll()
        collectionView.reloadData()
    }
    
    func setDataFromAPI() {
        DataService.sharedInstance.getDataFromAPI(completedHandle: { data in
            self.totalUser = data
            for i in 0..<self.totalUser!.count {
                if self.displayUserID.contains(self.totalUser![i].userId) == false {
                    self.displayUserID.append(self.totalUser![i].userId)
                }
            }
            self.collectionView.reloadData()
        })
    }
    
    var tempUser: [User] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as? UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell!)
        if let destination = segue.destination as? DetailTableViewController {
            
            for i in 0..<totalUser!.count {
                if displayUserID[indexPath!.row] == totalUser![i].userId {
                    self.tempUser.append(totalUser![i])
                }
            }
            destination.receivedUser = tempUser
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if displayUserID.count == nil {
            return 0
        } else {
            return displayUserID.count
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MasterCollectionViewCell
    
        // Configure the cell
        cell.masterUserIDLabel.text = String(displayUserID[indexPath.row])
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension MasterCollectionViewController: UICollectionViewDelegateFlowLayout {
    // Size of Item
    
    //set before
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (WIDTH_SCREEN - padding * 2 - padding * (numberOfItems - 1))/numberOfItems
        return CGSize(width: itemSize, height: itemSize)
    }
    
    // Spacing Between Each Edge Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
    }
    
    // Spacing Between Rows Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    //    Spacing Between Colums Of Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
