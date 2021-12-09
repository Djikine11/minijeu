//
//  ContentView.swift
//  jeu
//
//  Created by Ousmane Djikine on 29/11/2021.
//

import SwiftUI

struct ContentView: View {
@State  var score = 0
 
@State var bestScore = 0
@State var gameInProgress = false
    

    
    var body: some View {
        VStack{
            
            HStack{
                if score >= bestScore && score != 0{
                    
                    Image(systemName: "flame")
                }
                Text("score:\(score)").padding()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                if gameInProgress == true{
                    Image(systemName: "plus.square")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
            score =  score  + 1
                        }
                
                }
                Spacer()
                
                if gameInProgress == false{
                    
                    Button("nouvelle Partie"){
                        score = 0
                        gameInProgress = true
                        
                        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (_) in
                            gameInProgress = false
                            if score > bestScore{
                                bestScore = score
                            }
                        }
                    }.padding()
                }
                
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
