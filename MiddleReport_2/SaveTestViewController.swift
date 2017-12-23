//
//  SaveTestViewController.swift
//  MiddleReport_2
//
//  Created by SWUCOMPUTER on 2017. 12. 1..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class SaveTestViewController: UIViewController {
    
    @IBOutlet var textTestName: UITextField!
    @IBOutlet var textTestDay: UITextField!
    @IBOutlet var textTestPlace: UITextField!
    @IBOutlet var textTestTime: UITextField!
    @IBOutlet var textTestRange: UITextView!
    
    var detailTest: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let two_class = detailTest {
            textTestName.text = two_class.value(forKey: "test_Name") as? String
            textTestDay.text = two_class.value(forKey: "test_Day") as? String
            textTestPlace.text = two_class.value(forKey: "test_Place") as? String
            textTestTime.text = two_class.value(forKey: "test_Time") as? String
            textTestRange.text = two_class.value(forKey: "test_Range") as? String
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
        let entity = NSEntityDescription.entity(forEntityName: "Tests", in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textTestName.text, forKey: "test_Name")
        object.setValue(textTestDay.text, forKey: "test_Day")
        object.setValue(textTestPlace.text, forKey: "test_Place")
        object.setValue(textTestTime.text, forKey: "test_Time")
        object.setValue(textTestRange.text, forKey: "test_Range")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
