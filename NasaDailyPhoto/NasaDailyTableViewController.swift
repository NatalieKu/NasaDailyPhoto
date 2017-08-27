//
//  NasaDailyTableViewController.swift
//  NasaDailyPhoto
//
//  Created by MEI KU on 2017/8/28.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import UIKit

class NasaDailyTableViewController: UITableViewController {

       var nasas = [Nasa]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NasaController.shared.fetchSongs { (nasas) in
            if let nasas = nasas {
                self.updateUI(nasas: nasas)
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        
        
    }

    func updateUI(nasas: [Nasa]) {
        DispatchQueue.main.async {
            self.nasas = nasas
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return nasas.count
    }

    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let nasa = nasas[indexPath.row]
        cell.textLabel?.text = nasa.title
        cell.detailTextLabel?.text = nasa.date
        cell.imageView?.image = #imageLiteral(resourceName: "nasa")
        
        NasaController.shared.fetchImage(url: nasa.url) { (image) in
            guard let image = image else {
                return
            }
            DispatchQueue.main.async {
                if let currentIndexPath = self.tableView.indexPath(for: cell), currentIndexPath == indexPath {
                    cell.imageView?.image = image
                }
            }
        }
        
    }
    
    
    
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NasaCell", for: indexPath)

        // Configure the cell...
       configure(cell: cell, forItemAt: indexPath)
       
        return cell
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

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let nasaDetailViewController = segue.destination as? NasaDetailViewController, let row = tableView.indexPathForSelectedRow?.row {
            nasaDetailViewController.nasa = nasas[row]
            }
        
    }


}
