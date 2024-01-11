//
//  BindingCounterButtonUiView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 16/8/23.
//

import SwiftUI

struct BindingCounterButtonUiView: View {
    @Binding var counterValue:Int
    var body: some View {
        HStack{
            Button("Increment"){
                self.counterValue += 1
            }
            .foregroundColor(Color.white)
            .padding()
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button("Decrement"){
                self.counterValue -= 1
            }
            .foregroundColor(Color.white)
            .padding()
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
