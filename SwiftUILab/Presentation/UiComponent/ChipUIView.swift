//
//  ChipUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 25/2/24.
//

import SwiftUI

struct ChipUIView: View {
    @State private var selectedChoiceTag:String = ""
    @State private var selectedFilterTag:Set<String> = []
    var body: some View {
        VStack(alignment:.leading){
            Text("Choice Tag")
                .font(.title3Regular)
            ChoiceTagView(selectedTag: $selectedChoiceTag)
            
            Text("Filter Tag")
                .font(.title3Regular)
                .padding(.top, 24)
            FilterTagView(selectedTags: $selectedFilterTag)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        .padding()
    }
}

fileprivate struct ChoiceTagView : View {
    @Binding var selectedTag:String
    private let tags:[String] = ["Tomato","Carrot","Beans","Pumpkin","Green Papaya"]

    var body: some View {
        WrappingHStack(alignment:.leading){
            ForEach(Array(tags.enumerated()),id:\.element){index, tag in
                let contentColor = selectedTag == tag ? Color.white : Color.black
                HStack{
                    if(selectedTag == tag){
                        Image(systemName: "checkmark")
                    }
                    Text(tag)
                }
                .foregroundColor(contentColor)
                .padding(.horizontal,16)
                .padding(.vertical,8)
                .background(selectedTag == tag ? Color.Primary : Color.transparent)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.Primary, lineWidth:1)
                )
                .onTapGesture {
                    selectedTag = tag
                }
            }
        }
        .navigationBarWithBackButton(title: "Tags Example")
    }
}


fileprivate struct FilterTagView : View {
    @Binding var selectedTags:Set<String>
    private let tags:[String] = ["Canceled","In Progress","Confirmed","Completed"]

    var body: some View {
        WrappingHStack(alignment:.leading){
            ForEach(Array(tags.enumerated()),id:\.element){index, tag in
                let tagIsSelected = selectedTags.contains(tag)
                let contentColor = tagIsSelected ? Color.white : Color.black
                HStack{
                    if(tagIsSelected){
                        Image(systemName: "checkmark")
                    }
                    Text(tag)
                }
                .foregroundColor(contentColor)
                .padding(.horizontal,16)
                .padding(.vertical,8)
                .background(tagIsSelected ? Color.Primary : Color.transparent)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.Primary, lineWidth:1)
                )
                .onTapGesture {
                    if(tagIsSelected){
                        selectedTags.remove(tag)
                    }else{
                        selectedTags.insert(tag)
                    }
                }
            }
        }
    }
}

#Preview {
    PreviewNavigationbar{
        ChipUIView()
    }
}
