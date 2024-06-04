//
//  RendererContext.swift
//  Vivaldi
//
//  Created by LiLi on 2024/6/4.
//

import Foundation

public extension IKImage {
    
    struct Options {
        public var thumbnailGenerator: ThumbnailGenerator?
        public var memoryCache: ImageMemoryCache?
        public var diskCache: ImageDiskCache?
    }
    
    enum Source {
        case systemImage(String)
        case retriver(DataRetriver)
    }
    
    class Context<RendererView> {
        
        let source: Source
        var options: Options
        var configurations: [(RendererView) -> RendererView]
        
        private init(source: Source,
                     options: Options = .init(),
                     configurations: [(RendererView) -> RendererView] = []) {
            self.source = source
            self.options = options
            self.configurations = configurations
        }
        
        convenience init(systemName: String) {
            self.init(source: .systemImage(systemName))
        }
        
        convenience init(retriver: DataRetriver) {
            self.init(source: .retriver(retriver))
        }
        
    }
}
