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
    
    class Context {
        let source: Source

        init(source: Source) {
            self.source = source
        }
        
        convenience init(localVideo: LocalVideo) {
            self.init(source: .local(localVideo))
        }
    }
    
}
