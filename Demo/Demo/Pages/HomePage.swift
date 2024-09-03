//
//  HomePage.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var router: PGRouter

    init() {
        print("[pages][HomePage] init")
    }
    
    var body: some View {
        Button("push") {
            router.pushToActiveTab(route: .detail(name: "hello"))
        }
        .navigationTitle("Home")
    }
}

#Preview {
    HomePage()
}
