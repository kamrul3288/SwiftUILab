//
//  EnvironmentObjectViewModel.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 23/8/23.
//

import Foundation

class EnvironmentObjectViewModel : ObservableObject{
    @Published var counter = 0
    
    func increment(){
        counter += 1
    }
    
    func decrement(){
        counter -= 1
    }
}
