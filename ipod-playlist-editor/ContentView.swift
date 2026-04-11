//
//  ContentView.swift
//  ipod-playlist-editor
//
//  Created by Gunveer Vilkhu on 2026-04-10.
//

import SwiftUI

struct ContentView: View {
//    var fileManager: FileManager
    @State var isShowing = false
    @State var pathToPlayer = FileManager.default.currentDirectoryPath
//    @State var isFileStructCorrect = fileManager.fileExists(atPath: pathToPlayer)
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "ipod")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(pathToPlayer)
                    .frame(width: 350, height: 20)
                    .truncationMode(.tail)
                    .font(.system(size: 11))
            }
            Button("Select Folder") {
                isShowing = true
            }
            .fileImporter(isPresented: $isShowing, allowedContentTypes: [.folder]) { result in
                
                switch result {
                    
                case .success(let path):
                    // handle success path
//                    print(path.absoluteString)
                    pathToPlayer = path.relativePath
                    
                case .failure(let error):
                    // handle error
                    print(error)
                }
            }
            Text("")
        }
        .padding()
        .frame(minWidth: 450, minHeight: 125)
        
    }
}

#Preview {
    ContentView()
}
