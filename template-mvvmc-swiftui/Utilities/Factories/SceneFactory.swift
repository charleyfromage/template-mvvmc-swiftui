//
//  ScenesFactory.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import SwiftUI

protocol SomeFlowScenesFactory {
    func makeSomeScene(someParameter: Any?) -> Scene<SomeSceneView>
}
