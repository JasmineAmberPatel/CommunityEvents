//
//  Event.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//
import SwiftUI

struct Event: Decodable, Identifiable {
    
    let id: String
    let title: String
    let date: String
    let time: String
    let location: String
    let latitude: Double
    let longitude: Double
    let price: Double
    let description: String
    let link: String?
    let imageUrl: String
    
    init(id: String,
         title: String,
         date: String,
         time: String,
         location: String,
         latitude: Double,
         longitude: Double,
         price: Double,
         description: String,
         link: String,
         imageUrl: String) {
        self.id = id
        self.title = title
        self.date = date
        self.time = time
        self.location = location
        self.latitude = latitude
        self.longitude = longitude
        self.price = price
        self.description = description
        self.link = link
        self.imageUrl = imageUrl
    }
    
    static let example = Event(id: "629f3ec51c11eb1825ef27e5",
                               title: "Visit Santa's House",
                               date: "25/12/22",
                               time: "11:00 - 16:00",
                               location: "Santa Claus Village",
                               latitude: 66.543701,
                               longitude: 25.844311,
                               price: 0.00,
                               description: "Have a magical time with Santa.",
                               link: "https://santaclausvillage.info/",
                               imageUrl: "https://unsplash.com/photos/liT5AlTmC8I")
}
