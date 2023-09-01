//
//  UIComponentView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 24/8/23.
//

import SwiftUI

struct UIComponentView: View {
    private let columns = [
        GridItem(.flexible(),spacing: 15),
        GridItem(.flexible(),spacing: 15),
    ]
    
    private let items = [
        LayoutItem(title: "Text", icon: "camera.filters", route: .TextView),
        LayoutItem(title: "Button", icon: "camera.filters", route: .ButtonView),
        LayoutItem(title: "Image", icon: "camera.filters", route: .ImageView),
        LayoutItem(title: "Textfiled", icon: "camera.filters", route: .TextFiledView),
        LayoutItem(title: "Card", icon: "camera.filters", route: .CardView),
        LayoutItem(title: "Shape", icon: "camera.filters", route: .ShapeView),
        LayoutItem(title: "Time Picker", icon: "camera.filters", route: .TimePickerView),
        LayoutItem(title: "Date Picker", icon: "camera.filters", route: .DatePickerView),
        LayoutItem(title: "Tooltips", icon: "camera.filters", route: .ToolTipsView),
        LayoutItem(title: "Snackbar", icon: "camera.filters", route: .SnackbarView),
        LayoutItem(title: "Switch", icon: "camera.filters", route: .SwitchView),
        LayoutItem(title: "Slider", icon: "camera.filters", route: .SliderView),
        LayoutItem(title: "Sheet", icon: "camera.filters", route: .SliderSheetView),
        LayoutItem(title: "Search", icon: "camera.filters", route: .SearchView),
        LayoutItem(title: "Radio Button", icon: "camera.filters", route: .RadioButtonView),
        LayoutItem(title: "Progressbar", icon: "camera.filters", route: .ProgressbarView),
        LayoutItem(title: "Nav Drawer", icon: "camera.filters", route: .NavDrawerView),
        LayoutItem(title: "Menu", icon: "camera.filters", route: .MenuView),
        LayoutItem(title: "Bottom Navigation", icon: "camera.filters", route: .BottomNavigationView),
        LayoutItem(title: "Alert Dialog", icon: "camera.filters", route: .AlertDialogView),
        LayoutItem(title: "CheckBox", icon: "camera.filters", route: .CheckboxView),
        LayoutItem(title: "Chips", icon: "camera.filters", route: .ChipsView),
        LayoutItem(title: "Badge", icon: "camera.filters", route: .BadgeView),
    ]
    
    
    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: columns) {
                ForEach(items, id: \.id) { item in
                    NavigationLink(value: item.route) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(Color.card)

                            VStack{
                                Image(systemName: item.icon)
                                    .padding(.bottom,8)
                                    .font(.title3Thin)
                                    .fontWeight(.light)
                                Text(item.title)
                                    .font(.subheadlineMedium)
                            }
                        }
                        .frame(height: 100)
                        .shadow(radius: 0.1)
                    }
                    .buttonStyle(.plain)
                }
            }.padding()
        }
        .navigationBarWithBackButton(title: "UI Compoment")
    }
}

struct UIComponentView_Previews: PreviewProvider {
    static var previews: some View {
        UIComponentView()
    }
}
