//
//  ContentView.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

struct ContentView: View {
    var network: Network
    
    var body: some View {
        Text("Hello world")
            .onAppear {
                Task {
                    do {
                        try await network.getEvents()
                    } catch {
                        print("Error", error)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(network: Network())
    }
}
