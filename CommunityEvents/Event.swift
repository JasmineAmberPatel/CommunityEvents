//
//  Event.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//
import SwiftUI

class Event: Decodable, Encodable, Identifiable {
    
    var id: String?
    var title: String
    var date: String
    var time: String
    var location: String
    var latitude: Double
    var longitude: Double
    var price: Double
    var description: String
    var link: String?
    var imageUrl: String?
    
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
        self.title = "Visit Santa's House"
        self.date = "25/12/22"
        self.time = "11:00 - 16:00"
        self.location = "Santa Claus Village"
        self.latitude = 66.543701
        self.longitude = 25.844311
        self.price = 0.00
        self.description = "Have a magical time with Santa."
        self.link = "https://santaclausvillage.info/"
        self.imageUrl = "https://unsplash.com/photos/liT5AlTmC8I"
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
