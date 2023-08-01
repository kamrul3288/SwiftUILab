//
//  NavigationRouter.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import Foundation

class NavigationRouter : ObservableObject{
    @Published var navigationRoutes:[NavigationRoute] = []
    
    func navigate(_ navigationRoute:NavigationRoute){
        navigationRoutes.append(navigationRoute)
    }
    
    func pop(){
        navigationRoutes.removeLast()
    }
    
    func popToRoot(){
        navigationRoutes.removeAll()
    }
    
    func popUpTo(_ navigationRoute:NavigationRoute){
        let index = navigationRoutes.firstIndex(of: navigationRoute) ?? -1
        if(index >= 0){
            navigationRoutes.removeSubrange(index+1...navigationRoutes.count-1)
        }
    }
}
