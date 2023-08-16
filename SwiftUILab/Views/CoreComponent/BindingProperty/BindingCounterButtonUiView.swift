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
                counterValue += 1
            }
            .foregroundColor(Color.white)
            .padding()
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button("Decrement"){
                counterValue -= 1
            }
            .foregroundColor(Color.white)
            .padding()
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct BindingCounterButtonUiView_Previews: PreviewProvider {
    static var previews: some View {
        BindingCounterButtonUiView(counterValue: .constant(10))
    }
}
