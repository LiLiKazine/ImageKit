//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/19.
//

import SwiftUI
import Combine

public struct IKVideo: View {
    
    let context: Context
    
    @ControlAction var controlAction
    
    public var body: some View {
        IKVideoRenderer(context: context, action: $controlAction)
            .environment(PlayingVideo.shared)
            
    }
}

extension IKVideo {
    public init(url: URL) {
        self.init(context: .init(url: url))
    }
    
    public init(localVideo: LocalVideo, controlVisiblity: ContorlVisiblity) {
        self.init(context: .init(localVideo: localVideo, controlVisiblity: controlVisiblity))
    }
    
}

extension IKVideo {
    public func control(_ action: ControlAction.Binding) -> some View {
        self.onReceive(action) { self.controlAction = $0 }
    }
}

extension IKVideo {
    
    @propertyWrapper public class ControlAction : DynamicProperty {
        
        public class Binding: Publisher {
            public typealias Output = Control
            public typealias Failure = Never            
            
            let publisher: AnyPublisher<Control, Never>
            init(publisher: AnyPublisher<Control, Never>) {
                self.publisher = publisher
            }
            
            public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Control == S.Input {
                publisher.receive(subscriber: subscriber)
            }
        }
        
        public var wrappedValue: Control? {
            get { nil }
            set {
                guard let newValue else { return }
                actionFlow.send(newValue)
            }
        }
        public var projectedValue: Binding { 
            Binding(publisher: actionFlow.eraseToAnyPublisher())
        }
        
        private let actionFlow = PassthroughSubject<Control, Never>()
        
        public init() {}
    }
    
}


#Preview {
    IKVideo(context: .demo)
        .environment(PlayingVideo())
}
