//
//  StatePropertyUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 16/8/23.
//

//A property wrapper type that can read and write a value managed by SwiftUI.
import SwiftUI

struct StatePropertyUIView: View {
    @State private var counterValue = 0
    
    var body: some View {
        VStack{
            
            Text("\(counterValue)")
                .font(.largeTitleRegular)
                .fontWeight(.bold)
            
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
        .navigationBarWithBackButton(title: "@State")
    }
}

struct StatePropertyUIView_Previews: PreviewProvider {
    static var previews: some View {
        StatePropertyUIView()
    }
}
