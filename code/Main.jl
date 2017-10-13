"""
	This is a simple program which displays compound words in Mandarin in the Terminal.
	Copyright (C) 2017 Ducobu Alexandre (Harchytekt)

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
"""

include("Composition.jl")
include("Block.jl")

function main()
    "Only prints the components in Chinese."
    Volcan = Composition("Volcan", [])
    addComponent(Volcan, Block("Feu", ("Huǒ", "火")))
    addComponent(Volcan, Block("Montagne", ("Shān", "山")))
    printComposed(Volcan, "chinese")

    "Only prints the components with symbols."
    Cratere = Composition("Cratère", [])
    addComponent(Cratere, Volcan)
    addComponent(Cratere, Block("Bouche", ("Kǒu", "口")))
    printComposed(Cratere, "symbols")

    "Prints the components French, Chinese and with symbols."
    Caldeira = Composition("Caldeira", [])
    addComponent(Caldeira, Block("Cassé", ("Pò", "破")))
    addComponent(Caldeira, Cratere)
    printComposed(Caldeira, "composition")

    "Only prints the word with symbols."
    Belgique = Composition("Belgique", [])
    addComponent(Belgique, Block("Rapport", ("Bǐ", "比")))
    addComponent(Belgique, Block("Profit", ("Lì", "利")))
    addComponent(Belgique, Block("Quand", ("Shí", "时")))
    printComposed(Belgique)

    "Only prints the word with symbols."
    Royaume = Composition("Royaume", [])
    addComponent(Royaume, Block("Roi", ("Wáng", "王")))
    addComponent(Royaume, Block("Pays", ("Guó", "國")))
    printComposed(Royaume)

    "Prints the complete composition of the word."
    RB = Composition("Royaume de Belgique", [])
    addComponent(RB, Belgique)
    addComponent(RB, Royaume)
    printComposed(RB, "composition")
end

main()
