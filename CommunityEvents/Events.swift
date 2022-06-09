//
//  Events.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

class Events: ObservableObject {
    var eventsList: [Event]
    
    init(eventsList: [Event]) {
        self.eventsList = eventsList
    }
}
