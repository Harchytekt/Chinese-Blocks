# Chinese Blocks
This is my first _"real"_ personnal program with Julia.  

It uses the composite pattern to display the different building blocks of compound words in Mandarin.

## What's Julia? 👱🏻‍♀️
[Julia](https://julialang.org) is a high-level, high-performance dynamic programming language for numerical computing.  
Its syntax is similar to that of Matlab, R, Scilab, Python, etc.  

Julia is designed to address the needs of high-performance numerical analysis and computational science, without the typical need of separate compilation to be fast, while also being effective for general-purpose programming, web use or as a specification language.

## Run it 🏃🏻
Once the Julia language installed, open the CLI in the directory and type this:  

    julia Main.jl

The result should be:

    Volcan :
    	• Huǒ
    	• Shān
    Cratère :
    	• 火
    	• 山
    	• 口
    Caldeira :
    	• Cassé (Pò, 破)
    	• Feu (Huǒ, 火)
    	• Montagne (Shān, 山)
    	• Bouche (Kǒu, 口)
    Belgique :
    比利时
    Royaume :
    王國
    Royaume de Belgique :
    	• Rapport (Bǐ, 比)
    	• Profit (Lì, 利)
    	• Quand (Shí, 时)
    	• Roi (Wáng, 王)
    	• Pays (Guó, 國)


💡 Unfortunately some warnings are raised at launch…  
There are of this form:  

    WARNING: replacing docs for 'Component :: Union{}' in module 'Main'.

