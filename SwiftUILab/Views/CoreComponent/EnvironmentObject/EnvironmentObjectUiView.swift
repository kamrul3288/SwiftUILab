//
//  EnvironmentObjectUiView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 23/8/23.
//

import SwiftUI

struct EnvironmentObjectUiView: View {
    @StateObject var viewModel = EnvironmentObjectViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Button("Increment+"){
                    viewModel.increment()
                }
                .foregroundColor(Color.white)
                .fontWeight(.heavy)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                
                Button("Decrement-"){
                    viewModel.decrement()
                }
                .foregroundColor(Color.white)
                .fontWeight(.heavy)
                .padding()
                .background(Color.red)
                .cornerRadius(10)
            }.padding(.bottom, 30)
            
            
            NavigationLink(
                destination: EnvironmentObjectDeatilsUiView()
                    .environmentObject(viewModel)
            ) {
                Text("Show Counter Count")
            }
        }
        .navigationBarWithBackButton(title: "EnvironmentObject")
    }

}



struct EnvironmentObjectUiView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectUiView()
    }
}
