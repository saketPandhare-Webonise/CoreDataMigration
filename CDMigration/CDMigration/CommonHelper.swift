//
//  CommonHelper.swift
//  CDMigration


import UIKit
import CoreData

func getManagedContext() -> NSManagedObjectContext {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return NSManagedObjectContext()
    }
    let managedContext = appDelegate.persistentContainer.viewContext
    return managedContext
}
