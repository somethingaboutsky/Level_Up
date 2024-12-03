//
//  PickerSegmentedControl.swift
//  Level_Up
//
//  Created by Ilenia Munfuletto on 02/12/24.
//

import SwiftUI

struct PickerSegmentedControl: View {
    
    @Binding var selectedSection: Section
    
    var body: some View {
        VStack {
            Picker("GameSection", selection: $selectedSection) {
                ForEach(Section.allCases, id: \.self) {
                    Text($0.rawValue)
                        .foregroundColor(.black)
                }
            }
            .pickerStyle(.segmented)
        }
        //.padding(.bottom, 0)
    }
}


