//
//  CheckBoxUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 25/2/24.
//

import SwiftUI

struct CheckBoxUIView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var isMangoChecked = false
    @State private var isTomatoChecked = false
    @State private var isCheeseChecked = false

    var body: some View {
        VStack{
            
            Group{
                Toggle(isOn: $isMangoChecked){
                    Text("Mango")
                }
                
                Toggle(isOn: $isTomatoChecked){
                    Text("Tomato")
                }
                
                Toggle(isOn: $isCheeseChecked){
                    Text("Cheese")
                }
            }
            .toggleStyle(CheckBoxToggleStyle())
            
            
        }
        .frame(maxWidth: Double.infinity,alignment: .leading)
        .padding()


        .navigationBarWithBackButton(title: "Check Box")
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.Primary, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
       
        
    }
}

struct CheckBoxToggleStyle : ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack{
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
        .buttonStyle(.plain)
    }
}

#Preview {
    PreviewNavigationbar{
        CheckBoxUIView()
    }
}
