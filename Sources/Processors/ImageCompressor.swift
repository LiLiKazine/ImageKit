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
}


extension ImageCompressor where Input: UIImage {
    
    func jpeg(quality: CGFloat) -> Data? {
        return self.input.jpegData(compressionQuality: quality)
    }
    
    func jpeg(quality: CGFloat) -> UIImage? {
        return self.jpeg(quality: quality).map { UIImage(data: $0) } ?? nil
    }
    
}
