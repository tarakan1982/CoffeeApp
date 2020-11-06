//
//  SelectAvatar.swift
//  CoffeeApp
//
//  Created by Дмитрий on 06.11.2020.
//

import SwiftUI

struct CaptureImageView {
  
  /// MARK: - Properties
  @Binding var isShown: Bool
  @Binding var image: Image?
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(isShown: $isShown, image: $image)
  }
}

extension CaptureImageView: UIViewControllerRepresentable {
  func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    /// Default is images gallery. Un-comment the next line of code if you would like to test camera
//    picker.sourceType = .camera
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController,
                              context: UIViewControllerRepresentableContext<CaptureImageView>) {
    
  }
}

struct SelectAvatar: View {
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    var body: some View {
        ZStack {
          VStack {
            Button(action: {
              self.showCaptureImageView.toggle()
            }) {
              Text("Выбрать фото")
            }
            image?.resizable()
              .frame(width: 250, height: 200)
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 4))
              .shadow(radius: 10)
          }
          if (showCaptureImageView) {
            CaptureImageView(isShown: $showCaptureImageView, image: $image)
          }
        }    }
}

struct SelectAvatar_Previews: PreviewProvider {
    static var previews: some View {
        SelectAvatar()
    }
}
