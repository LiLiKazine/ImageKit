//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/16.
//

import UIKit

extension IKImageWrapper where Base == Data {
    public func jpeg(quality: CGFloat) -> Data? {
        return DataWrapper(input: base).jpeg(quality: quality)
    }
    
    public func jpeg(quality: CGFloat) -> UIImage? {
        return DataWrapper(input: base).jpeg(quality: quality)
    }
    
    public func jpeg(roof size: CGSize) -> Data? {
        return DataWrapper(input: base).jpeg(roof: size)
    }
}


private struct DataWrapper: ImageCompressor {
    let input: Data
}
