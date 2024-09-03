//
//  Route.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import Pangu
import SwiftUI

enum Route: Routable {
    
    case detail(name:String)
    case more

    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .detail(let name):
            DetailPage(name: name)
        case .more:
            MorePage()
        }
    }
}
