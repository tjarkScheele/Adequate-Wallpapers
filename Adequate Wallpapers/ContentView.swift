//
//  ContentView.swift
//  Adequate Wallpapers
//
//  Created by Tjark Scheele on 28.09.26.
//

import SwiftUI

struct ContentView: View {
    @State private var startDate = Date()
    @State private var username: String = ""
    @State private var showFileImporter = false
    
    var body: some View {
        VStack(alignment: .leading) {
                    Text("Add a new Event")
                    TableRow()
                    Divider()
                    Text("Edit current Events")
                    TableRow()
                    TableRow()
                    Divider()
                    Text("Edit seaonal Wallpapers")
                    TableRow()
                    TableRow()
                    Button("Set Wallpaper URL"){
                        if let url = Bundle.main.url(
                            forResource: "spring_background",
                            withExtension: "jpg"
                        ) {
                            print(url)
                            
                            if let screen = NSScreen.main {
                                do {
                                    try NSWorkspace.shared.setDesktopImageURL(
                                        url,
                                        for: screen,
                                        options: [:]
                                    )
                                } catch {
                                    print("Failed to set wallpaper: \(error)")
                                }
                            }
                        }
                        
                    }
                }
                .padding()
        
    }
}

#Preview {
    ContentView()
}
