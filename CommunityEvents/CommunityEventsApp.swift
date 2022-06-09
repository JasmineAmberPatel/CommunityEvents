//
//  CommunityEventsApp.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

@main
struct CommunityEventsApp: App {
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView(network: network.self)
        }
    }
}
