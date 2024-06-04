//
//  IKImagePresenter+Image.swift
//  Vivaldi
//
//  Created by LiLi on 2024/6/4.
//

import SwiftUI

extension IKImagePresenter where RendererView == Image {
    public func resizable(
        capInsets: EdgeInsets = EdgeInsets(),
        resizingMode: Image.ResizingMode = .stretch) -> Self
    {
        configure { $0.resizable(capInsets: capInsets, resizingMode: resizingMode) }
    }
    
    public func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Self {
        configure { $0.renderingMode(renderingMode) }
    }
    
    public func interpolation(_ interpolation: Image.Interpolation) -> Self {
        configure { $0.interpolation(interpolation) }
    }
    
    public func antialiased(_ isAntialiased: Bool) -> Self {
        configure { $0.antialiased(isAntialiased) }
    }
    
    public func configure(_ block: @escaping (RendererView) -> RendererView) -> Self {
        context.configurations.append(block)
        return self
    }
}

extension Image: IKRendererView {
    public static func create(from image: UIImage, context: IKImage.Context<Image>) -> Image {
        Image(uiImage: image)
    }
}
