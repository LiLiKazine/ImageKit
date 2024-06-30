//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/19.
//

import SwiftUI
import UIKit
import CoreMedia.CMTime

extension IKVideo {
    @Observable
    class Binder: Identifiable {
        let id = UUID()
        
        var cover: UIImage?
        var duration: CMTime?
                
        func load(with source: Source, currentPlaying: PlayingVideo) {
            switch source {
            case .local(let video):
                update(with: video, currentPlaying: currentPlaying)
            }
        }
        
        func update(with video: LocalVideo, currentPlaying: PlayingVideo) {
            currentPlaying.setup(
                player: .init(url: video.url),
                uuid: id
            )
            cover = video.cover
            duration = video.duration
        }
    }
    
}
