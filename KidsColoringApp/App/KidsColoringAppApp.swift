//
//  KidsColoringAppApp.swift
//  KidsColoringApp
//
//  Main app entry point for Kids Coloring App
//

import SwiftUI

@main
struct KidsColoringAppApp: App {
    @StateObject private var soundManager = SoundManager()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(soundManager)
        }
    }
}
