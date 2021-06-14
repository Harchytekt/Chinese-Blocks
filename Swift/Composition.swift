//
//  Composition.swift
//  Blocks
//
//  Created by Alexandre Ducobu on 10/06/2021.
//

import Foundation

class Composition: CustomStringConvertible {
    var name: String
    var blocks: [Block]
    
    /// Initialize the `Composition` object with a name and a list of `Block` objects.
    /// - Parameters:
    ///   - name: The name of the Chinese composition
    ///   - blocks: The list of the blocks
    init(name: String, blocks: [Block] = []) {
        self.name = name
        self.blocks = blocks
    }
    
    public var description: String {
        var res = "\t• \(self.name)"
        
        for block in blocks {
            res += "\n\t \(block)"
        }
        
        return res
    }
    
    func printName() {
        print("\t• \(self.name)")
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getBlocks() -> [Block] {
        return self.blocks
    }
    
    func getType(type: Types) -> String {
        var res = ""
        for block in blocks {
            switch type {
            case .name:
                res += "\(block.getField(type: type)) "
            case .pinyin:
                fallthrough
            case .symbol:
                res += "\(block.getField(type: type))"
            }
        }
        if (type == .pinyin) {
            res = res.lowercased().firstUppercased
        } else if (type == .name) {
            res = String(res.dropLast())
        }
        return res
    }
    
    func printType(type: Types) {
        print("\t• \(getType(type: type))")
    }
    
    func addBlock(block: Block) {
        self.blocks.append(block)
    }
    
    func removeBlock(block: Block) {
        let index = self.blocks.firstIndex(of: block)
        self.blocks.remove(at: index!)
    }
    
    func addComposition(composition: Composition) {
        let blocks = composition.getBlocks()
        for block in blocks {
            self.addBlock(block: block)
        }
    }
    
    func removeComposition(composition: Composition) {
        let blocks = composition.getBlocks()
        for block in blocks {
            self.removeBlock(block: block)
        }
    }
}

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}

/*// cat Types.swift Block.swift Composition.swift | swift -
 let fire = Block(name: "Feu", pinyin: "Huǒ", symbol: "火")
 let mountain = Block(name: "Montagne", pinyin: "Shān", symbol: "山")
 let composition = Composition(name: "Volcan", blocks: [fire, mountain])
 
 print(composition)
 composition.printName()
 composition.printType(type: Types.name)
 composition.printType(type: Types.pinyin)
 composition.printType(type: Types.symbol)*/
