//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/16.
//

import UIKit

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
    
    func jpeg(roof size: CGSize, quality: CGFloat = 1.0) -> Data? {
        guard let image = UIImage(data: input)?.cgImage else {
            return nil
        }
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.jpegData(withCompressionQuality: quality) { context in
            context.cgContext.draw(image, in: .init(origin: .zero, size: size), byTiling: false)
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
