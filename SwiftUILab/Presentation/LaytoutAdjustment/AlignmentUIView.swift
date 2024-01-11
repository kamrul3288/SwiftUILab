//
//  AlignmentUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/8/23.
//

import SwiftUI

struct AlignmentUIView: View {
    var body: some View {
        VStack(spacing: 30){
            
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: "mic")
                    .font(.titleRegular)
                    .alignmentGuide(.firstTextBaseline) { context in
                        context[.bottom]  - 0.5 * context.height
                    }
                Text("Connecting")
                        .font(.captionRegular)
                    Text("Bryan")
                        .font(.titleRegular)
            }
            
            HStack(alignment: .imageTitleAlignment){
                VStack{
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.yellow)
                        .frame(width: 150,height: 200)
                    
                    Text("Bell Peppers")
                        .font(.title3Regular)
                }
                
                VStack{
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.yellow)
                        .frame(width: 150,height: 100)
                    
                    Text("Chili Peppers")
                        .font(.title3Regular)
                    
                    Text("Higher levels of capsicum")
                        .font(.captionRegular)
                }
            }
        
            VStack {
                Text("Today's Weather")
                    .font(.title3Regular)
                HStack {
                    Text("🌧")
                    Text("Rain & Thunderstorms")
                    Text("⛈")
                }
                .alignmentGuide(HorizontalAlignment.center) { _ in  50 }
            }
          
            VStack {
                Text("Today's Weather")
                    .font(.title3Regular)
                HStack {
                    Text("🌧")
                        .alignmentGuide(VerticalAlignment.center) { _ in  20 }

                    Text("Rain & Thunderstorms")
                    Text("⛈")
                        .alignmentGuide(VerticalAlignment.center) { _ in  20 }
                }
            }
        }
        .navigationBarWithBackButton(title: "Alignment")
    }
    
    
}

private extension VerticalAlignment{
    private struct ImageTitleAlignment : AlignmentID{
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.bottom]
        }
    }
    
    static let imageTitleAlignment = VerticalAlignment(ImageTitleAlignment.self)
}

struct AlignmentUIView_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentUIView()
    }
}
