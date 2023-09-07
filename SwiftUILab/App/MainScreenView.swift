//
//  ContentView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import SwiftUI

struct MainScreenView: View {
    
    private let mainScreenGridItems = [
        GridItemModel(title: "Layouts", icon: .tablecells, route: .LayoutsView),
        GridItemModel(title: "Layout Adjustment", icon: .bordernone, route: .LayoutAdjustmentView),
        GridItemModel(title: "Core Component", icon: .star, route: .CoreComponentView),
        GridItemModel(title: "Ui Component", icon: .screwdriverwrench, route: .UiComponentView),
        GridItemModel(title: "Concurrency", icon: .wind, route: .ConcurrencyView),
        GridItemModel(title: "MVVM", icon: .sitemap, route: .MvvmView),
        GridItemModel(title: "Navigation", icon: .locationarrow, route: .ShapeView),
        GridItemModel(title: "Animation", icon: .circleradiation, route: .AnimationView),
        GridItemModel(title: "Google Map", icon: .map, route: .GoogleMapView),
    ]

    
    
    private let gridColumn = [
        GridItem(.flexible(),alignment: .top),
        GridItem(.flexible(),alignment: .top)
    ]

    var body: some View {
        ScrollView(.vertical){
        
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
                                    FontAwesomeIcon(icon: item.icon,size: 28)
                                        .padding(.bottom,4)
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

fileprivate struct GridItemModel{
    let id = UUID()
    let title:String
    let icon:FAIconData
    let route:NavigationRoute
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
