//
//  EventSubmission.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 13/06/2022.
//

import SwiftUI

class EventSubmission: ObservableObject, Codable {
    
    enum codingKeys: CodingKey {
        case title, date, time, location, latitude, longitude, price, description, link, imageUrl
    }
    
    @Published var title: String = ""
    @Published var date: String = ""
    @Published var time: String = ""
    @Published var location: String = ""
    @Published var latitude: Double = 66.543701
    @Published var longitude: Double = 25.844311
    @Published var price: Double = 1.50
    @Published var description: String = ""
    @Published var link: String = ""
    @Published var imageUrl: String = ""
    
    var disableForm: Bool {
        title.count < 2 || date.isEmpty || time.isEmpty || location.isEmpty || latitude.isZero || latitude.isNaN || longitude.isZero || longitude.isNaN || price.isNaN || description.count < 2
    }
    
    init() {}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(date, forKey: .date)
        try container.encode(time, forKey: .time)
        try container.encode(location, forKey: .location)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(price, forKey: .price)
        try container.encode(description, forKey: .description)
        try container.encode(link, forKey: .link)
        try container.encode(imageUrl, forKey: .imageUrl)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: codingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        date = try container.decode(String.self, forKey: .date)
        time = try container.decode(String.self, forKey: .time)
        location = try container.decode(String.self, forKey: .location)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        price = try container.decode(Double.self, forKey: .price)
        description = try container.decode(String.self, forKey: .description)
        link = try container.decode(String.self, forKey: .link)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
    }
}
