//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/19.
//

import SwiftUI

struct IKVideoRenderer: View {
    
    let context: IKVideo.Context
    
    @State private var binder = IKVideo.Binder()
    
    init(context: IKVideo.Context) {
        self.context = context
    }
    
    var body: some View {
        
        if binder.isPlaying {
            Text("Playing")
        } else if let image = binder.cover {
            IKVideoCover(image: image, duration: binder.duration)
                .overlay {
                    Image(systemName: "play.circle.fill")
                        .opacity(0.8)
                        .onTapGesture {
                            play()
                        }
                }
        } else {
            Text("Loading...")
        }
        
    }
    
    
    func play() {
        
    }
}
