//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Charuka on 2025-04-07.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
         let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
         let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
         return min...max
     }
    
    var body: some View {
        List{
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal date")
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
