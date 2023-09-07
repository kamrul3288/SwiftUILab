//
//  SwiftUILabApp.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import SwiftUI

@main
struct SwiftUILabApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationHost()
        }
    }
}

//private func loadFont(){
//    for familyName in UIFont.familyNames{
//        print(familyName)
//        for fontName in UIFont.fontNames(forFamilyName: familyName){
//            print("--\(fontName)")
//        }
//    }
//}
