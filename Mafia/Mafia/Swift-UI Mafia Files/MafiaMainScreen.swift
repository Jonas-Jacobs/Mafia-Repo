//
//  MafiaMainScreen.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/7/22.
//

import SwiftUI

struct MafiaMainScreen: View {
    let bloodRed = Color(red: 50/255, green: 2/255, blue: 2/255)
    let richBlack = Color(red: 190/255, green: 1/255, blue: 9/255)
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [richBlack, bloodRed]),
                               startPoint: .bottom,
                               endPoint: .top)
                VStack{
                    ZStack{
                        Color(red: 0/255, green: 0/255, blue: 0/255)
                            .frame(width: 300, height: 100, alignment: .center)
                            .cornerRadius(8)
                        Text("Mafia")
                            .font(.system(size: 100, weight: .bold))
                            .foregroundColor(Color(red: 0.6, green: 0, blue: 0))
                        
                    }
                    
                    ZStack{
                        Color(red: 0/255, green: 0/255, blue: 0/255)
                            .frame(width: 200, height: 50, alignment: .center)
                            .cornerRadius(4)
                        NavigationLink {
                            MafiaRoles(player: Game.dummyData.players[0])
                        } label: {
                            Text("Create new game")
                        }
                        .foregroundColor(Color(red: 255/255, green: 0, blue: 0))
                    }
                    ZStack{
                        Color(red: 0/255, green: 0/255, blue: 0/255)
                            .frame(width: 200, height: 50, alignment: .center)
                            .cornerRadius(4)
                        NavigationLink {
                            RolesInfoView()
                        } label: {
                            Text("Learn rolls")
                        }
                        .foregroundColor(Color(red: 1, green: 0, blue: 0))
                    }
                }
            } .ignoresSafeArea()
        }
    }
}

struct MafiaMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MafiaMainScreen()
            .navigationBarHidden(true)
            .navigationTitle("")
    }
}
