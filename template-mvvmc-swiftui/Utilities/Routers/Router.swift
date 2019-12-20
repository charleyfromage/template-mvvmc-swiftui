//
//  Router.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import UIKit
import SwiftUI

protocol Router {
    associatedtype RootView: View

    var rootView: RootView? { get set }

//    func setRootModule<SomeView: View>(_ view: SomeView)
//    func setRootModuleInNavigationController(_ module: Scene?)
//    func replaceRootModuleInNavigationController(_ module: Scene?)
//
    func present<SomeView: View>(_ view: SomeView)
//    func present(_ module: Scene?, animated: Bool)
//    func presentOverContext(_ module: Scene?, animated: Bool)
//    func presentOverTopModule(_ module: Scene?)
//    func smoothOverContext(_ module: Scene?, with delegate: TransitioningDelegate?, from cell: UICollectionViewCell)
//    func dismissModule()
//    func dismissModule(animated: Bool, completion: (() -> Void)?)
//    func dismissTopModule(animated: Bool, completion: (() -> Void)?)
//
    func push<SomeView: View>(_ view: SomeView)
//    func push(_ module: Scene?, animated: Bool)
//    func push(_ module: Scene?, animated: Bool, completion: (() -> Void)?)
//    func popModule()
//    func popModule(animated: Bool)
//    func popToRootModule(animated: Bool)
//
//    func setTabModule(_ module: Scene?)
//    func setTabModuleInNavigationController(_ module: Scene?) -> UINavigationController?
//    func setTabModuleInSettingsNavigationController(_ module: Scene?) -> UINavigationController?
}
