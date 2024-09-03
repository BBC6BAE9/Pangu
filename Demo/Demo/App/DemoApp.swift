//
//  DemoApp.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import Pangu
import SwiftUI

typealias PGRouter = PanguRouter<Tab, Route>

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            PanguTabView<Tab, Route>(tab: .home)
        }
    }
}
