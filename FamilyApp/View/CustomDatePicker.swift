//
//  CustomDatePicker.swift
//  FamilyApp
//
//  Created by Ricky Villareal on 6/9/24.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    
    //MARK: Month update on arrow button clicks..
    @State var currentMonth: Int = 0
    
    var body: some View {
        VStack (spacing: 35){
            let days: [String] = ["SUN", "MON", "TUES", "WED", "THURS", "FRI", "SAT"]
            HStack(spacing: 20) {
                VStack (alignment: .leading, spacing: 10){
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1])
                        .font(.title.bold())
                }
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Button{
                    withAnimation{
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button{
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 0){
                ForEach(days,id: \.self) {day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
            }
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns,spacing: 15) {
                ForEach(extractDate()){ value in
                    CardView(value: value)
                }
            }
            
        }
        .onChange(of: currentMonth) {
            // updating Month
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue)->some View{
        VStack{
            if value.day != -1 {
                if (tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }) != nil){
                    Text("\(value.day)")
                        .font(.title3.bold())
                    Spacer()
                    Circle()
                        .fill(Color("cyan"))
                        .frame(width: 8, height:8)
                } else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                    Spacer()
                }
            }
        }
        .padding(.vertical, 8)
        .frame(height: 50, alignment: .top)
    }
    
    //checking date
    func isSameDay(date1: Date, date2: Date) -> Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraDate()->[String]{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()->Date{
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        
        let calendar = Calendar.current
        
        let currentMonth = getCurrentMonth()
        
        var days =  currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        //adding offset days to get exact week day...
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
}

#Preview {
    ContentView()
}


extension Date{
    
    func getAllDates()-> [Date] {
        
        let calendar = Calendar.current
        
        //getting starting date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
                
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
