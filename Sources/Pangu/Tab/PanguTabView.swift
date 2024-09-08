//
//  PanguTabView.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import SwiftUI


public struct PanguTabView<TabType: Tabable, RouteType: Routable>: View {
    @State var router: Router<TabType, RouteType>
    
    @State var routerWrapper: PanguRouter<TabType, RouteType>
    var tab: TabType
    
    @State var selected: TabType
    
    public init(tab: TabType) {
        self.tab = tab
        self.selected = tab
        let router = Router<TabType, RouteType>(tab: tab)
        self.router = router
        self.routerWrapper = PanguRouter(router: router)
    }
    
    public var body: some View {
        TabView(selection: $selected) {
            ForEach(Array(TabType.allCases), id: \.self) {tab in
                TabNavgationPage<TabType, RouteType, AnyView>(tab: tab) {
                    AnyView(LazyView(tab.rootPage()))
                }
            }
        }
        .onChange(of: selected, perform: { value in
            self.router.tab = value
        })
        .environmentObject(router)
        .environmentObject(routerWrapper)
    }
}

struct LazyView<Content: View>: View {
    private let build: () -> Content
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    public var body: Content {
        build()
    }
}
