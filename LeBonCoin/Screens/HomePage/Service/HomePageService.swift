//
//  HomePageService.swift
//  LeBonCoin
//
//  Created by Younup on 20/03/2023.
//

import Foundation


protocol HomePageServiceProtocol {
    func getListItem(completion: @escaping () -> Void)
}

class HomePageService {
    
    let apiManager: ApiManager
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    func getListItem(completion: @escaping ([Item], ApiError?) -> ()) {
        self.apiManager.get([Item].self, route: Constant.itemUrl) { result in
            
            switch result {
            case .success(let response):
                print("SUCCESS")
                completion(response, nil)
            case .failure(let error):
                print("ERREUR")
                completion([], error as? ApiError)
            }

        }
    }
}
