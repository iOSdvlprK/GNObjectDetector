//
//  ContentViewModel.swift
//  GNObjectDetector
//
//  Created by joe on 5/2/26.
//

import SwiftUI
import Vision

@Observable
class ContentViewModel {
    // image request handler: VNImageRequestHandler
    
    // image analysis request: VNCoreMLRequest
    
    func detectObject(image: UIImage) {
        guard let ciImage = CIImage(image: image) else {
            print("DEBUG: failed to convert image to ciImage")
            return
        }
        let handler = VNImageRequestHandler(ciImage: ciImage)
        
    }
}
