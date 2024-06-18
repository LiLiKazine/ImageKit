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
            if let backupSource = context.backupSource {
                do {
                    image = try await context.source.image()
                } catch {
                    print("Load from source failed, reason: \(error)")
                    image = try await backupSource.image()
                }
            } else {
                image = try await context.source.image()
            }
        }
    }
}
