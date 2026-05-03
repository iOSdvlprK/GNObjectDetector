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
    var imageAnalysisRequest: VNCoreMLRequest?
    // 1. image request handler: VNImageRequestHandler
    // 2. image analysis request: VNCoreMLRequest
    
    init() {
        let config = MLModelConfiguration()
        guard let resnet = try? Resnet50(configuration: config) else { return }
        let resnetModel = resnet.model
        guard let resnetVNCoreMLModel = try? VNCoreMLModel(for: resnetModel) else { return }
        self.imageAnalysisRequest = VNCoreMLRequest(model: resnetVNCoreMLModel) { request, error in
            
        }
    }
    
    func detectObject(image: UIImage) {
        guard let ciImage = CIImage(image: image) else {
            print("DEBUG: failed to convert image to ciImage")
            return
        }
        let handler = VNImageRequestHandler(ciImage: ciImage)
        guard let imageAnalysisRequest else { return }
        do {
            try handler.perform([imageAnalysisRequest])
        } catch {
            print("DEBUG: failed to perform image analysis request")
        }
    }
}
