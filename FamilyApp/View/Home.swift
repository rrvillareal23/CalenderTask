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
                CustomDatePicker(currentDate: $currentDate, tasks: tasks)
            }
            .padding(.vertical)
        }
        .safeAreaInset(edge: .bottom) {
            HStack{
                Button{
                    
                } label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray, in: Capsule())
                        .foregroundColor(.white)
                }
                
                Button{
                    
                } label: {
                    Text("Add Reminder")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.purple, in: Capsule())
                        .foregroundColor(.white)
                }
                
                
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
    }
}

#Preview {
    Home()
}
