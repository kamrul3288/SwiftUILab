//
//  AlertDialogUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 15/10/23.
//

import SwiftUI

struct AlertDialogUIView: View {
    @State private var showAlert1 = false
    @State private var showAlert2 = false
    @State private var showAlert3 = false
    
    var body: some View {
        VStack{
            Button {
                showAlert1.toggle()
            } label: {
                Text("Title Only Dialog")
                    .modifier(FillColorButtonViewModifier())
            }
            .buttonStyle(ButtonClickScaleEffectStyle())
            .padding(.bottom,16)
            .alert("Something Went Wrong!", isPresented: $showAlert1) {
                Button("OK",role: .cancel){
                    
                }
            }
            
            
            
            Button {
                showAlert2.toggle()
            } label: {
                Text("Single Button Dialog")
                    .modifier(FillColorButtonViewModifier())
            }
            .buttonStyle(ButtonClickScaleEffectStyle())
            .padding(.bottom,16)
            .alert("Something Went Wrong!", isPresented: $showAlert2) {
                Button("Okay",role: .cancel){
                    
                }
            }message: {
                Text("Server not responding. please try again later")
            }
            
            
            
            Button {
                showAlert3.toggle()
            } label: {
                Text("Two Button Dialog")
                    .modifier(FillColorButtonViewModifier())
            }
            .buttonStyle(ButtonClickScaleEffectStyle())
            .padding(.bottom,16)
            .alert(isPresented: $showAlert3, content: {
                Alert(
                    title:  Text("Something Went Wrong!"),
                    message: Text("Server not responding. please try again later"),
                    primaryButton:.default(Text("Retry")),
                    secondaryButton: .destructive(Text("Cancel"))
                )
            })
        }
        .padding()
        .navigationBarWithBackButton(title: "Dialogs")
    }
}

#Preview {
    PreviewNavigationbar{
        AlertDialogUIView()
    }
}
