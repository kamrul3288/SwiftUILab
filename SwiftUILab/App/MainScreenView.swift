//
//  ContentView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import SwiftUI

struct MainScreenView: View {
    private let gridColumn = [
        GridItem(.flexible(),alignment: .top),
        GridItem(.flexible(),alignment: .top)
    ]

    var body: some View {
        ScrollView{
            LazyVGrid(
                columns: gridColumn,
                alignment: .leading,
                content: {
                    
                    ForEach(mainScreenGridItems, id: \.id){item in
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
                }
            ).padding()
        }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        
        .navigationTitle("Compose Lab")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
