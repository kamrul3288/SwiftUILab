//
//  SnackbarUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 20/9/23.
//

import SwiftUI

struct SnackbarUIView: View {
    @State var isSnackbarPresented: Bool = false

    
    var body: some View {
        Button {
            isSnackbarPresented = true
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                isSnackbarPresented = false
            }
        } label: {
            Text("Show Snackbar")
             .modifier(FillColorButtonViewModifier())
        }
        .padding()
        
        .snackbar(isShow: $isSnackbarPresented, message: "Email send successful...")
        .navigationBarWithBackButton(title: "Snack Bar")
    }
}

extension View{
    @ViewBuilder
    func snackbar(isShow:Binding<Bool>, message:String) -> some View{
        self.sheet(isPresented: isShow) {
            ZStack(alignment: .leading){
                Color.Primary.ignoresSafeArea()
                Text(message)
                    .padding(.top, 20)
                    .padding(.leading, 16)
                    .foregroundColor(.white)
            }
            .presentationDetents([.height(50)])
            .presentationCornerRadius(0)
        }
    }
}

#Preview {
    SnackbarUIView()
}
