//
//  IKImage+Binder.swift
//  Vivaldi
//
//  Created by LiLi on 2024/5/21.
//

import SwiftUI
import UIKit

extension IKImage {
    
    @Observable
    class Binder {
        
        var image: UIImage?
        
        func load<RendererView>(with context: IKImage.Context<RendererView>) async throws {
            switch context.source {
            case .systemImage(let systemName):
                self.image = .init(systemName: systemName)
            case .retriver(let retriver):
                let data = try await retriver.retrive()
                self.image = UIImage(data: data)
            }
        }
    }
}
