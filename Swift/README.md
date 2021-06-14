# About ℹ️
This is a first _"real"_ program in Swift.  
This first version doesn't use yet the composite pattern.  
It displays the different building blocks of phrases in Mandarin.

## What's Swift? 🐦
[Swift](https://swift.org) is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. and the open-source community.  
This alternative to the Objective-C language employs modern programming-language theory concepts and strives to present a simpler syntax. It uses a dot-notation style and namespace system more familiar to programmers from other common object-oriented languages like Java or C#.  

The platforms Swift supports are Apple's operating systems (Darwin, iOS, iPadOS, macOS, tvOS, watchOS), Linux, Windows, and Android.

## Run it 🏃🏻
Once the Swift language installed, open the CLI in the directory and type this:  

```bash
cat Types.swift Block.swift Composition.swift Main.swift | swift -
```

The result should be:

```
Only prints the components in Chinese (pinyin).
	• Huǒshān


Only prints the components with symbols.
	• 火山口


Prints the components French, Chinese and with symbols.
	• Caldeira
	 	• Cassé (Pò, 破)
	 	• Feu (Huǒ, 火)
	 	• Montagne (Shān, 山)
	 	• Bouche (Kǒu, 口)


Only prints the word with symbols.
	• 比利时


Only prints the word with symbols.
	• 王國


Prints the complete composition of the word.
	• Royaume de Belgique
	 	• Rapport (Bǐ, 比)
	 	• Profit (Lì, 利)
	 	• Quand (Shí, 时)
	 	• Roi (Wáng, 王)
	 	• Pays (Guó, 國)
```
