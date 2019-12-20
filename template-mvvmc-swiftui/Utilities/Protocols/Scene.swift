//
//  Scene.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import SwiftUI

//public protocol Scene {
//    associatedtype SomeView: View
//
//    var view:       SomeView        { get }
//    var viewModel:  ViewModelOutput { get }
//
//    init(view: SomeView, viewModel: ViewModelOutput)
//}

struct Scene<SomeView: View> {
    var view:       SomeView
    var viewModel:  ViewModelOutput

    init(view: SomeView, viewModel: ViewModelOutput) {
        self.view = view
        self.viewModel = viewModel
    }
}
