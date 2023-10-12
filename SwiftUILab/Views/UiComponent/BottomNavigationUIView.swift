//
//  BottomNavigationUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 12/10/23.
//

import SwiftUI

struct BottomNavigationUIView: View {
    var body: some View {
        
        TabView{
            Text("Map Screen")
                .font(.titleRegular)
                .tabItem {
                    Image(systemName: "map.circle")
                    Text("Map")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThinMaterial, for: .tabBar)
            
            Text("Dashboard Screen")
                .font(.titleRegular)
                .tabItem{
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Dashboard")
                }
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
        
        .navigationBarWithBackButton(title: "Tab bar")
        
    }
}

#Preview {
    PreviewNavigationbar{
        BottomNavigationUIView()
    }
}
