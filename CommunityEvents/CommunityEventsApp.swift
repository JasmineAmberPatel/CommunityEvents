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
                    AboutView(viewModel: viewModel)
                }
                .navigationViewStyle(.stack)
                .tabItem {
                    Image(systemName: "house.fill").renderingMode(.template)
                    Text("About")
                }
                NavigationView {
                    MapView()
                }
                .navigationViewStyle(.stack)
                .tabItem {
                    Image(systemName: "mappin.circle.fill").renderingMode(.template)
                    Text("Discover")
                }
                NavigationView {
                    SubmissionsView(event: event)
                }
                .navigationViewStyle(.stack)
                .tabItem {
                    Image(systemName: "highlighter").renderingMode(.template)
                    Text("Submit")
                }
            }
            .accentColor(.ceOrange)
            .environmentObject(viewModel)
        }
    }
}
