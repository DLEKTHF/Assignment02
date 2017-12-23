//
//  SaveClassViewController.swift
//  MiddleReport_2
//
//  Created by SWUCOMPUTER on 2017. 12. 1..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class SaveClassViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var textClassName: UITextField!
    @IBOutlet var textClassDay: UITextField!
    @IBOutlet var textClassTime: UITextField!
    @IBOutlet var textClassPro: UITextField!
    @IBOutlet var textClassEmail: UITextField!
    @IBOutlet var textClassPlace: UITextField!
    @IBOutlet var textClassQuest1: UITextField!
    @IBOutlet var textClassQuest2: UITextField!
    @IBOutlet var textClassQuest3: UITextField!
    @IBOutlet var textClassQuest4: UITextField!
    @IBOutlet var textClassQuest5: UITextField!
    @IBOutlet var textClassPercent1: UITextField!
    @IBOutlet var textClassPercent2: UITextField!
    @IBOutlet var textClassPercent3: UITextField!
    @IBOutlet var textClassPercent4: UITextField!
    @IBOutlet var textClassPercent5: UITextField!
    @IBOutlet var textClassMemo: UITextView!
    
    
    var detailClass: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let two_class = detailClass {
            textClassName.text = two_class.value(forKey: "class_Name") as? String
            textClassDay.text = two_class.value(forKey: "class_Day") as? String
            textClassTime.text = two_class.value(forKey: "class_Time") as? String
            textClassPro.text = two_class.value(forKey: "class_Pro_Name") as? String
            textClassEmail.text = two_class.value(forKey: "class_Email") as? String
            textClassPlace.text = two_class.value(forKey: "class_Place") as? String
            textClassQuest1.text = two_class.value(forKey: "class_Quest1") as? String
            textClassQuest2.text = two_class.value(forKey: "class_Quest2") as? String
            textClassQuest3.text = two_class.value(forKey: "class_Quest3") as? String
            textClassQuest4.text = two_class.value(forKey: "class_Quest4") as? String
            textClassQuest5.text = two_class.value(forKey: "class_Quest5") as? String
            textClassPercent1.text = two_class.value(forKey: "class_Percent1") as? String
            textClassPercent2.text = two_class.value(forKey: "class_Percent2") as? String
            textClassPercent3.text = two_class.value(forKey: "class_Percent3") as? String
            textClassPercent4.text = two_class.value(forKey: "class_Percent4") as? String
            textClassPercent5.text = two_class.value(forKey: "class_Percent5") as? String
            textClassMemo.text = two_class.value(forKey: "class_Memo") as? String
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
        let entity = NSEntityDescription.entity(forEntityName: "Classes", in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(textClassName.text, forKey: "class_Name")
        object.setValue(textClassDay.text, forKey: "class_Day")
        object.setValue(textClassTime.text, forKey: "class_Time")
        object.setValue(textClassPro.text, forKey: "class_Pro_Name")
        object.setValue(textClassEmail.text, forKey: "class_Email")
        object.setValue(textClassPlace.text, forKey: "class_Place")
        object.setValue(textClassQuest1.text, forKey: "class_Quest1")
        object.setValue(textClassQuest2.text, forKey: "class_Quest2")
        object.setValue(textClassQuest3.text, forKey: "class_Quest3")
        object.setValue(textClassQuest4.text, forKey: "class_Quest4")
        object.setValue(textClassQuest5.text, forKey: "class_Quest5")
        object.setValue(textClassPercent1.text, forKey: "class_Percent1")
        object.setValue(textClassPercent2.text, forKey: "class_Percent2")
        object.setValue(textClassPercent3.text, forKey: "class_Percent3")
        object.setValue(textClassPercent4.text, forKey: "class_Percent4")
        object.setValue(textClassPercent5.text, forKey: "class_Percent5")
        object.setValue(textClassMemo.text, forKey: "class_Memo")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        self.navigationController?.popViewController(animated: true)
        
            }
}
