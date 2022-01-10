//
//  MembersList.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/7/22.
//

import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var name = "String"
    var role = "String"
}

struct MembersList: View {
    var player = [Player]()
    
    var body: some View {
        NavigationView{
            List(player, id: \.id) { players in
//                NavigationLink {
//
//                }
            }
        }
    }
}

struct MembersList_Previews: PreviewProvider {
    static var previews: some View {
        MembersList()
    }
}
