//
//  ObservableAndStateObjectUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 23/8/23.
//

import SwiftUI

//  @ObservedObject property wrappers tell a SwiftUI view to update in response to changes from an observed object.

//  @StateObject property wrappers tell a SwiftUI view to update in response to changes from an observed object.

//  @Published notify the @ObservableObject when data chnages and then @ObservableObject notify the @ObservedObject. and then @ObservedObject notify the View

// @ObservableObject can reinitialized value when view recreated that means it lost previous value

// @StateObject can survive when view recreated and use in parent view @StateObject and child view use @ObservedObject


struct ObservableAndStateObjectUIView: View {
    @StateObject var viewModel = ObservableAndStateObjectViewModel()
    var body: some View {
        ZStack{
            if(viewModel.isLoading){
                ProgressView()
            }
            
            else {
                List{
                    ForEach(viewModel.countryList){country in
                        HStack{
                            Text("\(country.id)")
                                .padding()
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .clipShape(Circle())
                            
                            Text(country.name)
                        }
                    }
                    .onDelete(perform: viewModel.delete)
                }
            }
        }
        
        .navigationBarWithBackButton(title: "ObservableAndStateObject")
    }
    
}

struct ObservableAndStateObjectUIView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableAndStateObjectUIView()
    }
}
