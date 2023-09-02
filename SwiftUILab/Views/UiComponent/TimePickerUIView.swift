//
//  TimePickerUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 2/9/23.
//

import SwiftUI

struct TimePickerUIView: View {
    @State private var date = Date.now
    @State private var isPresented:Bool = false

    var body: some View {
        Form{
            Section(header: (Text("Time  Picker"))){
                DatePicker("Time: ", selection: $date, displayedComponents: .hourAndMinute)
            }
            
            Section(header: (Text("Time  Picker"))){
                DatePicker("Time: ", selection: $date, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                Text("\(date)")
            }
        }
        .navigationBarWithBackButton(title: "Time Picker")
    }
}

struct TimePickerUIView_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerUIView()
    }
}
