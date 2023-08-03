//
//  NavigationHost.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import Foundation
import SwiftUI

struct NavigationHost : View {
    @ObservedObject var router = NavigationRouter()
    
    init(){
        //-------------- Navigation Bar Style Configuration----------------
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(Color.primary)
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
    }
    
    var body: some View {
        NavigationStack(path: $router.navigationRoutes) {
            MainScreenView()
                .navigationDestination(for: NavigationRoute.self) { route in
                    switch route{
                    case .LayoutsView: LayoutsUiView()
                    default:
                        Text("No Navigation Route Found")
                    }
                }
            
        }.environmentObject(router)
    }
}
