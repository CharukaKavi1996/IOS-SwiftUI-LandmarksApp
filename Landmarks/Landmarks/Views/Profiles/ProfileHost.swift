//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Charuka on 2025-04-03.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                if editMode?.wrappedValue == .active{
                    Button("Cancel", role: .cancel){
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
                    .transition(.move(edge: .leading))
            }else{
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
                    .transition(.move(edge: .trailing))
            }
        }
        .padding()
        .animation(.easeInOut, value: editMode?.wrappedValue)
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
