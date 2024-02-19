//
//  ContentView.swift
//  CollectionApp
//
//  Created by Ayaan Irshad on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView() {
            CollectionView().tabItem {
                Label("My Collections",systemImage: "bookmark.circle.fill")
            }
            
            Text("Tab Content 2").tabItem {
                Label("Settings", systemImage: "gearshape")
            }
        }.tabViewStyle(.automatic)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
