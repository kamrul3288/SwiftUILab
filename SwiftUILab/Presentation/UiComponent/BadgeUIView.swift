//
//  BadgeUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 25/2/24.
//

import SwiftUI

struct BadgeUIView: View {
    var body: some View {
        TabView{
            Text("Map Screen")
                .font(.titleRegular)
                .tabItem {
                    Image(systemName: "map.circle")
                    Text("Map")
                }
                .badge(5)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThinMaterial, for: .tabBar)
            
            Text("Dashboard Screen")
                .font(.titleRegular)
                .tabItem{
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Dashboard")
                }
                .badge("100+")
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThinMaterial, for: .tabBar)
            
            Text("Profile Screen")
                .font(.titleRegular)
                .tabItem{
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThinMaterial, for: .tabBar)
        }
        
        .navigationBarWithBackButton(title: "Badge Examples")
    }
}

#Preview {
    BadgeUIView()
}
