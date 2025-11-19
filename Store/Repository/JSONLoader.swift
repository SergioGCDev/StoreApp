//
//  JSONLoader.swift
//  Store
//
//  Created by Sergio García on 11/11/25.
//


import Foundation

protocol JSONLoader {
    var url: URL { get }
}

extension JSONLoader {
    func load<JSON>(type: JSON.Type) throws -> JSON where JSON: Codable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(JSON.self, from: data)
    }
    
    func save<JSON>(data: JSON) throws where JSON: Codable {
        let encodedData = try JSONEncoder().encode(data)
        try encodedData.write(to: url, options: .atomic)
    }
    
//    func load<T>(type: T.Type) throws -> T where T: Codable {
//        let data = try Data(contentsOf: url)
//        return try JSONDecoder().decode(T.self, from: data)
//    }
    
    
    
//    func save<T>(data: T) throws where T: Codable {
//        let encodedData = try JSONEncoder().encode(data)
//        try encodedData.write(to: url, options: .atomic)
//    }
}
