//
//  StudyWellApp.swift
//  StudyWell
//
//  Created by Future Makers on 2025-07-15.
//

import SwiftUI

@main
struct StudyWellApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: TaskItem.self)
    }
}
