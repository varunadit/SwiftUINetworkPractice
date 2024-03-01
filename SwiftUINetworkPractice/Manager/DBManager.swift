//
//  File.swift
//  SwiftUINetworkPractice
//
//  Created by Varun Adit on 1/19/24.
//

import Foundation
import CoreData

class DBManager: NSObject {
    
    let viewContext: NSManagedObjectContext
    
    static let shared: DBManager = {
        let databaseManagerInstance = DBManager()
        return databaseManagerInstance
    }()
    
    private override init() {
        lazy var persistent = PersistenceController.shared.container
        self.viewContext = persistent.viewContext
        super.init()
    }
    
    func addExampleEntity(name: String, content: String) -> Bool {
        
        if let entity = NSEntityDescription.entity(forEntityName: "Examole", in: self.viewContext) {
            let example = NSManagedObject(entity: entity, insertInto: self.viewContext)
            entity.setValue(name, forKey: "name")
            entity.setValue(content, forKey: "value")
            
        }
        return false
    }
    
}
