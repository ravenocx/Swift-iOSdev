//
//  ContentView.swift
//  University
//
//  Created by M Haris Sitompul on 31/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            TabView{
                UniversitiesView()
                    .tabItem{
                        Text("University")
                    }
                
                LastSeenView()
                    .tabItem {
                        Text("Last Seen")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
