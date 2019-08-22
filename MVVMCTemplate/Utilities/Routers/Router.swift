//
//  Router.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import UIKit

protocol Router: Scene {
    var publicRootViewController: UIViewController? { get }

    func setRootModule(_ module: Scene?)
    func setRootModuleInNavigationController(_ module: Scene?)
    func replaceRootModuleInNavigationController(_ module: Scene?)

    func present(_ module: Scene?)
    func present(_ module: Scene?, animated: Bool)
    func presentOverContext(_ module: Scene?, animated: Bool)
    func presentOverTopModule(_ module: Scene?)
    func smoothOverContext(_ module: Scene?, with delegate: TransitioningDelegate?, from cell: UICollectionViewCell)
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func dismissTopModule(animated: Bool, completion: (() -> Void)?)

    func push(_ module: Scene?)
    func push(_ module: Scene?, animated: Bool)
    func push(_ module: Scene?, animated: Bool, completion: (() -> Void)?)
    func popModule()
    func popModule(animated: Bool)
    func popToRootModule(animated: Bool)

    func setTabModule(_ module: Scene?)
    func setTabModuleInNavigationController(_ module: Scene?) -> UINavigationController?
    func setTabModuleInSettingsNavigationController(_ module: Scene?) -> UINavigationController?
}
