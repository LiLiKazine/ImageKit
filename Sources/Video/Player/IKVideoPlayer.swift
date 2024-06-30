//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/30.
//

import SwiftUI
import AVKit

public struct IKVideoPlayer: View {
    
    @Environment(PlayingVideo.self) private var currentPlaying: PlayingVideo
    
    init() {}
    
    public var body: some View {
        if currentPlaying.hideBuiltInControls {
            NakedPlayer(player: currentPlaying.player)
        } else {
            VideoPlayer(player: currentPlaying.player)
        }
            
    }
}

extension IKVideoPlayer {
    func hideBuiltInControls(_ value: Bool) -> Self {
        currentPlaying.hideBuiltInControls = value
        return self
    }
}

extension IKVideoPlayer {
    
    func setMuted(_ value: Bool?) -> Self {
        updatePlayer(value, of: \.isMuted)
        return self
    }
    
    func setVolume(_ value: Float?) -> Self {
        updatePlayer(value, of: \.volume)
        return self
    }
    
    func setRate(_ value: Float?) -> Self {
        updatePlayer(value, of: \.rate)
        return self
    }
    
    private func updatePlayer<Value>(_ value: Value?, of keyPath: ReferenceWritableKeyPath<AVPlayer, Value>) {
        guard let value else { return }
        currentPlaying.player?[keyPath: keyPath] = value
    }
}

#Preview {
    IKVideoPlayer()
        .environment(PlayingVideo.demo)
}
