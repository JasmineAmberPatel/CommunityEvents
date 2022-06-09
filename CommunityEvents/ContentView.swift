//
//  ContentView.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

struct ContentView: View {
    let network: Network
    let event: Event
    
    var body: some View {
        ScrollView {
            VStack {
                Text(event.title)
                    .font(.title)
                    .bold()
                Group {
                    Text("\(event.date) at \(event.time)")
                    Text(event.location)
                    Text("£\(event.price)")
                    Text(event.description)
                    Text(event.link)
                }
                .font(.body)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(network: Network(), event: Event.example)
    }
}
