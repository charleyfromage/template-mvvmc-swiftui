//
//  RouterImp.swift
//  MVVMCTemplate
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import UIKit

final class RouterImp: NSObject, Router {
    private var window: UIWindow?
    private weak var rootViewController: UIViewController? {
        didSet {
            window?.rootViewController = rootViewController
        }
    }

    var publicRootViewController: UIViewController? {
        return rootViewController
    }

    private var completions: [UIViewController : () -> Void]

    init(with window: UIWindow?) {
        self.window = window
        completions = [:]
    }

    init(with rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        completions = [:]
    }

    func toPresent() -> UIViewController? {
        return rootViewController
    }

    func setRootModule(_ module: Scene?) {
        guard let controller = module?.toPresent() else { return }

        rootViewController = controller
    }

    func setRootModuleInNavigationController(_ module: Scene?) {
        guard let controller = module?.toPresent() else { return }

        let navigationController = UINavigationController(rootViewController: controller)

        rootViewController = navigationController
    }

    func replaceRootModuleInNavigationController(_ module: Scene?) {
        guard let rootViewController = rootViewController as? UINavigationController else { return }
        guard let controller = module?.toPresent() else {
            rootViewController.viewControllers = []
            return
        }

        rootViewController.viewControllers = [controller]
    }

    func present(_ module: Scene?) {
        present(module, animated: true)
    }

    func present(_ module: Scene?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootViewController?.present(controller, animated: animated, completion: nil)
    }

    func presentOverContext(_ module: Scene?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }

        controller.modalPresentationStyle = .overFullScreen

        if rootViewController?.presentedViewController == nil {
            present(controller, animated: animated)
        } else {
            if let rootViewController = rootViewController {
                topModalController(for: rootViewController)?.present(controller, animated: animated)
            }
        }
    }

    func presentOverTopModule(_ module: Scene?) {
        guard let controller = module?.toPresent() else { return }

        if rootViewController?.presentedViewController == nil {
            present(controller)
        } else {
            if let rootViewController = rootViewController {
                topModalController(for: rootViewController)?.present(controller, animated: true)
            }
        }
    }

    func smoothOverContext(_ module: Scene?, with delegate: TransitioningDelegate?, from cell: UICollectionViewCell) {
        guard let controller = module?.toPresent() else { return }
        controller.modalPresentationStyle = .custom

        var frame = cell.frame
        frame.origin.x += cell.superview?.frame.origin.x ?? 0
        frame.origin.y += cell.superview?.frame.origin.y ?? 0
        frame.origin.y += 20
        delegate?.openingFrame = frame

        controller.transitioningDelegate = delegate
        if let modalViewController = rootViewController?.presentedViewController {
            modalViewController.present(controller, animated: true, completion: nil)
        }
    }

    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }

    func dismissModule(animated: Bool, completion: (() -> Void)? = nil) {
        rootViewController?.dismiss(animated: animated, completion: completion)
    }

    func dismissTopModule(animated: Bool, completion: (() -> Void)? = nil) {
        if rootViewController?.presentedViewController == nil {
            dismissModule(animated: true, completion: nil)
        } else {
            if let rootViewController = rootViewController {
                topModalController(for: rootViewController)?.dismiss(animated: animated, completion: completion)
            }
        }
    }

    func push(_ module: Scene?) {
        push(module, animated: true)
    }

    func push(_ module: Scene?, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }

    func push(_ module: Scene?, animated: Bool, completion: (() -> Void)?) {
        guard let rootController = rootViewController as? UINavigationController,
              let controller = module?.toPresent(),
              (controller is UINavigationController == false)
        else { return }

        if let completion = completion {
            completions[controller] = completion
        }

        rootController.pushViewController(controller, animated: animated)
    }

    func popModule() {
        popModule(animated: true)
    }

    func popModule(animated: Bool) {
        guard let rootController = rootViewController as? UINavigationController else { return }

        if let controller = rootController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    func popToRootModule(animated: Bool) {
        guard let rootController = rootViewController as? UINavigationController else { return }

        if let controllers = rootController.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }

    func setTabModule(_ module: Scene?) {
        guard let rootViewController = rootViewController as? UITabBarController,
            let viewController = module?.toPresent()
            else { return }

        if rootViewController.viewControllers != nil {
            rootViewController.viewControllers?.append(viewController)
        } else {
            rootViewController.viewControllers = [viewController]
        }
    }

    func setTabModuleInNavigationController(_ module: Scene?) -> UINavigationController? {
        guard let rootViewController = rootViewController as? UITabBarController,
              let viewController = module?.toPresent()
        else { return nil }

        let navigationController = AccountNavigationController(rootViewController: viewController)

        if rootViewController.viewControllers != nil {
            rootViewController.viewControllers?.append(navigationController)
        } else {
            rootViewController.viewControllers = [navigationController]
        }

        return navigationController
    }

    func setTabModuleInSettingsNavigationController(_ module: Scene?) -> UINavigationController? {
        guard let rootViewController = rootViewController as? UITabBarController,
            let viewController = module?.toPresent()
            else { return nil }

        let navigationController = BaseNavigationController(rootViewController: viewController)

        if rootViewController.viewControllers != nil {
            rootViewController.viewControllers?.append(navigationController)
        } else {
            rootViewController.viewControllers = [navigationController]
        }

        return navigationController
    }

    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }

        completion()
        completions.removeValue(forKey: controller)
    }
}

// MARK: - Helpers
private extension RouterImp {
    func topModalController(for presentingRootController: UIViewController) -> UIViewController? {
        if let modalViewController = presentingRootController.presentedViewController {
            if let childModalViewController = topModalController(for: modalViewController) {
                return childModalViewController
            } else {
                return modalViewController
            }
        }

        return nil
    }
}
