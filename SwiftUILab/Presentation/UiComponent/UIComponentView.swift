//
//  UIComponentView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 24/8/23.
//

import SwiftUI

struct UIComponentView: View {
    private let columns = [
        GridItem(.flexible(),spacing: 8),
        GridItem(.flexible(),spacing: 8),
        GridItem(.flexible(),spacing: 8),
    ]
    
    private let items = [
        GridItemModel(title: "Text", icon: .textwidth, route: .TextView),
        GridItemModel(title: "Button", icon: .mobileButton, route: .ButtonView),
        GridItemModel(title: "Image", icon: .image, route: .ImageView),
        GridItemModel(title: "Textfiled", icon: .textSlash, route: .TextFiledView),
        GridItemModel(title: "Card", icon: .square, route: .CardView),
        GridItemModel(title: "Shape", icon: .shape, route: .ShapeView),
        GridItemModel(title: "Time Picker", icon: .clock, route: .TimePickerView),
        GridItemModel(title: "Date Picker", icon: .calendar, route: .DatePickerView),
        GridItemModel(title: "Showcase", icon: .chalkboardUser, route: .ShowcaseView),
        GridItemModel(title: "Snackbar", icon: .message, route: .SnackbarView),
        GridItemModel(title: "Toggle/Switch", icon: .toggleOn, route: .ToggleView),
        GridItemModel(title: "Slider", icon: .sliders, route: .SliderView),
        GridItemModel(title: "Sheet", icon: .stroopwafel, route: .SliderSheetView),
        GridItemModel(title: "Search", icon: .search, route: .SearchView),
        GridItemModel(title: "Picker", icon: .circledot, route: .PickerView),
        GridItemModel(title: "Progressbar", icon: .spinner, route: .ProgressbarView),
        GridItemModel(title: "Nav Drawer", icon: .bars, route: .NavDrawerView),
        GridItemModel(title: "Menu", icon: .ellipsisvertical, route: .MenuView),
        GridItemModel(title: "Bottom Navigation", icon: .locationarrow, route: .BottomNavigationView),
        GridItemModel(title: "Alert Dialog", icon: .exclamation, route: .AlertDialogView),
        GridItemModel(title: "Action Sheet", icon: .exclamation, route: .ActionSheetView),
        GridItemModel(title: "CheckBox", icon: .circlecheck, route: .CheckboxView),
        GridItemModel(title: "Chips", icon: .filter, route: .ChipsView),
        GridItemModel(title: "Badge", icon: .certificate, route: .BadgeView),
    ]
    
    
    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: columns) {
                ForEach(items, id: \.id) { item in
                    NavigationLink(value: item.route) {
                        VStack{
                            FontAwesomeIcon(icon: item.icon,size: 24)
                                .padding(.bottom,4)
                            Text(item.title)
                                .font(.subheadlineMedium)
                        }
                        .frame(maxWidth: .infinity,minHeight: 100,maxHeight: 100)
                        .background(Color.Black95)
                        .cornerRadius(10)
                    }
                    .buttonStyle(.plain)
                }
            }.padding()
        }
        .navigationBarWithBackButton(title: "UI Compoment")
    }
}

fileprivate struct GridItemModel{
    let id = UUID()
    let title:String
    let icon:FAIconData
    let route:NavigationRoute
    
    init(title: String, icon: FAIconData, route: NavigationRoute) {
        self.title = title
        self.icon = icon
        self.route = route
    }
}

struct UIComponentView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewNavigationbar{
            UIComponentView()
        }
    }
}
