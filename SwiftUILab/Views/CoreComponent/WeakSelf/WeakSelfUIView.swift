//
//  WeakSelfUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 16/8/23.
//

import SwiftUI

struct WeakSelfUIView: View {
    @AppStorage("weak_self_object_count") var count:Int?

    var body: some View {
        ZStack{
            NavigationLink(destination: WeakSelfDetailsUIView()) {
                Text("View your todays quote")
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .overlay(
            Text("Object Count: \(count ?? 0)")
                .font(.subheadlineBold)
                .padding()
                .background(Color.primary)
                .foregroundColor(.white)
                .cornerRadius(20),
            
            alignment: .bottomTrailing
        ).padding()
        
        .navigationBarWithBackButton(title: "[weak, self]")
    }
}

struct WeakSelfUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            WeakSelfUIView()
        }
    }
}
