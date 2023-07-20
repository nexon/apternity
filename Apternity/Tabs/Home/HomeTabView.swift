//
//  HomeTabView.swift
//  apternity
//
//  Created by Alberto Lagos on 16-07-23.
//

import SwiftUI

struct HomeTabView: View {
    @State private var currentDate: Date = .init()
    @State private var weekSlider: [[WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    @State private var createWeek: Bool = false
    @State private var entries: [Entry] = [
        .init(id: UUID(), name: "Example 1", isCompleted: true, creationDate: Date()),
        .init(id: UUID(), name: "Example 2", isCompleted: false, creationDate: Date()),
        .init(id: UUID(), name: "Example 3", isCompleted: false, creationDate: Date()),
        .init(id: UUID(), name: "Example 4", isCompleted: true, creationDate: Date()),
    ]
    
    @Namespace private var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            headerView()
            
            ScrollView(.vertical) {
                VStack {
                    // Task View
                    taskView()
                }
                .hSpacing(.center)
                .vSpacing(.center)
            }
            .scrollIndicators(.hidden)
        }
        .vSpacing(.top)
        .onAppear {
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                
                if let firstDate = currentWeek.first?.date {
                    weekSlider.append(firstDate.previousWeek())
                }
                
                weekSlider.append(currentWeek)
                
                if let lastDate = currentWeek.last?.date {
                    weekSlider.append(lastDate.nextWeek())
                }
            }
        }
    }
    
    @ViewBuilder
    func headerView() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(.blue.opacity(0.7))
                
                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.gray.opacity(0.7))
            }
            .font(.title.bold())
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
            
            /// WEEK SLIDER
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id:\.self ) { index in
                     let week = weekSlider[index]
                    WeekView(week)
                        .padding(.horizontal, 15)
                        .tag(index )
                }
            }
            .padding(.horizontal, -15)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
        }
        .hSpacing(.leading)
        .overlay(alignment: .topTrailing) {
            Button(action: {}) {
                Image(systemName: "pills")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
            }
        }
        .padding(15)
        .background(.white)
        .onChange(of: currentWeekIndex, perform: { newValue in
            // creating when it reaches firt/last page
            
            if newValue == 0 || newValue == (weekSlider.count - 1) {
                paginateWeek()
                createWeek = true
            }
        })
    }
    
    @ViewBuilder
    func taskView() -> some View {
        VStack(alignment: .leading, spacing: 35) {
            ForEach($entries) { $entry in
                EntryRowView(entry: $entry)
            }
        }
        .padding([.vertical, .leading], 15)
        .padding(.top, 15)
    }
    
    func paginateWeek() {
        // SafeCheck
        if weekSlider.indices.contains(currentWeekIndex) {
            if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
                // Inserting new week at 0th index and removing last array item
                weekSlider.insert(firstDate.previousWeek(), at: 0)
                weekSlider.removeLast()
                currentWeekIndex = 1
            }
            
            if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
                // Inserting new week at last index and removing first array item
                weekSlider.append(lastDate.nextWeek())
                weekSlider.removeFirst()
                currentWeekIndex = weekSlider.count - 2
            }
        }
    }
    
    // WeekView
    @ViewBuilder
    func WeekView(_ week: [WeekDay] ) -> some View {
        HStack(spacing: 0) {
            ForEach(week) { day in
                VStack(spacing: 8) {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.bold )
                        .foregroundStyle(day.date.isSameDate(currentDate) ? .white : .gray)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .background {
                            if day.date.isSameDate(currentDate) {
                                Circle()
                                    .fill(.blue)
                                    .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                            }
                            
                            // Indicator
                            
                            if day.date.isToday() {
                                Circle()
                                    .fill(.cyan)
                                    .frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                                    .offset(y: 12)
                            }
                        }
                }
                .hSpacing(.center)
                .onTapGesture {
                    withAnimation {
                        currentDate = day.date
                    }
                }
            }
        }
        .background {
            GeometryReader {
                let minX = $0.frame(in: .global).minX
                
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self) { value in
                        // Because of padding (15)
                        if value.rounded() == 15 && createWeek {
                            print("Generate")
                            createWeek = false
                        }
                    }
            }
        }
    }
}

struct ATYHomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
