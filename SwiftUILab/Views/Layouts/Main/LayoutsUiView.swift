//
//  LayoutsUiView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 3/8/23.
//

import SwiftUI

struct LayoutsUiView: View {
    
    private let gridColumns = [
        GridItem(.flexible(),alignment: .center),
        GridItem(.flexible(),alignment: .center)
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(
                columns: gridColumns,
                alignment: .leading
            ){
                ForEach(layoutItems, id: \.id){item in
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
                }
                .buttonStyle(.plain)
            }.padding()
        }
        
        
        .navigationTitle("Layouts")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBackButton())

    }
}

struct LayoutsUiView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutsUiView()
    }
}
