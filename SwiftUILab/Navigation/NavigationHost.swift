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
        navBarAppearance.backgroundColor = UIColor(Color.primaryColor)
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
    }
    
    var body: some View {
        NavigationStack(path: $router.navigationRoutes) {
            MainScreenView()
                .navigationDestination(for: NavigationRoute.self) { route in
                    switch route{
                        
                    //---------UI Component-------------
                    case .UiComponentView: UIComponentView()
                    case .TextView:TextUIView()
                    case .ButtonView: ButtonUIView()
                    case .ImageView: ImageUIView()
                    case .TextFiledView: TextFieldUIView()
                    case .CardView: CardUIView()
                    case .ShapeView: ShapeUIView()
                    case .TimePickerView: TimePickerUIView()
                    case .DatePickerView: DatePickerUIView()
                    case .ShowcaseView: ShowcaseUIView()
                    case .SnackbarView: SnackbarUIView()
                    case .ToggleView: ToggleUIView()
                    case .SliderView: SliderUIView()
                    case .SliderSheetView: BottomSheetUIView()

                        
                    //---------Core Component-------------
                    case .CoreComponentView: CoreComponentUIView()
                    case .StatePropertyView: StatePropertyUIView()
                    case .BindingPropertyView: BindingPropertyUIView()
                    case .WeakSelfView: WeakSelfUIView()
                    case .IdentifiableView: IdentifiableUIView()
                    case .CodeableView: CodeableUIView()
                    case .ObservableAndStateObjectView: ObservableAndStateObjectUIView()
                    case .EnvironmentObjectView: EnvironmentObjectUiView()
                    case .AnchorPreferenceView: AnchorPreferenceView()
                    case .MaskView: MaskUIView()
                    case .DragGestureView: DragGestureUIView()
                        
                
                    //-----------Layouts Adjustment-------
                    case .LayoutAdjustmentView: LayoutAdjustmentUIView()
                    case .PaddingView: PaddingUIView()
                    case .FrameView: FrameUIView()
                    case .FixedSizeiew: FixedSizeUIView()
                    case .LayoutPriorityView: LayoutPriorityUIView()
                    case .PositionView: PositionUIView()
                    case .OffsetView: OffsetUIView()
                    case .AlignmentView: AlignmentUIView()
                        
                    case .LayoutsView: LayoutsUiView()
                    case .VStackView: VStackUiView()
                    case .HStackView: HStackUiView()
                    case .ZStackView: ZStackUiView()
                    case .LazyVStackView: LazyVStackUiView()
                    case .LazyHStackView: LazyHStackUiView()
                    case .GridView: GridUIView()
                    case .PinnedScrollableView: PinnedScrollUIView()
                    case .LazyHGridView: LazyHGridUIView()
                    case .LazyVGridView: LazyVGridUIView()
                    case .ViewThatFitsView: ViewThatFitsUIView()
                    case .SpacerView: SpacerUIView()
                
                    default:
                        ZStack{
                            Text("No Navigation Route Found")
                                .navigationBarWithBackButton(title: "Error")
                        }
                    }
                }
            
        }.environmentObject(router)
    }
}
