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
        
        var showControl: Bool = false
        
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
        
        func setup(contorlVisiblity: IKVideo.ContorlVisiblity) {
            switch contorlVisiblity {
            case .alwaysShow:
                self.showControl = true
            case .alwaysHide:
                self.showControl = false
            }
        }
    }
    
}
