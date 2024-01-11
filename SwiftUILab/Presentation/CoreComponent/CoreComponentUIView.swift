//
//  CoreComponentUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 16/8/23.
//

import SwiftUI

struct CoreComponentUIView: View {
    
    private let colomns = [
        GridItem(.flexible(),alignment: .center),
        GridItem(.flexible(),alignment: .center),
        GridItem(.flexible(),alignment: .center),
    ]
    private let items = [
        LayoutItem(title: "State", icon: "cursorarrow.click", route: .StatePropertyView),
        LayoutItem(title: "Binding", icon: "peacesign", route: .BindingPropertyView),
        LayoutItem(title: "[weak, self]", icon: "drop.halffull", route: .WeakSelfView),
        LayoutItem(title: "Identifiable", icon: "circle.dashed.inset.filled", route: .IdentifiableView),
        LayoutItem(title: "Codeable", icon: "app.gift", route: .CodeableView),
        LayoutItem(title: "Observable & StateObject", icon: "arrow.down.backward.toptrailing.rectangle", route: .ObservableAndStateObjectView),
        LayoutItem(title: "EnvironmentObject", icon: "diamond.inset.filled", route: .EnvironmentObjectView),
        LayoutItem(title: "AnchorPreference", icon: "bolt.horizontal", route: .AnchorPreferenceView),
        LayoutItem(title: "Mask", icon: "wallet.pass", route: .MaskView),
        LayoutItem(title: "DragGesture", icon: "rectangle.landscape.rotate", route: .DragGestureView),
    ]
    
    var body: some View {
        ScrollView(.vertical){
            LazyVGrid(columns: colomns) {
                ForEach(items, id: \.id){item in
                    NavigationLink(value: item.route) {
                        VStack{
                            Image(systemName: item.icon)
                                .font(.title3Light)
                                .padding(.bottom,4)
                            Text(item.title)
                                .font(.subheadlineMedium)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity,minHeight: 100,maxHeight: 100)
                        .background(Color.Black95)
                        .cornerRadius(10)
                    }
                    .buttonStyle(.plain)
                }
            }.padding()
        }
        .navigationBarWithBackButton(title: "Core Components")
    }
}

struct CoreComponentUIView_Previews: PreviewProvider {
    static var previews: some View {
        CoreComponentUIView()
    }
}
