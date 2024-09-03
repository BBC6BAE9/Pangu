//
//  Tabable.swift
//  Demo
//
//  Created by hong on 9/2/24.
//

import SwiftUI

public protocol Tabable: CaseIterable, Hashable {
    associatedtype LabelView: View
    func label() -> LabelView
    
    associatedtype RootPage: View
    func rootPage() -> RootPage
}
