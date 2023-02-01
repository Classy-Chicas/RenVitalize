//
//  RevitalizeApp.swift
//  Revitalize
//
//  Created by Andrea Reed on 2/1/23.
//

import SwiftUI

@main
struct RevitalizeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
