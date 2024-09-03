//
//  MoreView.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import SwiftUI

struct MorePage: View {
    
    init() {
        print("[pages][MorePage] init")
    }
    
    var body: some View {
        Text("More View")
            .navigationTitle("More")
    }
}

#Preview {
    MorePage()
}
