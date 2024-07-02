//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/30.
//

import SwiftUI
import AVKit

public struct IKVideoPlayer: View {
    
    private let hideBuiltInControls: Bool
    @Environment(PlayingVideo.self) private var currentPlaying: PlayingVideo
    
    init(hideBuiltInControls: Bool = false) {
        self.hideBuiltInControls = hideBuiltInControls
    }
    
    public var body: some View {
        if hideBuiltInControls {
            NakedPlayer(player: currentPlaying.player)
        } else {
            VideoPlayer(player: currentPlaying.player)
        }
    }
    
}

extension IKVideoPlayer {
    public func hideBuiltInControls(_ value: Bool) -> IKVideoPlayer {
        return IKVideoPlayer(hideBuiltInControls: value)
    }

}

extension IKVideoPlayer {
    
    public func setMuted(_ value: Bool?) -> Self {
        updatePlayer(value, of: \.isMuted)
        return self
    }
    
    public func setVolume(_ value: Float?) -> Self {
        updatePlayer(value, of: \.volume)
        return self
    }
    
    public func setRate(_ value: Float?) -> Self {
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
