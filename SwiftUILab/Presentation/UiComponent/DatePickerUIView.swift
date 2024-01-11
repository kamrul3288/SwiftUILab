//
//  DatePickerUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 2/9/23.
//

import SwiftUI

struct DatePickerUIView: View {
    @State private var date = Date.now
    @State private var formattedDate = ""
    @State private var isPresented:Bool = false
    
    var body: some View {
        Form{
            Section(header: (Text("Date Time Picker"))){
                DatePicker("DateTime: ", selection: $date)
            }
            
            Section(header: (Text("Date  Picker"))){
                DatePicker("Date: ", selection: $date, in: Date()..., displayedComponents: .date)
            }
            
            Section(header: (Text("Date  Picker For Next 6 Days"))){
                //6 days are 518400 second
                DatePicker(
                    "Date: ",
                    selection: $date,
                    in: Date()...Date().addingTimeInterval(518400),
                    displayedComponents: .date
                )
            }
            
            Section(header: (Text("DateTime  Picker Style"))){
                Button("Open Date Picker Sheet"){
                    isPresented = true
                }
                Text("\(date)")
            }
        }
        .sheet(isPresented: $isPresented){
            DatePicker(
                "Select your birth date", selection: $date,
                in: Date()...Date().addingTimeInterval(518400),
                displayedComponents: [.date]
            )
            .labelsHidden()
            .datePickerStyle(WheelDatePickerStyle())
            .presentationDetents([.height(250)])
        }
        .navigationBarWithBackButton(title: "Date Picker")
    }
}

struct DatePickerUIView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerUIView()
    }
}
