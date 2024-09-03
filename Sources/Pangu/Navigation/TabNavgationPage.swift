//
//  TabNavPage.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import SwiftUI
import NavigationBackport

struct TabNavgationPage<TabType: Tabable, RouteType: Routable, T: View>: View {
    
    @EnvironmentObject var router: Router<TabType, RouteType>

    var tab: TabType
    
    let content: T

    init(tab: TabType, @ViewBuilder content: () -> T)
    {
        self.tab = tab
        self.content = content()
    }
    
    var body: some View {
        NBNavigationStack(path: self.router.pathBinding(for: tab)) {
            content
                .nbNavigationDestination(for: RouteType.self) { route in
                    route.destinationView()
                }
        }
        .tabItem {
            tab.label()
        }
        .tag(tab)
    }
}
