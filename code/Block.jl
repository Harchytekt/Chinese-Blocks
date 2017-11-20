# This is a simple program which displays compound words in Mandarin in the Terminal.
# Copyright (C) 2017 Ducobu Alexandre (Harchytekt)

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

include("Component.jl")

import Base.print
import Base.println

"""
    The Block type, a subtype of Component, contains the symbol and its chinese translation.
    This is the _Leaf_ in the Composite Pattern.
"""
type Block <: Component
    name::String
    tuple::Tuple{String,String}
end

"""
    printcomposition(block::Block)

Displays the name, chinese and symbol of the chosen block.

# Arguments
- `block::Block`: the current mandarin block.

# Examples
```julia-repl
julia> block = Block("Roi", ("Wáng", "王"))
julia> printcomposition(block)
    • Roi (Wáng, 王)
```
"""
function printcomposition(block::Block)
    println("\t• " * block.name * " (" * block.tuple[1] * ", " * block.tuple[2] * ")")
end

"""
    printsymbols(block::Block)

Displays the symbol of the chosen block.

# Arguments
- `block::Block`: the current mandarin block.

# Examples
```julia-repl
julia> block = Block("Roi", ("Wáng", "王"))
julia> printsymbols(block)
    • 王
```
"""
function printsymbols(block::Block)
    println("\t• " * block.tuple[2])
end

"""
    printchinese(block::Block)

Displays the chinese of the chosen block.

# Arguments
- `block::Block`: the current mandarin block.

# Examples
```julia-repl
julia> block = Block("Roi", ("Wáng", "王"))
julia> printchinese(block)
    • Wáng
```
"""
function printchinese(block::Block)
    println("\t• " * block.tuple[1])
end

"""
    print(block::Block)

Displays the symbol of the chosen block on a single line.
When there are several blocks, they are sticked together.

# Arguments
- `block::Block`: the current mandarin block.

# Examples
```julia-repl
julia> block = Block("Roi", ("Wáng", "王"))
julia> print(block)
王
```
"""
function print(block::Block)
    print(block.tuple[2])
end
