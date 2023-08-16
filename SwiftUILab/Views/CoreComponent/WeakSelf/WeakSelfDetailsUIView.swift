//
//  WeakSelfDetailsUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 16/8/23.
//

import SwiftUI

struct WeakSelfDetailsUIView: View {
    @StateObject private var viewModel = WeakSelfViewModel()
    var body: some View {
        ZStack{
            if viewModel.isLoading{
                ProgressView()
                
            }else{
                Text(viewModel.quote)
                    .font(.title3Bold)
                    .multilineTextAlignment(.leading)
            }
        }.padding()
        
        .navigationBarWithBackButton(title: "Details")
    }
}

struct WeakSelfDetailsUIView_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfDetailsUIView()
    }
}
