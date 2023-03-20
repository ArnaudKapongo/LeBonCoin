//
//  HomePageVM.swift
//  LeBonCoin
//
//  Created by Younup on 20/03/2023.
//

import Foundation

class HomePageVM {
    
    typealias ItemCompletion = ([Item]) -> Void
    typealias ErreurCompletion = () -> Void
    var itemCompletion: ItemCompletion?
    var erreurCompletion: ErreurCompletion?
    
    let homePageService: HomePageService
    
    init(homePageService: HomePageService) {
        self.homePageService = homePageService
    }
    
    func getItems() {
        homePageService.getListItem { listItem, erreur in
            guard erreur == nil, self.itemCompletion != nil else {
                self.erreurCompletion?()
                return
            }
            self.itemCompletion?(listItem)
        }
    }
    
}
