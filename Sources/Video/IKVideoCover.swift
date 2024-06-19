//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/19.
//

import SwiftUI
import CoreMedia.CMTime

struct IKVideoCover: View {
    
    let image: UIImage
    let duration: CMTime?
    
    var body: some View {
        Color.gray
            .overlay {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .overlay(alignment: .bottom) {
                LinearGradient(gradient: .init(colors: [.black, .white]), startPoint: .bottom, endPoint: .top)
                    .frame(height: 40)
            }
            .overlay(alignment: .bottomTrailing) {
                if let duration {
                    Text(duration.ik.standardTime)
                        .font(.footnote)
                        .foregroundStyle(.white)
                }
            }
    }
}
