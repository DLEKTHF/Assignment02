//
//  SaveAssignViewController.swift
//  MiddleReport_2
//
//  Created by SWUCOMPUTER on 2017. 12. 1..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class SaveAssignViewController: UIViewController {

    @IBOutlet var textAssignClassName: UITextField!
    @IBOutlet var textAssignName: UITextField!
    @IBOutlet var textAssignDay: UITextField!
    @IBOutlet var textAssignContent: UITextView!
    @IBOutlet var textAssignTime: UITextField!
        
    var detailAssign: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let two_class = detailAssign {
            textAssignClassName.text = two_class.value(forKey: "assign_Class_Name") as? String
            textAssignName.text = two_class.value(forKey: "assign_Name") as? String
            textAssignDay.text = two_class.value(forKey: "assign_Day") as? String
            textAssignContent.text = two_class.value(forKey: "assign_Content") as? String
            textAssignTime.text = two_class.value(forKey: "assign_Time") as? String
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Assigns", in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textAssignClassName.text, forKey: "assign_Class_Name")
        object.setValue(textAssignName.text, forKey: "assign_Name")
        object.setValue(textAssignDay.text, forKey: "assign_Day")
        object.setValue(textAssignContent.text, forKey: "assign_Content")
        object.setValue(textAssignTime.text, forKey: "assign_Time")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
