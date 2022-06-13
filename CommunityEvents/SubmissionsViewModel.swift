//
//  SubmissionsViewModel.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 13/06/2022.
//

import SwiftUI

struct submissionsViewModel {
    
    var event: Event
    
    @State var confirmationMessage = ""
    @State var showingConfirmation = false
    
    func postEvent() async {
        guard let encoded = try? JSONEncoder().encode(event) else {
            print("Failed to encode event")
            return
        }
        
        let url = URL(string: "http://localhost:5172/events")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedEvent = try JSONDecoder().decode(Event.self, from: data)
            confirmationMessage = "Your event \(decodedEvent.title) has been submitted. Refresh the map to see your event."
            showingConfirmation = true
        } catch {
            print(error, "Event submission failed.")
        }
    }
}
