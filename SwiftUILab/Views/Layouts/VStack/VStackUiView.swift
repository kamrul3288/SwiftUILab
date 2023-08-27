//
//  VStackUiView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 6/8/23.
//

import SwiftUI

struct VStackUiView: View {
    var body: some View {
        VStack{
            Text("Row 1")
                .font(Font.title3Regular)
            Text("Row 2")
                .font(Font.title3Regular)
            
            GeometryReader { geo in
                VStack(spacing: 0){
                    Text("50% Of Screen")
                        .font(.titleRegular)
                        .foregroundColor(.white)
                        .frame(width: geo.size.width, height: geo.size.height * 0.5)
                        .background(Color.primaryColor)
                    
                    Text("35% Of Screen")
                        .font(.titleRegular)
                        .foregroundColor(.white)
                        .frame(width: geo.size.width, height: geo.size.height * 0.35)
                        .background(Color.primaryColor.opacity(0.9))
                    
                    Text("15% Of Screen")
                        .font(.titleRegular)
                        .foregroundColor(.white)
                        .frame(width: geo.size.width, height: geo.size.height * 0.15)
                        .background(Color.primaryColor.opacity(0.8))
                }
            }
            
            .navigationTitle("VStack")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: NavBackButton())

           
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
    }
}

struct VStackUiView_Previews: PreviewProvider {
    static var previews: some View {
        VStackUiView()
    }
}
