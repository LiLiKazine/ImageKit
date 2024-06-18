//
//  RendererContext.swift
//  Vivaldi
//
//  Created by LiLi on 2024/6/4.
//

import Foundation
import UIKit

public extension IKImage {
    
    struct Options {
        public var thumbnailGenerator: ThumbnailGenerator?
        public var memoryCache: ImageMemoryCache?
        public var diskCache: ImageDiskCache?
    }
    
    enum Source {
        case systemImage(String)
        case retriver(DataRetriver)
        
        func image() async throws -> UIImage? {
            switch self {
            case .systemImage(let string):
                return .init(systemName: string)
            case .retriver(let dataRetriver):
                let data = try await dataRetriver.retrive()
                return .init(data: data)
            }
        }
    }
    
    class Context<RendererView> {
        
        let source: Source
        var backupSource: Source?
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
