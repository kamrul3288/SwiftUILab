//
//  ImageUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 29/8/23.
//

import SwiftUI

struct ImageUIView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 16){
            
            //----------------------- Rectangle Image Example-----------------------
            Text("Rectangle Image:")
                .font(.title3Bold)
            GeometryReader{frame in
                HStack(spacing: 10){
                    Image(.banner_airplane)
                        .resizable()
                        .frame(width: frame.size.width * 0.5)
                    
                    Image(.banner_airplane)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: frame.size.width * 0.5)
                }
            }.frame(height: 150)
            
            
            //----------------------- Circle Image Example-----------------------
            Text("Circle Image:")
                .font(.title3Bold)
            GeometryReader{frame in
                HStack(spacing: 10){
                    Image(.banner_airplane)
                        .resizable()
                        .frame(width: frame.size.width * 0.5)
                        .clipShape(Circle())
                        
                    
                    Image(.banner_airplane)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: frame.size.width * 0.5)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.red, lineWidth: 2))
                }
            }.frame(height: 150)
            
            //----------------------- Network Image Example-----------------------
            Text("Network Image:")
                .font(.title3Bold)
            AsyncImage(url: URL(string: "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg")){image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 200,height: 150)
                
         
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        .padding()
        .navigationBarWithBackButton(title: "Images")
    }
}

struct ImageUIView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUIView()
    }
}
