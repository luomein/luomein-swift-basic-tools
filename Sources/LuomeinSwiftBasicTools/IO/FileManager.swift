//
//  File.swift
//  
//
//  Created by MEI YIN LO on 2022/12/31.
//

import Foundation

public func getDocumentsDirectory() throws -> URL {
    let fileManager = FileManager.default
    let appSupportURL = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
    //  Create subdirectory
    let directoryURL = appSupportURL.appendingPathComponent(Bundle.main.bundleIdentifier!)
    try fileManager.createDirectory (at: directoryURL, withIntermediateDirectories: true, attributes: nil)
    return directoryURL
}

public func saveDataToDocuments(_ data: Data, jsonFilename: String) {

    
    do {
        let jsonFileURL = try getDocumentsDirectory().appendingPathComponent(jsonFilename)
        //print("save to: ", jsonFileURL)
        try data.write(to: jsonFileURL)
    } catch {
        fatalError()
    }
}
