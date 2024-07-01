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
            if currentPlaying.isPlaying && currentPlaying.uuid == binder.id {
                IKVideoPlayer()
            } else {
                Cover(image: binder.cover, duration: binder.duration)
            }
            
            if binder.showControl {
                PlayButton(isPlaying: currentPlaying.isPlaying) {
                    if currentPlaying.isPlaying {
                        pause()
                    } else {
                        play()
                    }
                }
                .frame(width: 22, height: 22)
            }
        }
        .clipped()
        .task {
            binder.load(with: context.source, currentPlaying: currentPlaying)
            binder.setup(contorlVisiblity: context.controlVisibility)
        }
        
    }
    
    
    func play() {
        currentPlaying.play()
    }
    
    func pause() {
        currentPlaying.pause()
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
    
    let isPlaying: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Circle().fill(.white)
                .overlay {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(2)
                }
                .opacity(0.8)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    IKVideoRenderer(context: .demo)
        .environment(PlayingVideo())
}
