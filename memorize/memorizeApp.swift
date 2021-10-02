//
//  memorizeApp.swift
//  memorize
//
//  Created by osa on 29.09.2021.
//

import SwiftUI

@main
struct memorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
