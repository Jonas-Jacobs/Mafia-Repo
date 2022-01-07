//
//  MafiaRoles.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/7/22.
//

import SwiftUI

struct MafiaRoles: View {
    
    @State private var mafia = 0
    @State private var villager = 0
    @State private var healer = 0
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Stepper("Mafia: \(mafia)", value: $mafia, in: 1...4)
      
                    Stepper("Villager: \(villager)", value: $villager, in: 1...4)
  
                    Stepper("Healer: \(healer)", value: $healer, in: 1...4)
                }
            }
        }
    }
}

struct MafiaRoles_Previews: PreviewProvider {
    static var previews: some View {
        MafiaRoles()
    }
}
