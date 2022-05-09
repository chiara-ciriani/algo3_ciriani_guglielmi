!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests'!
TARTUP---- (8 May 2022 20:13:16) as /home/kovix/Desktop/Cuis/linux64/NumerosParte2.image! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'chiara 5/8/2022 20:13:47'!
nd
    ^ self class with: aMinuend integerValue - value.! !

!NumeroTest methodsFor: 'tests' stamp: 'chiara 5/8/2022 20:14:30'!
:= aFractionMinuend numerator * denominator - (aFractionMinuend denominator * numerator).
    newDenominator := aFractionMinuend denominator * denominator .
    ^ newNumerator / newDenominator .! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'chiara 5/8/2022 20:14:30'!
^ newNumerator / newDenominator .! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'chiara 5/8/2022 20:15:03'!
nd
    ^ aMinuend * self denominator - self numerator / self denominator.! !

!NumeroTest methodsFor: 'tests' stamp: 'chiara 5/8/2022 20:15:21'!
beSubtractedFromAFraction: aFractionMinuend
    | newNumerator newDenominator |
    newNumerator _ aFractionMinuend numerator * denominator - (aFractionMinuend denominator * numerator).
    newDenominator _ aFractionMinuend denominator * denominator .
    ^ newNumerator / newDenominator .! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'chiara 5/8/2022 20:15:21'!
denominator - (aFractionMinuend denominator * numerator).
    newDenominator _ aFractionMinuend denominator * denominator .
    ^ newNumerator / newDenominator .! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'chiara 5/8/2022 20:15:21'!
^ newNumerator / newDenominator .! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests'!
est #test02isZeroReturnsFalseWhenAskToOthersButZero stamp: 'chiara 5/8/2022 20:15:29'! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'chiara 5/8/2022 20:15:29'!
SED! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests'!
stRun: #NumeroTest #test06EnteroMultipliesWithEnteroCorrectly stamp: 'chiara 5/8/2022 20:15:29'! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'initialization'!
estRun: #NumeroTest #test39NegationOfEnteroIsCorrect stamp: 'chiara 5/8/2022 20:17:47'! !

!Numero methodsFor: 'initialization'!
eWhenAskToZero stamp: 'chiara 5/8/2022 20:32:31'! !


!Numero methodsFor: 'accessing'!
ionSubstractsEnteroCorrectly stamp: 'chiara 5/8/2022 20:15:29'! !

!Numero methodsFor: 'accessing'!
est31SubstractingFraccionesCanReturnAnEntero stamp: 'chiara 5/8/2022 20:15:29'! !

!Numero methodsFor: 'accessing'!
33SubstractingSameFraccionesReturnsZero stamp: 'chiara 5/8/2022 20:15:29'! !

!Numero methodsFor: 'accessing'!
umeroTest #test34SubstractingAHigherValueToANumberReturnsANegativeNumber stamp: 'chiara 5/8/2022 20:15:29'! !


!Numero methodsFor: 'printing'!
tamp: 'chiara 5/8/2022 20:30:15' prior: 50484186 overrides: 50483244! !


!Numero methodsFor: 'comparing'!
28:42' prior: 50485231! !

!Numero methodsFor: 'comparing'!
iara 5/8/2022 20:28:16' prior: 50485502 overrides: 50485226! !


!Numero methodsFor: 'arithmetic operations - private'!
! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:24:44'!
beAddedToAFraction: aFractionAugend
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 20:05:51'!
beAddedToAnEntero: anEnteroAugend
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:24:53'!
beMultipliedByAFraction: aFractionMultiplicand
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 20:43:59'!
beMultipliedByAnEntero: anEnteroMultiplicand
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:28:42'!
beSubtractedFromAFraction: aFractionMinuend
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:28:48'!
beSubtractedFromAnEntero: anEnteroMinuend
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:25:48'!
divideAFraction: aFractionDividend
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 20:58:33'!
divideAnEntero: anEnteroDividend
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 19:04:19'!
greatestCommonDivisorWith: anEntero
	type = #Entero ifTrue:
		[^self class with: (value gcd: anEntero integerValue)].
	self error: 'Tipo de número no soportado'.! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!Numero class methodsFor: 'instance creation'!
