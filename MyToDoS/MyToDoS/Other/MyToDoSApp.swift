//
//  MyToDoSApp.swift
//  MyToDoS
//
//  Created by Giuseppe Cipullo on 24/04/24.
//

import FirebaseCore
import SwiftUI

@main
struct MyToDoSApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
