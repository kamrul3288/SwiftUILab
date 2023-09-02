//
//  ButtonUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 27/8/23.
//

import SwiftUI

struct ButtonUIView: View {
    var body: some View {
        VStack(alignment: .center) {
            
            //---------------Example Text Button----------------------
            Button {} label: {
                Text("Text Button")
            }
            .padding(.bottom,16)
            
            
            //---------------Example Rounded Corner Button----------------------
            Button {} label: {
                Text("Rounded Corner")
                    .modifier(FillColorButtonViewModifier())
            }
            .buttonStyle(ButtonClickScaleEffectStyle())
            .padding(.bottom,16)
            
            //---------------Example Outline  Button----------------------
            Button {} label: {
                Text("Outline Button")
                    .modifier(OutlineButtonViewModifier())
            }
            .padding(.bottom,16)
            
            //---------------Example Leading Icon Button----------------------
            Button {} label: {
                Spacer()
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Leading Icon Button")
                Spacer()
                
            }
            .modifier(FillColorButtonViewModifier())
            .padding(.bottom,16)
            
            //------------Icon Button------------
            HStack{
                
                //--------------------Plain ion button---------------------
                Button {} label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                }
                .padding(.trailing,16)
                
                
                //--------------------Fill circle color ion button---------------------
                Button {} label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.primaryColor)
                .clipShape(Circle())
                .padding(.trailing,16)
                
                //--------------------Border circle color ion button---------------------
                Button {} label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                }
                .padding(10)
                .overlay(
                    Circle().stroke(Color.primaryColor,lineWidth: 1)
                )
            }
            .padding(.bottom,16)
            
            //-----------Fab Button--------------
            HStack{
                
                //-----------Plain fab--------------
                Button {} label: {
                    Text("FAB")
                }
                .foregroundColor(.white)
                .padding(10)
                .background(Color.primaryColor)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding(.horizontal,16)
                
                //--------------extended fab-------------
                Button {} label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Extenden FAB")
                }
                .foregroundColor(.white)
                .padding(10)
                .background(Color.primaryColor)
                .cornerRadius(10)
                .shadow(radius: 10)
                
            }
            Spacer()
        }.padding()
            .navigationBarWithBackButton(title: "Buttons")
    }
}




struct ButtonUIView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonUIView()
    }
}
