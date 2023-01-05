//
//  UniversityApp.swift
//  University
//
//  Created by M Haris Sitompul on 31/12/22.
//

import SwiftUI

@main
struct UniversityApp: App {
    let presistanceController = PresitanceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, presistanceController.container.viewContext)
        }
    }
}
