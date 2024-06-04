//
//  IKImageRenderer.swift
//  Vivaldi
//
//  Created by LiLi on 2024/5/21.
//

import SwiftUI

struct IKImageRenderer<RendererView>: View where RendererView: IKRendererView {
    
    let context: IKImage.Context<RendererView>
    
    @State private var binder =  IKImage.Binder()
    
    var body: some View {
        if let image = binder.image {
            renderedImage(image)
        } else {
            Text("loading...")
                .task {
                    do {
                        try await binder.load(with: context)
                    } catch {
                        print(error)
                    }
                }
        }
    }
    
    @ViewBuilder
    private func renderedImage(_ image: UIImage) -> some View {
        let configuredImage = context.configurations
            .reduce(RendererView.create(from: image, context: context)) {
                current, config in config(current)
            }
        
        configuredImage
    }
}

#Preview {
    IKImageRenderer<Image>(context: .init(systemName: "doc.text.image"))
}
