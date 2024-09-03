//
//  Tab.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import Pangu
import SwiftUI

enum Tab: Tabable {
    case home
    case profile

    @ViewBuilder
    func rootPage() -> some View {
        switch self {
        case .home:
            HomePage()
        case .profile:
            ProfilePage()
        }
    }

    func label() -> some View {
        switch self {
        case .home:
            return Label("Home", systemImage: "house")
        case .profile:
            return Label("Profile", systemImage: "hand.thumbsup.fill")
        }
    }
}
