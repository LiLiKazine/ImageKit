//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/30.
//

import SwiftUI
import UIKit
import AVKit

struct NakedPlayer: UIViewControllerRepresentable {
    
    let player: AVPlayer?
    
    init(player: AVPlayer?) {
        self.player = player
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.showsPlaybackControls = false
        controller.player = player
        return controller
    }
    
    func updateUIViewController(_ controller: AVPlayerViewController, context: Context) {
        controller.player = player
    }
    
}
