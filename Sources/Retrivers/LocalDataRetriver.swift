//
//  LocalImageDataSource.swift
//  Vivaldi
//
//  Created by LiLi on 2024/6/2.
//

import Foundation


public class LocalDataRetriver: DataRetriver {
    
    public var cacheKey: String? { localPath }
    
    private let localPath: String
    
    public init(localPath: String) {
        self.localPath = localPath
    }
    
    public func retrive() async throws -> Data {
        try Data(contentsOf: URL(filePath: localPath))
    }
    
    
}
