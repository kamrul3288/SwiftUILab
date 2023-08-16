//
//  NavigationRoute.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import Foundation

enum NavigationRoute : Hashable{
    
    //---------Core Component--------
    case StatePropertyView
    case BindingPropertyView
    case WeakSelfView
    case IdentifiableView
    case CodeableView
    case ObservableAndStateObjectView
    case EnvironmentObjectView
    case EscapingView
    case CombineView
    
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
    
    //-----------Layouts Adjustment-------
    case LayoutAdjustmentView
    case PaddingView
    case FrameView
    case FixedSizeiew
    case LayoutPriorityView
    case PositionView
    case OffsetView
    case AlignmentView
    
    //-----------Home-------
    case LayoutsView
    case UiComponentView
    case CoreComponentView
    case ConcurrencyView
    case MvvmView
    case NavigationView
    case AnimationView
    case GoogleMapView
    
   
}
