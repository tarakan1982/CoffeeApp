//
//  MapViewPage.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 30.10.2020.
//

import SwiftUI
import MapKit

struct MapViewPage: View {
    @State var coordinateRegion = MKCoordinateRegion(
          center: CLLocationCoordinate2D(latitude: 55.707030, longitude: 37.592209),
          span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        var body: some View {
          Map(coordinateRegion: $coordinateRegion)
            .edgesIgnoringSafeArea(.all)
    }
    
    struct MapViewWithAnnotations: View {
        let veganPlacesInRiga = [
          VeganFoodPlace(name: "ИП Вазген", latitude: 55.707030, longitude: 37.592209),
//          VeganFoodPlace(name: "Кофейня №1", latitude:  56.967520, longitude: 24.105760) путем добавления в массив еще точек, добавляются поинтеры, но блин по какой то причине они не отображаются
        ]
        
        @State var coordinateRegion = MKCoordinateRegion(
          center: CLLocationCoordinate2D(latitude: 55.707030, longitude: 37.592209),
          span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        var body: some View {
          Map(coordinateRegion: $coordinateRegion,
              annotationItems: veganPlacesInRiga) { place in
            MapMarker(coordinate: place.coordinate, tint: .green)
          }.edgesIgnoringSafeArea(.all)
        }
      }
    struct VeganFoodPlace: Identifiable {
        var id = UUID()
        let name: String
        let latitude: Double
        let longitude: Double
        
        var coordinate: CLLocationCoordinate2D {
          CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
      }
}

struct MapViewPage_Previews: PreviewProvider {
    static var previews: some View {
        MapViewPage()
    }
}
