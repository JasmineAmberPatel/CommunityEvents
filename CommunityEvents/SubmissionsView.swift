//
//  SubmissionsView.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

struct SubmissionsView: View {
    @State var title: String = ""
    @State var date: String = ""
    @State var time: String = ""
    @State var location: String = ""
//    @State var latitude: Double = 0
//    @State var longitude: Double = 0
//    @State var price: Double = 0
    @State var description: String = ""
    @State var link: String = ""
    @State var imageUrl: String = ""
    
    var body: some View {
            Form {
                    TextField("Title", text: $title)
                    TextField("Date", text: $date)
                    TextField("Time", text: $time)
                    TextField("Location", text: $location)
//                    TextField("Latitude", $latitude)
//                    TextField("Longitude", $longitude)
//                    TextField("Price", $price)
                    TextField("Description", text: $description)
                    TextField("Link", text: $link)
                    TextField("Image Url", text: $imageUrl)
            }
        .navigationTitle("Event Submissions")
    }
    
    struct SubmissionsView_Previews: PreviewProvider {
        static var previews: some View {
            SubmissionsView()
        }
    }
}
