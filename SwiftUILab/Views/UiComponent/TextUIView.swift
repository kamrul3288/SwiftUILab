//
//  TextUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 24/8/23.
//

import SwiftUI

struct TextUIView: View {
    private let name:LocalizedStringKey = "my_name"
    var body: some View {
        VStack(alignment: .leading){
            Group{
                Text("Hello! SwifUi. It's Text Component")
                    .padding(.bottom,5)
                Text("Hello! SwifUi. It's Text Component")
                    .font(.title3Regular)
                    .padding(.bottom,5)
                
                Text("Hello! SwifUi. It's Text Component")
                    .font(.system(size: 14,weight: .heavy))
                    .padding(.bottom,5)
                
                Text("Hello! SwifUi. It's Text Component")
                    .font(.title3Regular)
                    .foregroundColor(.red)
                
                Text("Hello! SwifUi. It's Text Component")
                    .font(.headlineRegular)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(10)
                
                Text("Hello Circle")
                    .foregroundColor(.white)
                    .frame(width: 100,height: 100)
                    .background(.red)
                    .clipShape(Circle())
                
                Text("Hello! SwifUi. Single Line of text, More Text, More Space ")
                    .lineLimit(1)
                    .font(.title3Regular)
                    .padding(.bottom,5)
                
                HStack(alignment: .firstTextBaseline){
                    Text("Hello!")
                    Text("SwiftUI")
                        .font(.title3Regular)
                        .foregroundColor(.blue)
                    Text("It's Text Component")
                        .padding(.bottom,5)
                }
            }
            
            Text(name)
                .font(.titleRegular)
            
            Group{
                Text("* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text.")
                    .padding(.bottom,5)
                Text("Visit Apple: [click here](https://apple.com)")
                    .padding(.bottom,5)
                Text("~~A strikethrough example~~")
                    .padding(.bottom,5)
                Text("`Monospaced works too`")
            }
        }
        .frame(maxHeight: .infinity,alignment: .topLeading)
        .padding()
        .navigationBarWithBackButton(title: "Texts")
    }
}

struct TextUIView_Previews: PreviewProvider {
    static var previews: some View {
        TextUIView()
    }
}
