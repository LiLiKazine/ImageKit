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
        return try await asset.ik.cover(maxiumSize: maxiumSize)
    }
}

extension URL: IKImageCompatible {}


extension IKImageWrapper where Base : AVAsset {
    
    public func cover(maxiumSize: CGSize = .zero) async throws -> CGImage {
        let generator = AVAssetImageGenerator(asset: base)
        generator.appliesPreferredTrackTransform = true
        generator.maximumSize = maxiumSize
        let (image, _) = try await generator.image(at: .init(seconds: 1, preferredTimescale: 1))
        return image
    }
}

extension AVAsset : IKImageCompatible {}
