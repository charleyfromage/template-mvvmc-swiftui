//  
//  SomeSceneViewModelIO.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 21/08/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

public struct SomeSceneInput {
    var someParameter: Any?

    init(someParameter: Any? = nil) {
        self.someParameter = someParameter
    }
}

public protocol SomeSceneViewModelInterface: class {
    // MARK: - Properties
    var model: SomeModel? { get }

//    // MARK: - Methods
//    func buttonTapped()
}

public protocol SomeSceneViewModelOutput: class, ViewModelOutput {
    var someOutputMethod: (() -> Void)? { get set }
}
