//
//  DetailView.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import SwiftUI

struct DetailPage: View {
    @EnvironmentObject var router: PGRouter

    var name: String
    
    init(name:String) {
        self.name = name
        print("[pages][DetailPage] init")
    }
    
    var body: some View {
        Button("push") {
            router.pushToActiveTab(route: .more)
        }
        .navigationTitle("Detail - \(name)")
    }
}

#Preview {
    DetailPage(name: "hello")
}
