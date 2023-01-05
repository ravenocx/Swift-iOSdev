//
//  Presistance.swift
//  University
//
//  Created by M Haris Sitompul on 05/01/23.
//

import Foundation
import CoreData

struct PresitanceController{
    // Singleton
    static let shared = PresitanceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "University")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: {desc, error in
            if let error = error as NSError? {debugPrint(error)
            }
        })
    }
}
