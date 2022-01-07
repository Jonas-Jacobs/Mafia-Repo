//
//  MafiaMainScreen.swift
//  Mafia
//
//  Created by Jonas Jacobs on 1/7/22.
//

import SwiftUI

struct MafiaMainScreen: View {
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Color.red
                .frame(width: 200, height: 50, alignment: .center)
                Button("Create new Game"){
                   
                    }
                }
                
                Button("Find rolls") {
                    
                }
            }
        }
    }
}

struct MafiaMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MafiaMainScreen()
    }
}
