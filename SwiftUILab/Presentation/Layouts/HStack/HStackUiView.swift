//
//  HStackUiView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 6/8/23.
//

import SwiftUI

struct HStackUiView: View {
    
    @State private var totalHeight = CGFloat(0)

    var body: some View {
        VStack{
            
            HStack(spacing: 20){
                Text("iPhone")
                Text("iPad")
                Text("Mac OS")
            }.padding(.top,25)
            
            
            GeometryReader{proxy in
                HStack(spacing: 0){
                    Text("30%")
                        .padding(10)
                        .frame(width: proxy.size.width * 0.3)
                        .background(.red)
                    Text("40%")
                        .padding(10)
                        .frame(width: proxy.size.width * 0.4)
                        .background(.blue)
                    
                    Text("30%")
                        .padding(10)
                        .frame(width: proxy.size.width * 0.3)
                        .background(.pink)
                }
                .background(
                    GeometryReader{ geo -> Color in
                        DispatchQueue.main.async {
                            self.totalHeight = geo.size.height
                        }
                        return Color.clear
                    }
                )
            }
            .frame(height: totalHeight)
            .padding(.top, 25)
            
            HStack{
                Image(systemName: "person")
                    .resizable()
                    .padding(20)
                    .frame(width: 80,height: 80)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .clipShape(Circle())
                
                VStack(alignment:.leading,spacing: 5){
                    Text("Kamrul Hasan")
                        .font(.title3Medium)
                    Text("Mobile Application Developer")
                        .font(.captionMedium)
                }
            }
            .padding(.top, 25)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
        .navigationTitle("HStack")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBackButton())
    }
}

struct HStackUiView_Previews: PreviewProvider {
    static var previews: some View {
        HStackUiView()
    }
}
