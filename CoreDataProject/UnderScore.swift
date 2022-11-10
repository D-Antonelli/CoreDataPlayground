//
//  UnderScore.swift
//  CoreDataProject
//
//  Created by Derya Antonelli on 07/11/2022.
//

import SwiftUI
struct UnderScore: View {
    @State var score: Int
    
    var body: some View {
        Text("Score is \(score)")
    }
    
    init(newScore: Int) {
        score = newScore
    }
}
