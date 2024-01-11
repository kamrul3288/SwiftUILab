//
//  RadioButtonUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 4/10/23.
//

import SwiftUI

fileprivate enum Flavor : String, CaseIterable, Identifiable{
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

struct PickerUIView: View {
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var selected = 1
    
    var body: some View {
        List{
            Section{
                Picker("Flavor",selection: $selectedFlavor){
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
                .pickerStyle(.menu)
                .accentColor(Color.Black)
                
                
                Picker("Flavor",selection: $selectedFlavor){
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
                .pickerStyle(.navigationLink)
                
                Picker("Flavor",selection: $selectedFlavor){
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
                .pickerStyle(.segmented)
            }
            
            Section{
                radioButton(index: 1,label: "Chocolate")
                radioButton(index: 2,label: "Vanilla")
                radioButton(index: 3,label: "Strawberry")
            }
        }
        .navigationBarWithBackButton(title: "Picker")
    }
    
    private func radioButton(index:Int,label:String) -> some View{
        Button(action: {
            selected = index
        }) {
            HStack {
                Image(systemName: selected == index ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(Color.Primary)
                Text(label)
                    .foregroundColor(Color.Black)
            }
        }
    }
}



#Preview {
    PreviewNavigationbar{
        PickerUIView()
    }
}
