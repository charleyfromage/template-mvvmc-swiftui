//  
//  SomeSceneViewModelIO.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 21/08/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

struct SomeSceneInput {

}

public protocol SomeSceneViewModelInterface: class {
    // MARK: - Properties
    var model: SomeModel? { get }

//    // MARK: - Methods
//    func buttonTapped()
}

public protocol SomeSceneViewModelOutput: class {
//     func terminateScene()
}
