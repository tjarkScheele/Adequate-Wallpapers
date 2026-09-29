//
//  ContentView.swift
//  Adequate Wallpapers
//
//  Created by Tjark Scheele on 28.09.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
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
