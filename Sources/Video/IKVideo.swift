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
            .frame(width: 300, height: 120)
    }
}


#Preview {
    IKVideo(context: .demo)
        .environment(PlayingVideo())
}
