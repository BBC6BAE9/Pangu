//
//  Routable.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import SwiftUI

/// Route Protocol
public protocol Routable: Hashable {
    associatedtype DestinationView: View
    func destinationView() -> DestinationView
}
