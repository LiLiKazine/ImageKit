//
//  IKImagePresenter.swift
//  Vivaldi
//
//  Created by LiLi on 2024/6/4.
//

import SwiftUI

public protocol IKRendererView: View {
    static func create(from image: UIImage, context: IKImage.Context<Self>) -> Self
}

public protocol IKImagePresenter {
    
    associatedtype RendererView: IKRendererView
    var context: IKImage.Context<RendererView> { get }
    
}

extension IKImagePresenter {
    public var body: some View {
        ZStack {
            IKImageRenderer(context: context)
        }
    }
}

extension IKImagePresenter {
    
    public func thumbnailGenerator(_ generator: ThumbnailGenerator) -> Self {
        context.options.thumbnailGenerator = generator
        return self
    }
    
    public func memoryCache(_ cache: ImageMemoryCache) -> Self {
        context.options.memoryCache = cache
        return self
    }
    
    public func diskCache(_ cache: ImageDiskCache) -> Self {
        context.options.diskCache = cache
        return self
    }
    
    private func append(_ configuration: @escaping (RendererView) -> RendererView) -> Self {
        context.configurations.append(configuration)
        return self
    }
    
}

extension IKImagePresenter {
    
    public func backup(source: IKImage.Source) -> Self {
        context.backupSource = source
        return self
    }
    
    public func backup(retriver: DataRetriver?) -> Self {
        context.backupSource = retriver.map { .retriver($0) }
        return self
    }
    
}
