//
//  ProfilePage.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var router: PGRouter

    init() {
        print("[pages][ProfilePage] init")
    }
    
    var body: some View {
        Button("push", action: {
            router.pushToActiveTab(route: .detail(name: "hello"))
        })
        .navigationTitle("ProfilePage")
    }
}

#Preview {
    ProfilePage()
}
