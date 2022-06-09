//
//  Network.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

class Network: ObservableObject {
    
    func getEvents() async throws {
        guard let url = URL(string: "http://localhost:5172/events") else {fatalError("Missing URL")}
            let urlRequest = URLRequest(url:url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data")}
        let decodedEvent = try JSONDecoder().decode([Event].self, from:data)
        print("Async decodedEvent", decodedEvent)
    }
}
