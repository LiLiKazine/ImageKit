//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/19.
//

import SwiftUI

public struct IKVideo: View {
    
    let context: Context
    
    public var body: some View {
        IKVideoRenderer(context: context)
    }
}

extension IKVideo {
    public init(url: URL) {
        self.init(context: .init(url: url))
    }
}


#Preview {
    IKVideo(context: .demo)
        .environment(PlayingVideo())
}
