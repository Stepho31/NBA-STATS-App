//
//  NbaTableViewCellViewController.swift
//  
//
//  Created by Stephen on 6/13/22.
//

import UIKit
import CoreData

class NbaTableViewCellViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
extension NbaTableViewCellViewController {
    func save() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            
            guard let entityDescription = NSEntityDescription.entity(forEntityName: "Favorites", in: context) else
                { return }
                
            _ = NSManagedObject(entity: entityDescription, insertInto: context)

            do {
                try context.save()
                print("Saved")
            } catch {
                print("Saving Error")
            }
            }
        }
    func retrieveValues() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<Favorites>(entityName: "Favorites")
            do {
                let results = try context.fetch(fetchRequest)
                
                for result in results {
                    if let temporaryDisplayName = result.temporaryDisplayName {
                        print(temporaryDisplayName)
                    }
                }
            } catch {
                print("Could not retrieve")
            }
        }
    }
    func deleteAllData(entity: String)
    {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Favorites>(entityName: "Favorites")
        fetchRequest.returnsObjectsAsFaults = false

        do
        {
            let results = try managedContext!.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as NSManagedObject
                managedContext!.delete(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
        }
    }
    
    
}



