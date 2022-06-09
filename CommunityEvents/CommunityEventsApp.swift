//
//  CommunityEventsApp.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

@main
struct CommunityEventsApp: App {
    @StateObject var events = Events(eventsList: [])
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    
                    ContentView(network: network, event: events.eventsList.first ?? Event.example);
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                NavigationView {
                    MapView()
                }
                .tabItem {
                    Image(systemName: "mappin.circle.fill")
                    Text("Discover events")
                }
                NavigationView {
                    SubmissionsView()
                }
                .tabItem {
                    Image(systemName: "highlighter")
                    Text("Submit")
                }
            }
            .environmentObject(events)
        }
    }
}
