//
//  TextFieldUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 30/8/23.
//

import SwiftUI

struct TextFieldUIView: View {
    @State private var name = ""
    @FocusState private var isNameFoused:Bool
    
    @State private var email = ""
    @FocusState private var isEmailFoused:Bool
    
    @State private var password = ""
    @FocusState private var isPasswordFoused:Bool
    @State private var isPasswordVisible:Bool = false
    @State private var isPasswordInvalid = false
    
    
    @State private var address = ""
    @FocusState private var isAddressFoused:Bool
    
    @State private var country = ""
    @FocusState private var isCountryFoused:Bool
    @State private var isShowingSuggestions = false
    let autocompleteSuggestions = ["Apple", "Banana", "Cherry", "Grapes", "Orange"]
    
    
    
    var body: some View {
        VStack(alignment: .leading){
            
            //-----------UNDERLINE TextField Example---------------
            HStack(spacing: 8){
                Image(systemName: "person.circle")
                    .font(.title3Regular)
                    .foregroundColor(.black)
                VStack{
                    TextField("Enter your name", text: $name)
                        .focused($isNameFoused)
            
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(isNameFoused ? .Primary : .Primary.opacity(0.5))
                }
            }.padding(.bottom,16)
            
            
            //-----------Outline Border TextField Example---------------
            TextField("Enter your email", text: $email)
                .keyboardType(.emailAddress)
                .focused($isEmailFoused)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(isEmailFoused ? Color.Primary : Color.Primary.opacity(0.5),lineWidth: 1)
                )
                .padding(.bottom,16)
            
            
            //-----------Outline Border Leading and Trailing Icon TextField Example---------------
            Group{
                HStack{
                    Image(systemName: "lock.circle")
                        .font(.title3Regular)
                        .foregroundColor(.Primary.opacity(0.5))
                    
                    if(isPasswordVisible){
                        TextField("Enter your password", text: $password)
                            .lineLimit(1)
                            .focused($isPasswordFoused)
                            .onChange(of: password) {
                                isPasswordInvalid = password.count < 6
                            }
                    }else{
                        SecureField("Enter your password", text: $password)
                            .lineLimit(1)
                            .focused($isPasswordFoused)
                            .onChange(of: password) {
                                isPasswordInvalid = password.count < 6
                            }
                    }
                    
                    Button {
                        isPasswordVisible.toggle()
                        isPasswordFoused = true
                    } label: {
                        Image(systemName: isPasswordVisible ? "eye.slash.circle" : "eye.circle")
                            .font(.title3Regular)
                            .foregroundColor(.Primary.opacity(0.5))
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(isPasswordFoused ? Color.Primary : Color.Primary.opacity(0.5),lineWidth: 1)
                )
                
                
                if(isPasswordInvalid){
                    HStack{
                        Image(systemName: "exclamationmark.circle.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.red)
                        Text("Password length must be six")
                            .foregroundColor(.red)
                            .font(.captionMedium)
                    }
                }
            }
            
            
            //-----------Full Background TextField Example---------------
            TextField("", text: $address)
                .focused($isAddressFoused)
                .placeholder(when: address.isEmpty){
                    Text("Enter your address")
                        .foregroundColor(.white.opacity(0.5))
                }
                .accentColor(.white) // It's chnage cursor color
                .foregroundColor(.white)
                .padding()
                .background(Color.Primary)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(isAddressFoused ? Color.red : Color.transparent,lineWidth: 2)
                )
                .padding(.vertical,16)
            
            
        
        }.frame(maxHeight: .infinity,alignment: .topLeading)
        
        .padding()
        .navigationBarWithBackButton(title: "Textfield")
        
        .onChange(of: isNameFoused) { oldValue, newValue in
            isNameFoused = newValue
        }
        .onChange(of: isEmailFoused) { oldValue, newValue in
            isEmailFoused = newValue
        }
        .onChange(of: isPasswordFoused) { oldValue, newValue in
            isPasswordFoused = newValue
        }
        .onChange(of: isAddressFoused) { oldValue, newValue in
            isAddressFoused = newValue
        }
    }
}

#Preview{
    PreviewNavigationbar{
        TextFieldUIView()
    }
}
