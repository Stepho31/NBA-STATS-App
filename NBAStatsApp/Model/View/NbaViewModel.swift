//
//  NbaViewModel.swift
//  
//
//  Created by Stephen on 6/12/22.
//

import Foundation
import CoreData



class NbaViewModel {
    
    private var manager: CoreDataManager
    private var favorite: Favorites? {
        didSet {
            self.updateHandle?()
        }
    }
    private var updateHandle: (() -> Void)?
    
    init(manager: CoreDataManager = CoreDataManager()) {
        self.manager = manager
    }
    
//    private var updateHandle: (() -> Void)?
//    
//    init(manager: CoreDataManager = CoreDataManager()) {
//        self.manager = manager
//    }
//    
//    func bind(handler: @escaping (() -> Void)) {
//        self.updateHandle = handler
//    }
//    
//    func makeKittyKat() {
//        self.kittyKat = self.manager.makeKitty()
//        self.manager.saveContext()
//    }

//    private var manager: CoreDataManager
//    private var favorite: Favorites? {
//        didSet {
//            self.updateHandle?()
//        }
//    }
//
//    private var updateHandle: (() -> Void)?
//
//    init(manager: CoreDataManager = CoreDataManager()) {
//        self.manager = manager
//    }
//
//    func bind(handler: @escaping (() -> Void)) {
//        self.updateHandle = handler
//    }

//private var viewModels = [NbaTableViewCellViewModel]()
