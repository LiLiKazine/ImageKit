//
//  File.swift
//  
//
//  Created by LiLi on 2024/7/1.
//

import UIKit
import AVKit

extension IKImageWrapper where Base == URL {
    public func cover(maxiumSize: CGSize = .zero) async throws -> CGImage {
        let asset = AVURLAsset(url: base)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        generator.maximumSize = maxiumSize
        let (image, _) = try await generator.image(at: .init(seconds: 1, preferredTimescale: 1))
        return image
    }
}
