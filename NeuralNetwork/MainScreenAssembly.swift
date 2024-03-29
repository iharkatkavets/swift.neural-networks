//
//  MainScreenAssemblyAssembly.swift
//  NeuralNetwork
//
//  Created by Igor Kotkovets on 10/22/19.
//  Copyright © 2019 Igor Kotkovets. All rights reserved.
//

import Swinject
import Foundation

class MainScreenAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MainViewInput.self) { resolver in
//            let windowController = MainWindowController()
            let servicesPool = resolver.resolve(ServicesPoolInput.self)
            let trainViewModel = BitmapViewModel()
            let testViewModel = BitmapViewModel()
            let viewModel = MainViewModel(trainViewModel: trainViewModel,
                                          testViewModel: testViewModel)
            let viewController = MainViewController(servicesPool: servicesPool, viewModel: viewModel)
//            windowController.contentViewController = viewController
            return viewController
        }
    }
}
