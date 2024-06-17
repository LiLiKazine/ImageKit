//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/16.
//

import UIKit

public enum CompressionRatio {
    case fixed(CGSize)
    case fixedHeight(CGFloat)
    case fixedWidth(CGFloat)
    
    func adjust(from size: CGSize) -> CGSize {
        switch self {
        case .fixed(let size):
            return size
        case .fixedHeight(let height):
            let width = height / max(1, size.height) * size.width
            return CGSize(width: width, height: height)
        case .fixedWidth(let width):
            let height = width / max(1, size.width) * size.height
            return CGSize(width: width, height: height)
        }
    }
}

protocol ImageCompressor {
    associatedtype Input
    
    var input: Input { get }
    
}

extension ImageCompressor where Input == Data {
    
    func jpeg(quality: CGFloat) -> Data? {
        return UIImage(data: input)?.jpegData(compressionQuality: quality)
    }
    
    func jpeg(quality: CGFloat) -> UIImage? {
        return self.jpeg(quality: quality).map { UIImage(data: $0) } ?? nil
    }
    
    func jpeg(ratio: CompressionRatio, quality: CGFloat = 1.0) -> Data? {
        guard let image = UIImage(data: input) else {
            return nil
        }
        let size = ratio.adjust(from: image.size)
        
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.jpegData(withCompressionQuality: quality) { context in
            image.draw(in: .init(origin: .zero, size: size))
        }
    }
}


extension ImageCompressor where Input: UIImage {
    
    func jpeg(quality: CGFloat) -> Data? {
        return self.input.jpegData(compressionQuality: quality)
    }
    
    func jpeg(quality: CGFloat) -> UIImage? {
        return self.jpeg(quality: quality).map { UIImage(data: $0) } ?? nil
    }
    
}
