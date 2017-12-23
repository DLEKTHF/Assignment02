//
//  ClassTableViewController.swift
//  MiddleReport_2
//
//  Created by SWUCOMPUTER on 2017. 12. 1..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class ClassTableViewController: UITableViewController {

    var classes: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Class Cell", for: indexPath)
        let one_class = classes[indexPath.row]
        var title_display: String = ""
        var detail_display1: String = ""
        var detail_display2: String = ""
        
        if let nameLabel = one_class.value(forKey: "class_Name") as? String {
            title_display = nameLabel
        }
        
        if let dayLabel = one_class.value(forKey: "class_Day") as? String {
            detail_display1 = dayLabel
        }
        
        if let timeLabel = one_class.value(forKey: "class_Time") as? String {
            detail_display2 = timeLabel
        }
        cell.textLabel?.text = title_display
        cell.detailTextLabel?.text = detail_display1 + " " + detail_display2
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = getContext()
            context.delete(classes[indexPath.row])
            do {
                try context.save()
                print("deleted!")
            } catch let error as NSError {
                print("Could not delete \(error), \(error.userInfo)") }
            classes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
        if segue.identifier == "toDetailClass" {
            if let destination = segue.destination as? SaveClassViewController {
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
                    destination.detailClass = classes[selectedIndex]
                }
            }
        }
    }
    
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let context = self.getContext()
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Classes")
    
    do {
        classes = try context.fetch(fetchRequest)
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
    self.tableView.reloadData()
}

}
