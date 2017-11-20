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
    volcan = Composition("Volcan", [])
    addcomponent(volcan, Block("Feu", ("Huǒ", "火")))
    addcomponent(volcan, Block("Montagne", ("Shān", "山")))
    printcomposed(volcan, "chinese")

    "Only prints the components with symbols."
    cratere = Composition("Cratère", [])
    addcomponent(cratere, volcan)
    addcomponent(cratere, Block("Bouche", ("Kǒu", "口")))
    printcomposed(cratere, "symbols")

    "Prints the components French, Chinese and with symbols."
    Caldeira = Composition("Caldeira", [])
    addcomponent(Caldeira, Block("Cassé", ("Pò", "破")))
    addcomponent(Caldeira, cratere)
    printcomposed(Caldeira, "composition")

    "Only prints the word with symbols."
    belgique = Composition("Belgique", [])
    addcomponent(belgique, Block("Rapport", ("Bǐ", "比")))
    addcomponent(belgique, Block("Profit", ("Lì", "利")))
    addcomponent(belgique, Block("Quand", ("Shí", "时")))
    printcomposed(belgique)

    "Only prints the word with symbols."
    royaume = Composition("Royaume", [])
    addcomponent(royaume, Block("Roi", ("Wáng", "王")))
    addcomponent(royaume, Block("Pays", ("Guó", "國")))
    printcomposed(royaume)

    "Prints the complete composition of the word."
    royaume_belgique = Composition("Royaume de Belgique", [])
    addcomponent(royaume_belgique, belgique)
    addcomponent(royaume_belgique, royaume)
    printcomposed(royaume_belgique, "composition")
end

main()
