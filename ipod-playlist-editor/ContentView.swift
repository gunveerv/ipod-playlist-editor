//
//  ContentView.swift
//  ipod-playlist-editor
//
//  Created by Gunveer Vilkhu on 2026-04-10.
//

import SwiftUI

struct ContentView: View {
    @State var isShowing = false
    @State var pathToPlayer = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Path to iPod")
            Button("test") {
                isShowing = true
            }
            .fileImporter(isPresented: $isShowing, allowedContentTypes: [.folder]) { result in
                
                switch result {
                    
                case .success(let path):
                    // handle success path
                    print(path)
                    
                case .failure(let error):
                    // handle error
                    print(error)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
