//
//  birthdayProjApp.swift
//  birthdayProj
//
//  Created by Syona Paniker on 7/25/25.
//

import SwiftUI
import SwiftData

@main
struct birthdayProjApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
