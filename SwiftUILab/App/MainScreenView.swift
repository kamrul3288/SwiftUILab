//
//  ContentView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import SwiftUI

struct MainScreenView: View {
    
    private let mainScreenGridItems = [
        GridItemModel(title: "Layouts", icon: "grid", route: .LayoutsView),
        GridItemModel(title: "Layout Adjustment", icon: "circle.grid.cross", route: .LayoutAdjustmentView),
        GridItemModel(title: "Core Component", icon: "externaldrive", route: .CoreComponentView),
        GridItemModel(title: "Ui Component", icon: "display", route: .UiComponentView),
        GridItemModel(title: "Concurrency", icon: "flowchart", route: .ConcurrencyView),
        GridItemModel(title: "Navigation", icon: "location.square", route: .ShapeView),
        GridItemModel(title: "Animation", icon: "circle.hexagongrid", route: .AnimationView),
        GridItemModel(title: "Google Map", icon: "map.circle", route: .GoogleMapView),
    ]

    
    
    private let gridColumn = [
        GridItem(.flexible(),alignment: .top),
        GridItem(.flexible(),alignment: .top),
    ]

    var body: some View {
        ScrollView(.vertical){
            LazyVGrid(
                columns: gridColumn,
                alignment: .leading,
                content: {
                    
                    ForEach(mainScreenGridItems, id: \.id){item in
                        NavigationLink(value: item.route) {
                            VStack{
                                Image(systemName: item.icon)
                                    .font(.title3Light)
                                    .padding(.bottom,4)

                                Text(item.title)
                                    .font(.subheadlineMedium)
                            }
                            .frame(maxWidth: .infinity,minHeight: 100,maxHeight: 100)
                            .background(Color.Black95)
                            .cornerRadius(10)
                        }
                    }
                    .buttonStyle(.plain)
                }
            ).padding()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        
        .navigationTitle("Compose Lab")
        .navigationBarTitleDisplayMode(.inline)
    }
}

fileprivate struct GridItemModel{
    let id = UUID()
    let title:String
    let icon:String
    let route:NavigationRoute
}

#Preview{
    PreviewNavigationbar{
        MainScreenView()
    }
}

