//
//  Example+CoreDataProperties.swift
//  SwiftUINetworkPractice
//
//  Created by Varun Adit on 1/19/24.
//
//

import Foundation
import CoreData


extension Example {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Example> {
        return NSFetchRequest<Example>(entityName: "Example")
    }

    @NSManaged public var name: String?
    @NSManaged public var value: String?

}

extension Example : Identifiable {

}
