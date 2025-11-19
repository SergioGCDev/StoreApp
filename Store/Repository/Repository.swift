//
//  Repository.swift
//  Store
//
//  Created by Sergio García on 11/11/25.
//

import Foundation

struct Repository: DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "products_100", withExtension: "json")!
    }
}

struct RepositoryTest: DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "products_7", withExtension: "json")!
    }
    func save(products: [Product]) throws {
        print("Se han intentado guardar \(products.count).")
    }
}
