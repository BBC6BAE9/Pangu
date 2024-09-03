//
//  Router.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import SwiftUI

public class PanguRouter<TabType: Tabable, RouteType: Routable>: ObservableObject {
    
    private var router: Router<TabType, RouteType>
    
    init(router: Router <TabType, RouteType>) {
        self.router = router
    }
    
    public func pushToActiveTab(route: RouteType) {
        self.router.pushToActiveTab(route: route)
    }
}

    
/// Router for Tab + NavigationStack
class Router<TabType: Tabable, RouteType: Routable>: ObservableObject {
    
    @Published var tab: TabType
    
    @Published var path: [TabType: [RouteType]] = [:]
    
    var tabBinding: Binding<TabType> {
        Binding(get: { self.tab }, set: { self.tab = $0 })
    }

    public init(tab: TabType) {
        self.tab = tab
    }

    func pathForActiveTab() -> [RouteType] {
        self.path(for: self.tab)
    }

    func path(for tab: TabType) -> [RouteType] {
        if let path = self.path[tab] {
            return path
        } else {
            let array: [RouteType] = []
            DispatchQueue.main.async {
                self.path[tab] = array
            }
            return array
        }
    }

    func pathBinding(for tab: TabType) -> Binding<[RouteType]> {
        return Binding(get: { self.path(for: tab) }, set: { self.path[tab] = $0 })
    }

    public func pushToActiveTab(route: RouteType) {
        // Make sure path exists
        let _ = self.path(for: self.tab)
        DispatchQueue.main.async {
            self.path[self.tab]?.append(route)
        }
    }
}
