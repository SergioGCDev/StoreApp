//
//  DataRepository.swift
//  Store
//
//  Created by Sergio García on 11/11/25.
//

//import Foundation
//
//// Crear protocolo
//
//protocol DataRepository: JSONLoader {
//    func load() throws -> Catalog
//    //func save(products: [Product]) throws
//}
//
//extension DataRepository {
//    func load() throws -> Catalog {
//        try load(type: Catalog.self)
//    }
//    
////    func save(products: [Product]) throws {
////        try save(data: products)
////    }
//}



import Foundation

protocol DataRepository: JSONLoader {
    func load() throws -> [Product]
    func save(products: [Product]) throws
}

extension DataRepository {
    func load() throws -> [Product] {
        // El JSON tiene un objeto raíz con "products": [...]
        let catalog: Catalog = try load(type: Catalog.self)
        return catalog.products
    }

    func save(products: [Product]) throws {
        try save(data: products)
    }
}
