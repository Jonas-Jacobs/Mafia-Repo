//
//  RolesInfoView.swift
//  Mafia
//
//  Created by Reece Olsen on 1/10/22.
//

import SwiftUI
//let predefinedMafiaRoles = [
//    Mafia(role: "Mafia", description: "Votes with other mafia members to attempt to kill a player."),
//    Mafia(role:"Doctor", description: "Selects somebody to save"),
//    Mafia(role:"Villager", description: "Has no specific actions, participates in town votes"),
//    Mafia(role:"Detective", description: "Investigates one person to discover who they side on."),
//
//]

var predefinedMafiaRoles = Role.allCases
struct RolesInfoView: View {
    
    var body: some View {
        List{
            ForEach(predefinedMafiaRoles) { mafiaRoles in
                VStack(alignment: .leading){
                    
                    
                    Text(mafiaRoles.title)
                        .bold()
                    Text(mafiaRoles.description)
                    
                }
            }
        }
    }
}

struct RolesInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RolesInfoView()
    }
}
