//
//  MafiaMainScreen.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/7/22.
//

import SwiftUI

struct MafiaMainScreen: View {
    let bloodRed = Color(red: 105/255, green: 5/255, blue: 0/255)
    let richBlack = Color(red: 12/255, green: 18/255, blue: 12/255)
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [richBlack, bloodRed]),
                               startPoint: .bottom,
                               endPoint: .top)
                VStack{
                    ZStack{
                        Color(red: 180/255, green: 27/255, blue: 30/255)
                            .frame(width: 200, height: 50, alignment: .center)
                            .cornerRadius(4)
                        NavigationLink {
                            MafiaRoles()
                        } label: {
                            Text("Create new game")
                        }
                        .foregroundColor(Color.black)
                    }
                    
                    ZStack{
                        Color(red: 180/255, green: 27/255, blue: 30/255)
                            .frame(width: 200, height: 50, alignment: .center)
                            .cornerRadius(4)
                        NavigationLink {
                            MafiaRoles()
                        } label: {
                            Text("Learn rolls")
                        }
                        .foregroundColor(Color.black)
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
