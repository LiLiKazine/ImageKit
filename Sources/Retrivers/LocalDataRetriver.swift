//
//  LocalImageDataSource.swift
//  Vivaldi
//
//  Created by LiLi on 2024/6/2.
//

import Foundation
import ArchiverKit

public class LocalDataRetriver: DataRetriver {
    
    public var cacheKey: String? { relativePath }
    
    private let relativePath: String
    
    public init(relativePath: String) {
        self.relativePath = relativePath
    }
    
    public func retrive() async throws -> Data {
        try Data(from: relativePath)
    }
    
}
