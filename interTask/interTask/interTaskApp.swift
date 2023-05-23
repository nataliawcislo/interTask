//
//  interTaskApp.swift
//  interTask
//
//  Created by Natalia Wcislo on 16.05.23.
//

import SwiftUI

@main
struct interTaskApp: App {
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        /// method for checking the state of the application
        }.onChange(of: scenePhase) { newPhase in
            if newPhase == .inactive {
                print("Inactive")
            }else if newPhase == .active {
                print("Active")
            }else if newPhase == .background {
                print("Background")
            }
        }
    }
}
