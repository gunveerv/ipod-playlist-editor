//
//  ipod_playlist_editorApp.swift
//  ipod-playlist-editor
//
//  Created by Gunveer Vilkhu on 2026-04-10.
//

import SwiftUI

@main
struct ipod_playlist_editorApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView(fileManager: <#FileManager#>)
            ContentView()
        }
        .defaultSize(width: 450, height: 125)
        .windowResizability(.contentSize)
    }
}
