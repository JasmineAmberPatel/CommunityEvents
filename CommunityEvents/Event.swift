//
//  Event.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//
import SwiftUI

struct Event: Decodable, Identifiable {
    
    var id: String
    var title: String
    var date: String
    var time: String
    var location: String
    var latitude: Double
    var longitude: Double
    var price: Double
    var description: String
    var link: String?
    var imageUrl: String
    
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
        self.id = ""
        self.title = "event title"
        self.date = "event date"
        self.time = "event time"
        self.location = "event location"
        self.latitude = 0.0
        self.longitude = 0.0
        self.price = 0.0
        self.description = "event description"
        self.link = "event link"
        self.imageUrl = "image url"
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
