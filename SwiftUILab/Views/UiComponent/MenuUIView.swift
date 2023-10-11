//
//  MenuUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 11/10/23.
//

import SwiftUI

struct MenuUIView: View {
    @State private var selectedColorTag = 1
    var body: some View {
        VStack{
            //------------- Normal Menu------------------
            Menu{
                Button{
                    
                }label: {
                    Label("Add to Favorites",systemImage: "heart")
                }
                
                Button{
                    
                }label: {
                    Label("Share",systemImage: "square.and.arrow.up")
                }
                Button{
                    
                }label: {
                    Label("Open Shopping Cart",systemImage: "cart")
                }
                Button(role:.destructive){
                    
                }label: {
                    Label("Delete",systemImage: "xmark.bin")
                }
            }label: {
                Button {} label: {
                    Text("Show Popup Menu")
                        .modifier(FillColorButtonViewModifier())
                }
                .buttonStyle(ButtonClickScaleEffectStyle())
                .padding(.bottom,16)
            }
            
            
            //------------- Normal Menu------------------
            Menu("Long Press popup menu"){
                Button{
                    
                }label: {
                    Label("Add to Favorites",systemImage: "heart")
                }
                
                Button{
                    
                }label: {
                    Label("Share",systemImage: "square.and.arrow.up")
                }
                Button{
                    
                }label: {
                    Label("Open Shopping Cart",systemImage: "cart")
                }
                Button(role:.destructive){
                    
                }label: {
                    Label("Delete",systemImage: "xmark.bin")
                }
            }primaryAction:{
                
            }
            .padding(.bottom, 16)
            
            //-----------context menu-----------
            Button {} label: {
                Text("Context Menu (Long Press)")
                    .modifier(FillColorButtonViewModifier())
            }
            .buttonStyle(ButtonClickScaleEffectStyle())
            .contextMenu {
                Button{
                    
                }label: {
                    Label("Add to Favorites",systemImage: "heart")
                }
                
                Button{
                    
                }label: {
                    Label("Share",systemImage: "square.and.arrow.up")
                }
                Button{
                    
                }label: {
                    Label("Open Shopping Cart",systemImage: "cart")
                }
                Button(role:.destructive){
                    
                }label: {
                    Label("Delete",systemImage: "xmark.bin")
                }
            }
            
        }
        .padding()
        .navigationBarWithBackButton(title: "Menu")
        .navigationBarItems(
            trailing: Menu{
                //------------- Control Group------------------
                ControlGroup{
                    Button{
                        
                    }label: {
                        Label("Profile",systemImage: "person.crop.circle")
                    }
                    
                    Button{
                        
                    }label: {
                        Label("Home",systemImage: "house.circle")
                    }
                    
                    Button{
                        
                    }label: {
                        Label("Info",systemImage: "info.circle")
                    }
                }
                 
                
                //------------- Normal Menu------------------
                Button{
                    
                }label: {
                    Label("Add to Favorites",systemImage: "heart")
                }
                
                Button{
                    
                }label: {
                    Label("Share",systemImage: "square.and.arrow.up")
                }
                Button{
                    
                }label: {
                    Label("Open Shopping Cart",systemImage: "cart")
                }
                Button(role:.destructive){
                    
                }label: {
                    Label("Delete",systemImage: "xmark.bin")
                }
                
                //------------- Picker Menu------------------
                Picker("Select a tag color",selection: $selectedColorTag){
                    ForEach(1...5,id: \.self){index in
                        Label("Item \(index)",systemImage: "tag")
                    }
                }
                //.pickerStyle(.palette)
                
            }label: {
                Image(systemName: "ellipsis.circle")
                     .foregroundColor(.white)
            }
        )
    }
}


#Preview {
    PreviewNavigationbar{
        MenuUIView()
    }
}
