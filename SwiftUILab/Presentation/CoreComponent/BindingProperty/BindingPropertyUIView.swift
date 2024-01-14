//
//  BindingPropertyUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 16/8/23.
//

//A property wrapper type that can read and write a value owned by a source of truth.
import SwiftUI

struct BindingPropertyUIView: View {
    @State private var countValue = 0
    var body: some View {
        VStack{
            Text("\(countValue)")
                .font(.largeTitleRegular)
            
            BindingCounterButtonUiView(counterValue: $countValue)
        }
        .navigationBarWithBackButton(title: "@Binding")
    }
}

#Preview {
    BindingPropertyUIView()
}