'! !

!Numero class methodsFor: 'instance creation'!
8/2022 20:32:31'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'chiara 5/8/2022 20:22:59'!
* aMultiplier 
	^aMultiplier beMultipliedByAnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'chiara 5/8/2022 20:20:28'!
+ anAdder 	
	 ^anAdder beAddedToAnEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'chiara 5/8/2022 20:16:32'!
- aSubtrahend
    ^ aSubtrahend beSubtractedFromAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'chiara 5/8/2022 20:23:14'!
/ aDivisor 
	^aDivisor divideAnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:47:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

!Entero methodsFor: 'arithmetic operations'!
! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:22:17'!
beAddedToAFraction: aFractionAugend
	^self * aFractionAugend denominator + aFractionAugend numerator / aFractionAugend denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 20:42:07'!
beAddedToAnEntero: anEnteroAugend
	^self class with: self integerValue + anEnteroAugend integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:23:47'!
beMultipliedByAFraction: aFractionMultiplicand
	^(self * aFractionMultiplicand numerator) / aFractionMultiplicand denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 20:37:14'!
beMultipliedByAnEntero: anEnteroMultiplicand
	^self class with: value * anEnteroMultiplicand integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:27:31'!
beSubtractedFromAFraction: aFractionMinuend
    ^ aFractionMinuend numerator - (self * aFractionMinuend denominator) / aFractionMinuend denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:27:57'!
beSubtractedFromAnEntero: anEnteroMinuend
    ^ self class with: anEnteroMinuend integerValue - value.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 21:06:14'!
divideAFraction: aFractionDividend
	^Fraccion with: (aFractionDividend numerator) over: (aFractionDividend denominator * self).! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 21:16:16'!
divideAnEntero: anEnteroDividend
	^Fraccion with: anEnteroDividend over: self.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'JS 5/5/2022 03:55:37'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initializeWith: aValue! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'chiara 5/8/2022 20:30:15'!
* aMultiplier 
	^aMultiplier beMultipliedByAFraction: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'chiara 5/8/2022 20:30:00'!
+ anAdder 
	^anAdder beAddedToAFraction: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'chiara 5/8/2022 20:16:12'!
- aSubtrahend
    ^ aSubtrahend beSubtractedFromAFraction: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'chiara 5/8/2022 20:30:08'!
/ aDivisor 
	^aDivisor divideAFraction: self.! !

!Fraccion methodsFor: 'arithmetic operations'!
! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 19:07:55'!
// aDivisor
	self error: 'Tipo de número no soportado'.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:22:40'!
beAddedToAFraction: aFractionAugend
	| newNumerator newDenominator |
	
	newNumerator := (numerator * aFractionAugend denominator) + (denominator * aFractionAugend numerator).
	newDenominator := denominator * aFractionAugend denominator.
	
	^newNumerator / newDenominator
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 20:05:28'!
beAddedToAnEntero: anEnteroAugend
	^anEnteroAugend * self denominator + self numerator / self denominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:24:07'!
beMultipliedByAFraction: aFractionMultiplicand
	^(numerator * aFractionMultiplicand numerator) / (denominator * aFractionMultiplicand denominator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 20:39:04'!
beMultipliedByAnEntero: anEnteroMultiplicand
	^(anEnteroMultiplicand * self numerator) / self denominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:15:21'!
beSubtractedFromAFraction: aFractionMinuend
    | newNumerator newDenominator |
    newNumerator _ aFractionMinuend numerator * denominator - (aFractionMinuend denominator * numerator).
    newDenominator _ aFractionMinuend denominator * denominator .
    ^ newNumerator / newDenominator .! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:28:16'!
beSubtractedFromAnEntero: anEnteroMinuend
    ^ anEnteroMinuend * self denominator - self numerator / self denominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/8/2022 20:25:29'!
divideAFraction: aFractionDividend
	^(aFractionDividend numerator * self denominator) / (aFractionDividend denominator * self numerator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'chiara 5/5/2022 21:17:02'!
divideAnEntero: anEnteroDividend
	| newNumerator |
	
	newNumerator := anEnteroDividend * self denominator.
	
	^newNumerator / self numerator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
