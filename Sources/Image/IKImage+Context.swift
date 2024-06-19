//
//  RendererContext.swift
//  Vivaldi
//
//  Created by LiLi on 2024/6/4.
//

import Foundation
import UIKit

public extension IKImage {
    
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
        
        convenience init(image: UIImage) {
            self.init(source: .image(image))
        }
        
        convenience init(retriver: DataRetriver) {
            self.init(source: .retriver(retriver))
        }
        
    }
}

extension IKImage {
    struct Options {
        var thumbnailGenerator: ThumbnailGenerator?
        var memoryCache: ImageMemoryCache?
        var diskCache: ImageDiskCache?
    }
    
    enum Source {
        case systemImage(String)
        case image(UIImage)
        case retriver(DataRetriver)
        
        func image() async throws -> UIImage? {
            switch self {
            case .systemImage(let string):
                return .init(systemName: string)
            case .image(let image):
                return image
            case .retriver(let dataRetriver):
                let data = try await dataRetriver.retrive()
                return .init(data: data)
            }
        }
    }
}
