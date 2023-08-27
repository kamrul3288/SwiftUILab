//
//  PinnedScrollUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 10/8/23.
//

import SwiftUI

struct PinnedScrollUIView: View {
    var body: some View {
        ScrollView(.vertical){
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                ForEach(0..<5){index in
                    Text("Item -  \(index)")
                        .padding(.horizontal,16)
                    Divider()
                }
                
                Section(header: headerView()) {
                    ForEach(0..<50){index in
                        Text("Ongoing Item -  \(index)")
                            .padding(.horizontal,16)
                        Divider()
                    }
                }
            }
        }
        .navigationBarWithBackButton(title: "Pinned ScrollView")
    }
    
    
    private func headerView() -> some View{
        return HStack{
            Text("Ongoning Items")
                .font(.title3Medium)
                .padding(16)
                .foregroundColor(.white)
            Spacer()
        }
        .background(Color.primaryColor)
    }
}


struct PinnedScrollUIView_Previews: PreviewProvider {
    static var previews: some View {
        PinnedScrollUIView()
    }
}
