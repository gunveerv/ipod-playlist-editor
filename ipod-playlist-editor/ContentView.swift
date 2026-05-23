//
//  ContentView.swift
//  ipod-playlist-editor
//
//  Created by Gunveer Vilkhu on 2026-04-10.
//

import SwiftUI

struct ContentView: View {
    @State var fm = FileManager.default // filemanager service
    @State var isShowing = false // file importer view
    @State var pathToPlayer = FileManager.default.currentDirectoryPath // path to ipod music files
    @State var isPlayerFolderValid = false //bool for file struct
    @State var correctFolderStrut = false
    
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
                    pathToPlayer = path.relativePath
                    // update file structure bool based on new path
                    isPlayerFolderValid = fm.fileExists(atPath: pathToPlayer)
                    correctFolderStrut = fm.fileExists(atPath: pathToPlayer+"/Music") && fm.fileExists(atPath: pathToPlayer+"/Playlists")
                    
                    
                case .failure(let error):
                    // handle error
                    print(error)
                }
            }
            
            // for successful path folders
            if isPlayerFolderValid {
                Text(String(correctFolderStrut))
                FolderView()
            } else {
                HStack {
                    Image(systemName: "xmark.app.fill")
                        .imageScale(.large)
                        .foregroundStyle(Color.red)
                    
                    Text("The current folder is missing the `Music` and/or `Playlists` folder(s)")
                        .font(.system(size: 11))
                }
            }
            
        }
        .padding()
        .frame(minWidth: 450, minHeight: 125)
        
    }
}

#Preview {
    ContentView()
}
