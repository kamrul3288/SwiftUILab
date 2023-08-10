//
//  ViewThatFitsUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 10/8/23.
//

import SwiftUI

struct ViewThatFitsUIView: View {
    
    @State private var index = 1
    @State private var width:CGFloat = 200
    
    var body: some View {
        VStack{
            
            Stepper("\(index) Rectangle", value: $index,in: 1...12)
                .font(.title3Medium)
            
            ViewThatFits{
                rectangleView()
                    .foregroundColor(.red)
                ScrollView(.horizontal){
                    rectangleView()
                        .foregroundColor(.green)
                }
            }
            
            
            Text("Avoid Truncating Text")
                .font(.title3Medium)
                .padding(.top,16)
            
            Slider(value: $width, in: 70...200)
                .foregroundColor(.red)
            
            ViewThatFits{
                Button("Add New Cart"){}
                Button("Add New"){}
                Button{}label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .font(.title3Regular)
            .buttonStyle(.borderedProminent)
            .frame(width: width)
            .border(Color.primary)

            
        }
        .padding(.horizontal,16)
        
        .navigationBarWithBackButton(title: "ViewThatFits")
    }
    
    private func rectangleView() -> some View{
        return HStack{
            ForEach(1...index, id: \.self){_ in
                Rectangle()
                    .frame(width: 150,height: 150)
            }
        }
    }
}

struct ViewThatFitsUIView_Previews: PreviewProvider {
    static var previews: some View {
        ViewThatFitsUIView()
    }
}
