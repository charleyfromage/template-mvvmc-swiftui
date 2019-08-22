//  
//  SomeSceneViewModel.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 21/08/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import SwiftUI
import Combine

public struct SomeModel {
    var someTitle: String
}

final class SomeSceneViewModel: BindableObject, SomeSceneViewModelInterface, SomeSceneViewModelOutput {
    let didChange = PassthroughSubject<SomeSceneViewModel,Never>()

    // MARK: - Model
    public var model: SomeModel? {
        didSet {
            didChange.send(self)
            modelDidSet()
        }
    }

    // MARK: - Properties
    /* Insert properties below. */

    /* Uncomment below to override the init method with a model injection. */
//    // MARK: - Init
//    init(with model:) {
//        defer {
//            model = model
//        }
//    }

    private func modelDidSet() {
        /* Perform the methods subsequent to the model setup below. */
    }
}
