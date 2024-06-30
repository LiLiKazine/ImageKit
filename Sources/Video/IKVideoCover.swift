//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/19.
//

import SwiftUI
import CoreMedia.CMTime

public struct IKVideoCover: View {
    
    let image: Image
    let duration: CMTime?
    
    public init(image: Image, duration: CMTime? = nil) {
        self.image = image
        self.duration = duration
    }
    
    public var body: some View {
        Color.gray
            .overlay {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .overlay(alignment: .bottom) {
                LinearGradient(gradient: .init(colors: [.black.opacity(0.5), .clear]), startPoint: .bottom, endPoint: .top)
                    .frame(height: 60)
            }
            .overlay(alignment: .bottomTrailing) {
                if let duration {
                    Text(duration.ik.standardTime)
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .padding()
                }
            }
    }
}

extension IKVideoCover {
    public init(image: UIImage, duration: CMTime? = nil) {
        self.init(image: Image(uiImage: image), duration: duration)
    }
}

#Preview {
    IKVideoCover(image: Image(systemName: "figure.climbing"), duration: CMTime(value: 100, timescale: 1))
}
