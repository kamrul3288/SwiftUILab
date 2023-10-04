//
//  NavigationRoute.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import Foundation

enum NavigationRoute : Hashable{
    
    //---------UI Component-------------
    case TextView
    case ButtonView
    case ImageView
    case TextFiledView
    case CardView
    case NavigationBarView
    case TimePickerView
    case DatePickerView
    case ShowcaseView
    case SnackbarView
    case ToggleView
    case SliderView
    case SliderSheetView
    case SearchView
    case PickerView
    case ProgressbarView
    case NavDrawerView
    case MenuView
    case BottomNavigationView
    case AlertDialogView
    case CheckboxView
    case ChipsView
    case BadgeView
    
    
    //---------Core Component--------
    case StatePropertyView
    case BindingPropertyView
    case WeakSelfView
    case IdentifiableView
    case CodeableView
    case ObservableAndStateObjectView
    case EnvironmentObjectView
    case AnchorPreferenceView
    case MaskView
    case DragGestureView
 
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
    case ShapeView
    case AnimationView
    case GoogleMapView
    
   
}
