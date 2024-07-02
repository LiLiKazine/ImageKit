//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/19.
//

import SwiftUI
import UIKit
import AVKit

extension IKVideo {
    @Observable
    class Binder: Identifiable {
        let id = UUID()
        
        var showControl: Bool = false
        
        var cover: UIImage?
        var duration: CMTime?
                
        func load(with source: Source) {
            switch source {
            case .local(let video):
                cover = video.cover
                duration = video.duration
            }
        }
        
        func play(with source: Source, currentPlaying: PlayingVideo) {
            switch source {
            case .local(let video):
                let player = AVPlayer(url: video.url)
                currentPlaying.play(player, uuid: id)
            }
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
