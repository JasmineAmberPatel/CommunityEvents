//
//  MapView.swift
//  CommunityEvents
//
//  Created by Jasmine Patel on 09/06/2022.
//

import MapKit
import SwiftUI

struct MapView: View {
    @EnvironmentObject var events: ContentViewModel
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 53.483959, longitude: -2.244644),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: events.eventsList) {
            event in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude)) {
                NavigationLink(destination: ContentView(event: event, viewModel: ContentViewModel())) {
                    VStack {
                        Image(systemName: "pin.fill")
                            .foregroundColor(Color(.ceOrange))
                            .font(.system(size: 20))
                            .shadow(radius: 5)
                    }
                }
            }
        }
            .navigationTitle("Events Near You")
    }
}
