//
//  ContentView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import SwiftUI

struct MainScreenView: View {
    
    private let mainScreenGridItems = [
        MainScreenItem(title: "Layouts", icon: "square.2.layers.3d", route: .LayoutsView),
        MainScreenItem(title: "Layout Adjustment", icon: "square.2.layers.3d", route: .LayoutAdjustmentView),
        MainScreenItem(title: "Core Component", icon: "pencil.and.outline", route: .CoreComponentView),
        MainScreenItem(title: "Ui Component", icon: "viewfinder.circle", route: .UiComponentView),
        MainScreenItem(title: "Concurrency", icon: "app.connected.to.app.below.fill", route: .ConcurrencyView),
        MainScreenItem(title: "MVVM", icon: "bolt.horizontal", route: .MvvmView),
        MainScreenItem(title: "Navigation", icon: "paperplane", route: .NavigationView),
        MainScreenItem(title: "Animation", icon: "circle.grid.cross", route: .AnimationView),
        MainScreenItem(title: "Google Map", icon: "map", route: .GoogleMapView),
    ]

    
    
    private let gridColumn = [
        GridItem(.flexible(),alignment: .top),
        GridItem(.flexible(),alignment: .top)
    ]

    var body: some View {
        ScrollView{
            LazyVGrid(
                columns: gridColumn,
                alignment: .leading,
                content: {
                    
                    ForEach(mainScreenGridItems, id: \.id){item in
                        NavigationLink(value: item.route) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(Color.card)

                                VStack{
                                    Image(systemName: item.icon)
                                        .padding(.bottom,8)
                                        .font(.title3Thin)
                                        .fontWeight(.light)
                                    Text(item.title)
                                        .font(.subheadlineMedium)
                                }
                            }
                            .frame(height: 100)
                            .shadow(radius: 0.1)
                        }
                    }
                    .buttonStyle(.plain)
                }
            ).padding()
        }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        
        .navigationTitle("Compose Lab")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
