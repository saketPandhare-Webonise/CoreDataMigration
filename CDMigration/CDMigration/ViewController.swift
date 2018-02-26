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
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "UserInfo", in: managedContext)
        
        let user = NSManagedObject(entity: userEntity!, insertInto: managedContext)
        
        user.setValue("Saket", forKeyPath: "firstName")
        user.setValue("Pandhare", forKey: "lastName")
        user.setValue("Pramod", forKey: "middleName")
        user.setValue(9930228151, forKey: "mobileNo")
        
        
        do {
            try managedContext.save()
        } catch {
            print("Failed Saving")
        }
        
    }
    
    @IBAction func buttonSaveData(_ sender: Any) {
        createManagedObjectContext()
    }
    
    @IBAction func buttonFetchData(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
        
        let users = try! managedContext.fetch(userFetch)
        
        let actualUserInfo: UserInfo = users.first as! UserInfo
        print("User Info has \(String(describing: actualUserInfo.firstName)))")
    }
    
}

