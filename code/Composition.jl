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

include("Component.jl")
include("Block.jl")

"""
    The Composition type, a subtype of Component, contains a list of Compositions and/or Blocks.
    This is the _Composite_ in the Composite Pattern.
"""
type Composition <: Component
    name::String
    list::Array{Any,1}
end

"""
    printComposition(composition::Composition)

Displays the name, chinese and symbol of the chosen composition.

# Arguments
- `composition::Composition`: the current mandarin composed word.

# Examples
```julia-repl
julia> Volcan = Composition("Volcan", [])
julia> addComponent(Volcan, Block("Feu", ("Huǒ", "火")))
julia> addComponent(Volcan, Block("Montagne", ("Shān", "山")))
julia> printComposition(Volcan)
    • Huǒ
	• Shān
```
"""
function printComposition(composition::Composition)
    for item in composition.list
        printComposition(item)
    end
end

"""
    printSymbols(composition::Composition)

Displays the symbols of the chosen composition.

# Arguments
- `composition::Composition`: the current mandarin composed word.

# Examples
```julia-repl
julia> Volcan = Composition("Volcan", [])
julia> addComponent(Volcan, Block("Feu", ("Huǒ", "火")))
julia> addComponent(Volcan, Block("Montagne", ("Shān", "山")))
julia> printSymbols(Volcan)
    • 火
	• 山
```
"""
function printSymbols(composition::Composition)
    for item in composition.list
        printSymbols(item)
    end
end

"""
    printChinese(composition::Composition)

Displays the chineses words of the chosen composition.

# Arguments
- `composition::Composition`: the current mandarin composed word.

# Examples
```julia-repl
julia> Volcan = Composition("Volcan", [])
julia> addComponent(Volcan, Block("Feu", ("Huǒ", "火")))
julia> addComponent(Volcan, Block("Montagne", ("Shān", "山")))
julia> printChinese(Volcan)
    • Huǒ
	• Shān
```
"""
function printChinese(composition::Composition)
    for item in composition.list
        printChinese(item)
    end
end

"""
    printSymbols(composition::Composition)

Displays the symbols of the chosen composition on a single line.

# Arguments
- `composition::Composition`: the current mandarin composed word.

# Examples
```julia-repl
julia> Volcan = Composition("Volcan", [])
julia> addComponent(Volcan, Block("Feu", ("Huǒ", "火")))
julia> addComponent(Volcan, Block("Montagne", ("Shān", "山")))
julia> print(Volcan)
火山
```
"""
function print(composition::Composition)
    for item in composition.list
        print(item)
    end
    println()
end

"""
    printComposed(composition::Composition)

Displays the complete composition.

# Arguments
- `composition::Composition`: the current mandarin composed word.

# Examples
```julia-repl
julia> Volcan = Composition("Volcan", [])
julia> addComponent(Volcan, Block("Feu", ("Huǒ", "火")))
julia> addComponent(Volcan, Block("Montagne", ("Shān", "山")))
julia> printComposed(Volcan)
Volcan :
	• Feu (Huǒ, 火)
	• Montagne (Shān, 山)
```
"""
function printComposed(composition::Composition, choice="")
    println(composition.name * " :")
    if choice == "composition"
        printComposition(composition)
    elseif choice == "symbols"
        printSymbols(composition)
    elseif choice == "chinese"
        printChinese(composition)
    else
        print(composition)
    end
end

"""
    addComponent(composition::Composition, item::Component)

Adds an item to the composition.
The item is a Component : it can be a Block or a Composition.

# Arguments
- `composition::Composition`: the current mandarin composed word.
- `item::Component`: the item to add to the composition.

# Examples
```julia-repl
julia> Volcan = Composition("Volcan", [])
julia> addComponent(Volcan, Block("Feu", ("Huǒ", "火")))
julia> printComposed(Volcan)
Volcan :
	• Feu (Huǒ, 火)
```
"""
function addComponent(composition::Composition, item::Component)
    push!(composition.list, item)
end

"""
    removeComponent(composition::Composition, item::Component)

Removes an item from the composition.
The item is a Component : it can be a Block or a Composition.
**Note :** the item as to be a direct child of the chosen composition.

# Arguments
- `composition::Composition`: the current mandarin composed word.
- `item::Component`: the item to remove from the composition.

# Examples
- This one will work :
```julia-repl
julia> Volcan = Composition("Volcan", [])
julia> addComponent(Volcan, Block("Feu", ("Huǒ", "火")))
julia> addComponent(Volcan, Block("Montagne", ("Shān", "山")))
julia> removeComponent(Volcan, Block("Feu", ("Huǒ", "火")))
julia> printComposed(Volcan)
Volcan :
	• Montagne (Shān, 山)
```
- This one won't :
```julia-repl
julia> Volcan = Composition("Volcan", [])
julia> addComponent(Volcan, Block("Feu", ("Huǒ", "火")))
julia> addComponent(Volcan, Block("Montagne", ("Shān", "山")))
julia> Cratere = Composition("Cratère", [])
julia> addComponent(Cratere, Volcan)
julia> addComponent(Cratere, Block("Bouche", ("Kǒu", "口")))
julia> removeComponent(Cratere, Block("Feu", ("Huǒ", "火")))
ERROR: LoadError: MethodError: no method matching getIndex(::Block)
```
"""
function removeComponent(composition::Composition, item::Component)
    splice!(composition.list, getIndex(item))
end

"""
    getIndex(composition::Composition, item::Component)

Gets the index of the item.
The item is a Component : it can be a Block or a Composition.
**Note :** the item as to be a direct child of the chosen composition.

# Arguments
- `composition::Composition`: the current mandarin composed word.
- `item::Component`: the item of which the index is wanted.

# Examples
- This one will work :
```julia-repl
julia> Volcan = Composition("Volcan", [])
julia> addComponent(Volcan, Block("Feu", ("Huǒ", "火")))
julia> addComponent(Volcan, Block("Montagne", ("Shān", "山")))
julia> getIndex(Volcan, Block("Feu", ("Huǒ", "火")))
1
```
- This one won't :
```julia-repl
julia> Volcan = Composition("Volcan", [])
julia> addComponent(Volcan, Block("Feu", ("Huǒ", "火")))
julia> addComponent(Volcan, Block("Montagne", ("Shān", "山")))
julia> Cratere = Composition("Cratère", [])
julia> addComponent(Cratere, Volcan)
julia> addComponent(Cratere, Block("Bouche", ("Kǒu", "口")))
julia> getIndex(Cratere, Block("Feu", ("Huǒ", "火")))
nothing
```
"""
function getIndex(composition::Composition, item::Component)
    for i in range(1, length(composition.list))
        if composition.list[i].name == item.name
            return i
        end
    end
end
