//
//  GeomatryPreferenceView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/1/24.
//

import SwiftUI

struct GeomatryPreferenceView: View {
    @State private var scrollOffset:CGFloat = 0
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Initial Title")
                    .font(.title3Bold)
                    .opacity(scrollOffset/75)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(
                        GeometryReader{proxy in
                            Text("")
                                .preference(key: GeometryPreferenceKey.self, value: proxy.frame(in: .global).minY)
                        }
                    )
                
                ForEach(0..<30){_ in 
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.Primary.opacity(0.5))
                        .frame(height: 150)
                }
            }
            .padding()
        }
        .onPreferenceChange(GeometryPreferenceKey.self, perform: { value in
            self.scrollOffset = value
        })
        .overlay(
            Text("Scroll Title")
                .font(.title3Bold)
                .padding()
                .frame(maxWidth: .infinity,alignment: .leading)
                .frame(height: 50)
                .background(Color.Primary)
                .foregroundColor(Color.White)
                .opacity(scrollOffset<20 ? 1.0:0.0)
            
            ,alignment: .top
        )
    }
}

fileprivate struct GeometryPreferenceKey : PreferenceKey{
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    GeomatryPreferenceView()
}
