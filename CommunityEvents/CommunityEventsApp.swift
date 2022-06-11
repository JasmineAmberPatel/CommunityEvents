//
//  CommunityEventsApp.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

@main
struct CommunityEventsApp: App {
    @StateObject var viewModel: ContentViewModel
    var event: Event
    
    init() {
        _viewModel = StateObject(wrappedValue: ContentViewModel())
        event = Event(id: "", title: "", date: "", time: "", location: "", latitude: 0.0, longitude: 0.0, price: 0.0, description: "", link: "", imageUrl: "")
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    AboutView()
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("About")
                }
                NavigationView {
                    MapView()
                }
                .tabItem {
                    Image(systemName: "mappin.circle.fill")
                    Text("Discover events")
                }
                NavigationView {
                    ContentView(event: event, viewModel: viewModel);
                }
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("Information")
                }
                NavigationView {
                    SubmissionsView()
                }
                .tabItem {
                    Image(systemName: "highlighter")
                    Text("Submit")
                }
            }
            .environmentObject(viewModel)
        }
    }
}
