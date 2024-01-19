//
//  SwiftUINetworkPracticeApp.swift
//  SwiftUINetworkPractice
//
//  Created by Varun Adit on 1/19/24.
//

import SwiftUI

@main
struct SwiftUINetworkPracticeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
