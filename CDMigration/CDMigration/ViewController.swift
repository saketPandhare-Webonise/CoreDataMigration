//
//  ViewController.swift
//  CDMigration


import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createManagedObjectContext() {
        let userEntity = NSEntityDescription.entity(forEntityName: "UserInfo", in: getManagedContext())
        let user = NSManagedObject(entity: userEntity!, insertInto: getManagedContext())
        user.setValue("Saurabh", forKeyPath: "firstName")
        user.setValue("Pandhare", forKey: "lastName")
        user.setValue("Pramod", forKey: "middleName")
        user.setValue(9930228151, forKey: "mobileNo")
        do {
            try getManagedContext().save()
        } catch {
            print("Failed Saving")
        }
        
    }
    
    @IBAction func buttonSaveData(_ sender: Any) {
        createManagedObjectContext()
    }
    
    @IBAction func buttonFetchData(_ sender: Any) {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
        let users = try! getManagedContext().fetch(userFetch)
        let actualUserInfo: UserInfo = users.last as! UserInfo
        print("User Info has \(String(describing: actualUserInfo.firstName)))")
    }
    
}

