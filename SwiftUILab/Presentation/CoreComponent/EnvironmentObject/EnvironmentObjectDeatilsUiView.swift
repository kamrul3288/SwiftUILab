//
//  EnvironmentObjectDeatilsUiView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 23/8/23.
//

import SwiftUI

struct EnvironmentObjectDeatilsUiView: View {
    @EnvironmentObject var viewModel:EnvironmentObjectViewModel
    
    var body: some View {
        Text("\(viewModel.counter)")
            .font(.system(size: 100))
            .fontWeight(.heavy)
        
        .navigationBarWithBackButton(title: "Deatils")
    }
}
