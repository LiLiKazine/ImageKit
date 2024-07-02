//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/30.
//

import Foundation
import AVKit
import Combine

@Observable
public class PlayingVideo {
    
    public var hideBuiltInControls: Bool

    private(set) var player: AVPlayer?
    
    private(set) var isPlaying: Bool = false
    @ObservationIgnored private(set) var uuid: UUID?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(hideBuiltInControls: Bool = false) {
        self.hideBuiltInControls = hideBuiltInControls
    }
    
    public static let shared = PlayingVideo()
    
    public func setup(player: AVPlayer?, uuid: UUID? = nil) {
        self.player = player
        self.uuid = uuid
        player?.publisher(for: \.timeControlStatus, options: [.initial, .new])
            .removeDuplicates()
            .map { $0 == .playing }
            .sink { [weak self] value in
                self?.isPlaying = value
            }
            .store(in: &cancellables)
            
    }
    
    public func play(_ player: AVPlayer? = nil) {
        if let player {
            setup(player: player)
        }
        self.player?.play()
    }
    
    public func pause() {
        player?.pause()
    }
    
    #if DEBUG
    static let demo: PlayingVideo = {
        let url = URL(filePath: "/Users/lili/Developer/ImageKit/demo.mp4")
        let cur = PlayingVideo()
        cur.setup(player: AVPlayer(url: url))
        return cur
    }()
    #endif
}
