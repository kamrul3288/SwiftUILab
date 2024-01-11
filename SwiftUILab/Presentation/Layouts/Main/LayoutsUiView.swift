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
        GridItem(.flexible(),alignment: .center),
        GridItem(.flexible(),alignment: .center),
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(
                columns: gridColumns,
                alignment: .leading
            ){
                ForEach(layoutItems, id: \.id){item in
                    NavigationLink(value: item.route) {
                        VStack{
                            Image(systemName: item.icon)
                                .font(.title3Light)
                                .padding(.bottom,4)
                            Text(item.title)
                                .font(.subheadlineMedium)
                        }
                        .frame(maxWidth: .infinity,minHeight: 100,maxHeight: 100)
                        .background(Color.Black95)
                        .cornerRadius(10)
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
