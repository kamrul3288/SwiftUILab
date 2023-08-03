//
//  MainScreenItem.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 3/8/23.
//

import Foundation
import SwiftUI

struct MainScreenItem{
    let id = UUID()
    let title:String
    let icon:String
    let route:NavigationRoute
}

let mainScreenGridItems = [
    MainScreenItem(title: "Layouts", icon: "square.2.layers.3d", route: .LayoutsView),
    MainScreenItem(title: "Ui Component", icon: "viewfinder.circle", route: .UiComponentView),
    MainScreenItem(title: "Core Component", icon: "pencil.and.outline", route: .CoreComponentView),
    MainScreenItem(title: "Concurrency", icon: "app.connected.to.app.below.fill", route: .ConcurrencyView),
    MainScreenItem(title: "MVVM", icon: "bolt.horizontal", route: .MvvmView),
    MainScreenItem(title: "Navigation", icon: "paperplane", route: .NavigationView),
    MainScreenItem(title: "Animation", icon: "circle.grid.cross", route: .AnimationView),
    MainScreenItem(title: "Google Map", icon: "map", route: .GoogleMapView),
]
