//
//  main.swift
//  Blocks
//
//  Created by Alexandre Ducobu on 10/06/2021.
//

import Foundation

class Main {

    init() {
        print("Only prints the components in Chinese (pinyin).")
        let fire = Block(name: "Feu", pinyin: "Huǒ", symbol: "火")
        let mountain = Block(name: "Montagne", pinyin: "Shān", symbol: "山")
        let volcano = Composition(name: "Volcan", blocks: [fire, mountain])
        volcano.printType(type: Types.pinyin)
        print("\n")
        
        print("Only prints the components with symbols.")
        let crater = Composition(name: "Cratère", blocks: [])
        crater.addComposition(composition: volcano)
        crater.addBlock(block: Block(name: "Bouche", pinyin: "Kǒu", symbol: "口"))
        crater.printType(type: Types.symbol)
        print("\n")
        
        print("Prints the components French, Chinese and with symbols.")
        let caldeira = Composition(name: "Caldeira")
        caldeira.addBlock(block: Block(name: "Cassé", pinyin: "Pò", symbol: "破"))
        caldeira.addComposition(composition: crater)
        print(caldeira)
        print("\n")
        
        print("Only prints the word with symbols.")
        let belgium = Composition(name: "Belgique")
        belgium.addBlock(block: Block(name: "Rapport", pinyin: "Bǐ", symbol: "比"))
        belgium.addBlock(block: Block(name: "Profit", pinyin: "Lì", symbol: "利"))
        belgium.addBlock(block: Block(name: "Quand", pinyin: "Shí", symbol: "时"))
        belgium.printType(type: Types.symbol)
        print("\n")
        
        print("Only prints the word with symbols.")
        let kingdom = Composition(name: "Royaume")
        kingdom.addBlock(block: Block(name: "Roi", pinyin: "Wáng", symbol: "王"))
        kingdom.addBlock(block: Block(name: "Pays", pinyin: "Guó", symbol: "國"))
        kingdom.printType(type: Types.symbol)
        print("\n")
        
        print("Prints the complete composition of the word.")
        let belgianKingdom = Composition(name: "Royaume de Belgique")
        belgianKingdom.addComposition(composition: belgium)
        belgianKingdom.addComposition(composition: kingdom)
        print(belgianKingdom)
    }
    
    /// This function executes some tests on `Block` and `Composition` objects.
    func test() {
        let fire = Block(name: "Feu", pinyin: "Huǒ", symbol: "火")
        assert(fire.getField(type: .name) == "Feu", "The name should be 'Feu' and not '\(fire.getField(type: .name))'.")
        assert(fire.getField(type: .pinyin) == "Huǒ", "The value should be 'Huǒ' and not '\(fire.getField(type: .pinyin))'.")
        assert(fire.getField(type: .symbol) == "火", "The value should be '火' and not '\(fire.getField(type: .symbol))'.")
        
        let mountain = Block(name: "Montagne", pinyin: "Shān", symbol: "山")
        let volcano = Composition(name: "Volcan", blocks: [fire, mountain])
        assert(volcano.getName() == "Volcan", "The name should be 'Volcan' and not '\(volcano.getName())'.")
        assert(volcano.getBlocks().count == 2, "There should be 2 blocks and not '\(volcano.getBlocks().count)'.")
        assert(volcano.getType(type: .name) == "Feu Montagne", "The 3 blocks should be 'Feu Montagne' and not '\(volcano.getType(type: .name))'.")
        
        volcano.removeBlock(block: fire)
        assert(volcano.getBlocks().count == 1, "There should only be 1 block and not '\(volcano.getBlocks().count)'.")
        assert(volcano.getType(type: .name) == "Montagne", "The block should be 'Montagne' and not '\(volcano.getType(type: .name))'.")
        
        let broken = Block(name: "Cassé", pinyin: "Pò", symbol: "破")
        let mouth = Block(name: "Bouche", pinyin: "Kǒu", symbol: "口")
        volcano.addBlock(block: broken)
        volcano.addBlock(block: mouth)
        assert(volcano.getBlocks().count == 3, "There should be 3 blocks and not '\(volcano.getBlocks().count)'.")
        assert(volcano.getType(type: .name) == "Montagne Cassé Bouche", "The 3 blocks should be 'Montagne Cassé Bouche' and not '\(volcano.getType(type: .name))'.")
        assert(volcano.getType(type: .pinyin) == "Shānpòkǒu", "The pinyin should be 'Shānpòkǒu' and not '\(volcano.getType(type: .pinyin))'.")
        assert(volcano.getType(type: .symbol) == "山破口", "The 3 symbols should be '山破口' and not '\(volcano.getType(type: .symbol))'.")
    }
}

// cat Types.swift Block.swift Composition.swift Main.swift | swift -
let main = Main()

main.test()
