//
//  Home.swift
//  FamilyApp
//
//  Created by Ricky Villareal on 6/9/24.
//

import SwiftUI

struct Home: View {
    @State var currentDate: Date = Date()

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20){
                
                // MARK: Custom date picker
                CustomDatePicker(currentDate: $currentDate)
            }
        }
        
        
    }
}

#Preview {
    Home()
}
