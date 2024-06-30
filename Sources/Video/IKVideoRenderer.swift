//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/19.
//

import SwiftUI
import AVKit

struct IKVideoRenderer: View {
    
    let context: IKVideo.Context
    
    @State private var binder = IKVideo.Binder()
    @Environment(PlayingVideo.self) private var currentPlaying
    
    init(context: IKVideo.Context) {
        self.context = context
    }
    
    var body: some View {
        ZStack {
            if currentPlaying.player != nil && currentPlaying.uuid == binder.id {
                IKVideoPlayer()
            } else {
                Cover(image: binder.cover, duration: binder.duration)
            }
            if !currentPlaying.isPlaying {
                PlayButton {
                    play()
                }
            }
        }
        .task {
            binder.load(with: context.source, currentPlaying: currentPlaying)
        }
        
    }
    
    
    func play() {
        currentPlaying.play()
    }
}

private struct Cover: View {
    
    let image: UIImage?
    let duration: CMTime?
    init(image: UIImage?, duration: CMTime? = nil) {
        self.image = image
        self.duration = duration
    }
    
    var body: some View {
        if let image {
            IKVideoCover(image: image, duration: duration)
        } else {
            IKVideoCover(image: Image(systemName: "movieclapper.fill"))
        }
    }
}

private struct PlayButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "play.circle.fill")
                .opacity(0.8)
                .overlay(.white, in: .circle.stroke(style: StrokeStyle()))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    IKVideoRenderer(context: .init(url: URL(filePath: "/Users/lili/Developer/ImageKit/demo.mp4")))
        .environment(PlayingVideo.demo)
}
