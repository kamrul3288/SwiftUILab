//
//  LayoutsItem.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 3/8/23.
//

import Foundation


struct LayoutItem{
    let id = UUID()
    let title:String
    let icon:String
    let route:NavigationRoute
    
    init(title: String, icon: String, route: NavigationRoute) {
        self.title = title
        self.icon = icon
        self.route = route
    }
}

 let layoutItems = [
    LayoutItem(title: "VStack", icon: "square.stack.3d.up", route: .VStackView),
    LayoutItem(title: "HStack", icon: "square.stack.3d.forward.dottedline", route: .HStackView),
    LayoutItem(title: "ZStack", icon: "square.stack", route: .ZStackView),
    LayoutItem(title: "LazyHStack", icon: "rectangle.stack", route: .LazyHStackView),
    LayoutItem(title: "LazyVStack", icon: "square.stack.3d.up", route: .LazyVStackView),
    LayoutItem(title: "Grid", icon: "grid", route: .GridView),
    LayoutItem(title: "PinnedScrollableViews", icon: "scribble", route: .PinnedScrollableView),
    LayoutItem(title: "LazyHGrid", icon: "square.grid.4x3.fill", route: .LazyHGridView),
    LayoutItem(title: "LazyVGrid", icon: "square.fill.text.grid.1x2", route: .LazyVGridView),
    LayoutItem(title: "ViewThatFits", icon: "scroll", route: .ViewThatFitsView),
    LayoutItem(title: "Spacer", icon: "space", route: .SpacerView)
]
