//
//  WeakSelfViewModel.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 16/8/23.
//

import Foundation

class WeakSelfViewModel : ObservableObject{
    @Published var quote = ""
    @Published var isLoading = false
    
    init() {
        print("WeakSelfViewModel Object: CREATED")
        
        //--------------- Increment count when WeakSelfViewModel object created-----------
        let currentObjectCount = UserDefaults.standard.integer(forKey: "weak_self_object_count")
        UserDefaults.standard.set(currentObjectCount + 1, forKey: "weak_self_object_count")
        
        generateTodaysQuoteAndPublished()
    }
    
    //------------ This method is called when WeakSelfViewModel object deallocate from memory------------
    deinit{
        let currentObjectCount = UserDefaults.standard.integer(forKey: "weak_self_object_count")
        UserDefaults.standard.set(currentObjectCount - 1, forKey: "weak_self_object_count")
        print("WeakSelfViewModel Object: DESTROYED")
    }
    
    private func generateTodaysQuoteAndPublished(){
        isLoading = true
        
        // when we using this strong reference unitl the closure task complete the viewmodel keep alive that means if user move another screen this object instance keep in memmory
        // Without Weak Self If you back from the screen before quote generate it's object alive
        /*
        DispatchQueue.main.asyncAfter(deadline: .now()+500){
            self.isLoading = false
            self.quote = "Any fool can write code that a computer can understand. Good programmers write code that humans can understand."
        }
        */
        
        //To resolve this problem need to use [weak self]
        DispatchQueue.main.asyncAfter(deadline: .now()+5.0){[weak self] in
            guard let self = self else { return }
            self.isLoading = false
            self.quote = "Any fool can write code that a computer can understand. Good programmers write code that humans can understand."
        }
        
        
    }
}
