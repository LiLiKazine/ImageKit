//
//  IKImage.swift
//  Vivaldi
//
//  Created by LiLi on 2024/5/20.
//

import SwiftUI

public struct IKImage: View, IKImagePresenter {    
    
    public let context: Context<Image>
    
    init(context: Context<Image>) {
        self.context = context
        
    }
    
}

public extension IKImage {
    init(retriver: DataRetriver) {
        self.init(context: .init(retriver: retriver))
    }
    
    init(systemName: String) {
        self.init(context: .init(systemName: systemName))
    }
}

public extension IKImage {
    
    init(relativePath: String) {
        let retriver = LocalDataRetriver(relativePath: relativePath)
        self.init(retriver: retriver)
    }
    
}

#Preview {
    IKImage(systemName: "doc.text.image")
}


