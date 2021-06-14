# Chinese Blocks 中文
This project serves me to test new program languages as Julia and Swift.  
The goal is to implement the composite pattern to display the different building blocks of compound words and phrases in Mandarin.

## 
In the Chinese language, there are 180 to 215 radicals or *buildings blocks*.  
They are used to build other characters or phrases.  
An example would be 木 which means *tree*.

One building block (木 or 火, for *fire*) or an alternate compound form (灬 for *fire*) can be combined to make a *compound character*.  
Compound characters can comprise two or more different building blocks (炎 for *burning hot*; 林 for *woods*).

Both *building block* and *compound' refer to a single-character word.  
Two or more independent characters will build a phrase.  
In English, a phrase may translate as a single word or a group of words.  
For example, 火山 (*fire* and *mountain* will be translated as *volcano*).

## Result
The result might differ from one implementation to another.  
Here's the output of the program in Groovy:

	• Caldera (Pò huǒ shān kǒu, 破火山口)
		• Broken (Pò, 破)
		• Crater (Huǒ shān kǒu, 火山口)
			• Volcano (Huǒ shān, 火山)
				• Fire (Huǒ, 火)
				• Mountain (Shān, 山)
			• Mouth (Kǒu, 口)

