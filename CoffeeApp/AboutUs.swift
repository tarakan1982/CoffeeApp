//
//  AboutUs.swift
//  CoffeeApp
//
//  Created by Dmitriy Borisov on 20.10.2020.
//

import SwiftUI
import MapKit

struct AboutUs: View {
    var body: some View {
        MapView()
            .ignoresSafeArea()
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let annotation = MKPointAnnotation()
        annotation.title = "Москва"
        annotation.subtitle = "Кофейня №1"
        annotation.coordinate = CLLocationCoordinate2DMake(55.707030, 37.592209)
        mapView.addAnnotation(annotation)
        
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        // Следующие строки ставили кастомный поинтер, но что то с ними так и не заработало
//        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
//            view.canShowCallout = true
//            return view
//        }
        
        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}


struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
