//
//  Json_dataApp.swift
//  Json data
//
//  Created by Олексій Гаєвський on 07.09.2023.
//

import SwiftUI

@main
struct Json_dataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(dataController: DataController())
        }
    }
}
