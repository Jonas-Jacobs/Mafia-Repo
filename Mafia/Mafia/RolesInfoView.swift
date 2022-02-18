//
//  RolesInfoView.swift
//  Mafia
//
//  Created by Reece Olsen on 1/10/22.
//

import SwiftUI

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
