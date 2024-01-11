//
//  SwitchUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 21/9/23.
//

import SwiftUI

struct ToggleUIView: View {
    @State private var statusToggleIsOn:Bool = false
    @State private var buttonToggleIsOn:Bool = false
    @State private var emailList = [
        Email(id: "Monthly Updates", isSubscribed: true),
        Email(id: "News Flashes", isSubscribed: true),
        Email(id: "Special Offers", isSubscribed: true)
    ]
    
    var body: some View {
        Form{
            
            //-----------------Simple Toggle Example----------------------
            Section{
                HStack{
                    Text("Status: ")
                    Text(statusToggleIsOn ? "Online" : "Offline")
                }
                .font(.title3Regular)
                
                Toggle(isOn: $statusToggleIsOn, label: {
                    Text("Change Status")
                })
                
                //-----------------custom Toggle Example----------------------
                Toggle(isOn: $statusToggleIsOn, label: {
                    Text("Change Status")
                })
                .toggleStyle(SwitchToggleStyle(tint: .Primary))
                .padding(.bottom,24)
                
            }
            
            
            Section{
                //------------Button Style Toggle-------------
                HStack{
                    Text("Status: ")
                    Text(buttonToggleIsOn ? "Online" : "Offline")
                }
                .font(.title3Regular)
                Toggle(isOn: $buttonToggleIsOn, label: {
                    Text("Change Status")
                })
                .toggleStyle(.button)
                .tint(.Primary)
            }
            
            
            //------------List of  Toogle Example-------------
            Section {
                Text("List of Toogle")
                    .font(.title3Regular)

                ForEach($emailList) { item in
                    Toggle(item.id, isOn: item.isSubscribed)
                }
            }
            
            Section {
                Toggle("Subscribe to all", sources: $emailList, isOn: \.isSubscribed)
            }
            
            
        }
        .navigationBarWithBackButton(title: "Toggle")
    }
}

#Preview {
    ToggleUIView()
}


fileprivate struct Email : Identifiable{
    var id: String
    var isSubscribed = false
}
