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
    ]
    private let items = [
        LayoutItem(title: "@State", icon: "number.circle", route: .StatePropertyView),
        LayoutItem(title: "@Binding", icon: "number.circle", route: .BindingPropertyView),
        LayoutItem(title: "@[weak, self]", icon: "number.circle", route: .WeakSelfView),
        LayoutItem(title: "@Identifiable", icon: "number.circle", route: .IdentifiableView),
        LayoutItem(title: "Observable & StateObject", icon: "number.circle", route: .ObservableAndStateObjectView),
        LayoutItem(title: "@EnvironmentObject", icon: "number.circle", route: .EnvironmentObjectView),
        LayoutItem(title: "@escaping ()->", icon: "number.circle", route: .EscapingView),
        LayoutItem(title: "@Combine", icon: "number.circle", route: .CombineView),
    ]
    
    var body: some View {
        ScrollView(.vertical){
            LazyVGrid(columns: colomns) {
                ForEach(items, id: \.id){item in
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
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .frame(height: 100)
                        .shadow(radius: 0.1)
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
