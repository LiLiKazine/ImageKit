//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/19.
//

import UIKit
import CoreMedia.CMTime

public protocol LocalVideo {
    var cover: UIImage? { get }
    var url: URL { get }
    var duration: CMTime? { get }
}

extension IKVideo {
        
    enum Source {
        case local(LocalVideo)
//        case stream
    }
    
    enum ContorlVisiblity {
        case alwaysShow
        case alwaysHide
    }
    
    class Context {
        let source: Source
        let controlVisibility: ContorlVisiblity

        init(source: Source, controlVisiblity: ContorlVisiblity) {
            self.source = source
            self.controlVisibility = controlVisiblity
        }
        
        convenience init(localVideo: LocalVideo, controlVisiblity: ContorlVisiblity = .alwaysShow) {
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
