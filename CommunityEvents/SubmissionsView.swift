//
//  SubmissionsView.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import SwiftUI

struct SubmissionsView: View {
    let event: Event
    let viewModel = submissionsViewModel(event: Event(id: "", title: "", date: "", time: "", location: "", latitude: 0.0, longitude: 0.0, price: 0.0, description: "", link: "", imageUrl: ""))
    
    @State var title: String = ""
    @State var date: String = ""
    @State var time: String = ""
    @State var location: String = ""
    @State var latitude: Double = 66.543701
    @State var longitude: Double = 25.844311
    @State var price: Double = 1.50
    @State var description: String = ""
    @State var link: String = ""
    @State var imageUrl: String = ""
    
    var disableForm: Bool {
        title.count < 2 || date.isEmpty || time.isEmpty || location.isEmpty || latitude.isZero || latitude.isNaN || longitude.isZero || longitude.isNaN || price.isNaN || description.count < 2
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                Text("Event Submissions")
                    .font(.largeTitle)
                    .bold()
                    .padding(20)
                Text("Please enter the details for your upcoming community event following the examples given below. We ask for the event latitude and longitude to allow us to show your event on our interactive map. If you are unsure about your events latitude and longitude you can enter your event postcode here: https://www.latlong.net/")
                    .font(.caption)
                    .padding([.leading, .trailing], 20)
                    .padding(.bottom, 10)
            }
            Form {
                Section {
                    HStack {
                        Text("Title:")
                            .font(.headline)
                        TextField(Event.example.title, text: $title)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Date:")
                            .font(.headline)
                        TextField(Event.example.date, text: $date)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Time:")
                            .font(.headline)
                        TextField(Event.example.time, text: $time)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Location:")
                            .font(.headline)
                        TextField(Event.example.location, text: $location)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Latitude:")
                            .font(.headline)
                        TextField("66.543701", value: $latitude, format: .number)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Longitude:")
                            .font(.headline)
                        TextField("25.844311", value: $longitude, format: .number)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Price:")
                            .font(.headline)
                        TextField("1.50", value: $price, format: .number)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Description")
                            .font(.headline)
                        TextField(Event.example.description, text: $description)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Link:")
                            .font(.headline)
                        TextField(Event.example.link ?? "www.example.com", text: $link)
                            .foregroundColor(.ceOrange)
                    }
                    HStack {
                        Text("Image Url:")
                            .font(.headline)
                        TextField(Event.example.imageUrl ?? "https://unsplash.com/photos/xSiQBSq", text: $imageUrl)
                            .foregroundColor(.ceOrange)
                    }
                }
                Section {
                    Button(action: {
                        print()
                        Task {
                            await viewModel.postEvent()
                        }
                    }) {
                        Text("Submit")
                    }
                }
                .disabled(disableForm)
                .font(.headline)
                .multilineTextAlignment(.center)
            }
        }
        .navigationBarHidden(true)
    }
}

struct SubmissionsView_Previews: PreviewProvider {
    static var previews: some View {
        SubmissionsView(event: Event.example)
    }
}
