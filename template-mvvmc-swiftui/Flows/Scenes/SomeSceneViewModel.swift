//  
//  SomeSceneViewModel.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 21/08/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import SwiftUI
import Combine

public struct SomeModel {
    var someTitle: String
}

final class SomeSceneViewModel: ObservableObject, SomeSceneViewModelInterface, SomeSceneViewModelOutput {
    var someOutputMethod: (() -> Void)?

    var model: SomeModel?

    let didChange = PassthroughSubject<SomeSceneViewModel, Never>()

    // MARK: - Input
    public var input: SomeSceneInput? {
        didSet {
            didChange.send(self)
            inputDidSet()
        }
    }

    // MARK: - Properties
    /* Insert properties below. */

    // MARK: - Init
    init(with input: SomeSceneInput) {
        defer {
            self.input = input
        }
    }

    private func inputDidSet() {

    }
}
