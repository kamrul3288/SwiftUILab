//
//  NavigationRoute.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import Foundation

enum NavigationRoute : Hashable{
    case LayoutsView
    case UiComponentView
    case CoreComponentView
    case ConcurrencyView
    case MvvmView
    case NavigationView
    case AnimationView
    case GoogleMapView
    
    //-----------Layouts subview-------
    case ZStackView
    case HStackView
    case VStackView
    case LazyHStackView
    case LazyVStackView
    case LazyHGridView
    case LazyVGridView
    case GridView
    case PinnedScrollableView
    case SpacerView
    case ViewThatFitsView
}
