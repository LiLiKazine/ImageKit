//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/16.
//

import Foundation

public struct IKImageWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol IKImageCompatible { }

extension IKImageCompatible {
    /// Gets a namespace holder for Kingfisher compatible types.
    public var ik: IKImageWrapper<Self> {
        get { return IKImageWrapper(self) }
        set { }
    }
}

