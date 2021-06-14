//
//  Block.swift
//  Blocks
//
//  Created by Alexandre Ducobu on 10/06/2021.
//

import Foundation

class Block: CustomStringConvertible, Equatable {
    var name: String
    var pinyin: String
    var symbol: String
    
    /// Initialize the `Block` object with a name, a pinyin representation and a symbol.
    /// - Parameters:
    ///   - name: The name of the Chinese block
    ///   - pinyin: The pinyin representation of the block
    ///   - symbol: The simplified representation of the block
    init(name: String, pinyin: String, symbol: String) {
        self.name = name
        self.pinyin = pinyin
        self.symbol = symbol
    }
    
    /// Print the `Block` object as a `String`.
    ///
    /// # Example
    /// ```
    /// let fire = Block(name: "Feu", pinyin: "Huǒ", symbol: "火")
    /// print(fire) //     • Feu (Huǒ, 火)
    /// ```
    public var description: String {
        return "\t• \(self.name) (\(self.pinyin), \(self.symbol))"
    }
    
    /// Return the field of the `Block` from its enum type.
    ///
    /// # Example
    /// ```
    /// let fire = Block(name: "Feu", pinyin: "Huǒ", symbol: "火")
    /// print(fire.getField(type: .symbol)) // 火
    /// ```
    ///
    /// - Parameter type: The type of the field from the ``Types`` enum.
    /// - Returns: The chosen field
    func getField(type: Types) -> String {
        switch type {
        case .name:
            return self.name
        case .pinyin:
            return self.pinyin
        case .symbol:
            return self.symbol
        }
    }
    
    /// Print the field of the `Block` from its enum type.
    ///
    /// # Example
    /// ```
    /// let fire = Block(name: "Feu", pinyin: "Huǒ", symbol: "火")
    /// fire.printField(type: .symbol)) // 火
    /// ```
    ///
    /// - Parameter type: The type of the field from the ``Types`` enum.
    func printField(type: Types) {
        print("\t• \(self.getField(type: type))")
    }
    
    /// Compare two `Block`objects from their name (to be `Equatable`).
    /// - Parameters:
    ///   - lhs: The `Block` being compared.
    ///   - rhs: The `Block` to compare.
    /// - Returns: `true`if the two `Block`objects are equal, `false`otherwise.
    static func == (lhs: Block, rhs: Block) -> Bool {
        return lhs.name == rhs.name
    }
}

/*
 // swift Block.swift
 let block = Block(name: "Feu", pinyin: "Huǒ", symbol: "火")
 
 print(block)
 block.printName()
 block.printPinyin()
 block.printSymbol()*/
