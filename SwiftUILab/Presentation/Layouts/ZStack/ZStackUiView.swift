//
//  ZStackUiView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 3/8/23.
//

import SwiftUI

//A view that overlays its subviews, aligning them in both axes.
// If i set frame size then alignement should be declare in inside frame otherwise its won't work
struct ZStackUiView: View {
    
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    var body: some View {
        VStack{
            
            //---------------------Example 1--------------------
            ZStack{
                ForEach(0..<colors.count, id: \.self) {index in
                    Rectangle()
                        .fill(colors[index])
                        .frame(width: 100, height: 100)
                        .offset(x: CGFloat(index) * 10.0, y: CGFloat(index) * 10.0)
                }
            }
            
            Divider()
                .padding(.top,70)
            //---------------------Example 2--------------------
            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 50)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width:50, height: 100)
            }
            .border(Color.green, width: 1)
            .padding(.top,10)
            
            
            //---------------------Example 3--------------------
            Divider().padding(.vertical,16)
            ZStack{
               Text("Bottom Alignment")
            }
            .frame(width: 200, height: 50, alignment: .bottom)
            .border(Color.green, width: 1)
            
            
            //---------------------Example 4--------------------
            Divider().padding(.vertical,16)
            ZStack{
              
            }
            .frame(width: 220, height: 120)
            .background(.green)
            .overlay{
                Circle()
                    .frame(width: 100, height: 90)
                    .foregroundColor(.red)
                    .shadow(radius: 10)
            }
            
            
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top )
        
        .navigationTitle("ZStack")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBackButton())
        
    }
}

struct ZStackUiView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackUiView()
    }
}
