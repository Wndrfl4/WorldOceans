//
//  OceanTableViewController.swift
//  WorldOcean
//
//  Created by Aslan  on 14.12.2024.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class OceanTableViewController: UITableViewController {
    
    var arrayOceans = [WorldOcean] ()
    
    var isLoading = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //arrayOceans.append(WorldOcean(name: "test", vallue: "test", AverageDepth: "100"))
        //tableView.reloadData()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        
        
        tableView.refreshControl = refreshControl
        loadData()
    }
    
    @objc func handleRefresh(){
        if !isLoading{
            isLoading = true
            
            arrayOceans.removeAll()
            tableView.reloadData()
            
            loadData()
        }
    }
    
    func loadData(){
//        https://demo9374232.mockable.io/WorldOcean
        SVProgressHUD.show()
        AF.request("https://demo9374232.mockable.io/WorldOcean", method: .get).responseData {
            response in
            SVProgressHUD.dismiss()
            
            self.isLoading = false
            self.refreshControl?.endRefreshing()
            
            if response.response?.statusCode == 200{
                let json = JSON(response.data!)
                print (json)
                
                if let resultArray = json.array{
                    for item in resultArray{
                        let oceanItem = WorldOcean(json: item)
                        self.arrayOceans.append(oceanItem)
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayOceans.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OceanTableViewCell
        
        cell.setData(ocean: arrayOceans[indexPath.row])

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
