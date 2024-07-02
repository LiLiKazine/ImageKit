//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/19.
//

import UIKit
import CoreMedia.CMTime
import Combine
import SwiftUI

public protocol LocalVideo {
    var cover: UIImage? { get }
    var url: URL { get }
    var duration: CMTime? { get }
}

extension IKVideo {
        
    public enum ControlVisiblity {
        case alwaysShow
        case alwaysHide
        case builtIn
    }
    
    enum Source {
        case local(LocalVideo)
//        case stream
    }
    
    
    
    class Context {
        let source: Source
        let controlVisibility: ControlVisiblity

        init(source: Source, controlVisiblity: ControlVisiblity) {
            self.source = source
            self.controlVisibility = controlVisiblity
        }
        
        convenience init(localVideo: LocalVideo, controlVisiblity: ControlVisiblity = .alwaysShow) {
            self.init(source: .local(localVideo), controlVisiblity: controlVisiblity)
        }
        
        convenience init(url: URL) {
            self.init(localVideo: VideoSource(url: url))
        }
        
        #if DEBUG
        static let demo: Context =
        {
            let source = VideoSource(
                cover: UIImage(contentsOfFile: "/Users/lili/Developer/ImageKit/cover.png"),
                url: URL(filePath: "/Users/lili/Developer/ImageKit/demo.mp4"),
                duration: .init(seconds: 200, preferredTimescale: 1)
            )
            return .init(localVideo: source)
        }()
        #endif
    }
    
}


private struct VideoSource: LocalVideo {
    let cover: UIImage?
    let url: URL
    let duration: CMTime?
    
    init(cover: UIImage? = nil, url: URL, duration: CMTime? = nil) {
        self.cover = cover
        self.url = url
        self.duration = duration
    }
}
