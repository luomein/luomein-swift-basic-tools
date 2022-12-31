//
//  File.swift
//  
//
//  Created by MEI YIN LO on 2022/12/31.
//

import Foundation

public func zipT<T>(_ data: [[T]])->[[T]]{
        let count = data.first!.count
    let initArray : [[T]] = Array(repeating: [], count: count)
        let reduced : [[T]] = data.reduce(initArray, {
            Array(zip($0,$1)).map({
                var arrayCopied : [T] = $0.0
                arrayCopied.append( $0.1 )
                return arrayCopied
            })
        })
        return reduced
    }
public func zipAny(_ data: [[Any]])->[[Any]]{
    let count = data.first!.count
    let initArray = Array(repeating: [], count: count)
    let reduced : [[Any]] = data.reduce(initArray, {
        Array(zip($0,$1)).map({
            var arrayCopied : [Any] = $0.0
            arrayCopied.append( $0.1 )
            return arrayCopied
        })
    })
    return reduced
}
