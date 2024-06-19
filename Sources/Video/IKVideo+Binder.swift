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
    class Binder {
        var cover: UIImage?
        var url: URL?
        var duration: CMTime?
        
        var isPlaying: Bool = false
        
        func load(with source: Source) async throws {
            
        }
        
    }
    
}
