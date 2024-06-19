//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/19.
//

import Foundation
import CoreMedia.CMTime

extension IKImageWrapper where Base == CMTime {
 
    var standardTime: String {
        return base.seconds.ik.standardTime
    }

}

extension IKImageWrapper where Base == TimeInterval {
    var standardTime: String {
        let seconds = Int(base)
        let duration = Duration.seconds(seconds)
        return duration.formatted()
    }
}

extension CMTime: IKImageCompatible {}
extension TimeInterval: IKImageCompatible {}
