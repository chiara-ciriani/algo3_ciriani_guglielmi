!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'chiara 5/15/2022 23:03:30'!
test11CanNotPushWhenALimitedStackIsFull
	| aLimitedStack pushWhenStackIsFull |
	
	aLimitedStack := OOStack withCapacity: 1.
	
	aLimitedStack push: 'element'.
	pushWhenStackIsFull := [ aLimitedStack push: 'element2' ].
	
	self should: pushWhenStackIsFull 
		raise: Error
		description: [aLimitedStack signalStackFullError ].! !

!OOStackTest methodsFor: 'test' stamp: 'chiara 5/15/2022 22:59:48'!
test12PopFromLimitedStackAltersSizeButNotCapacity
	| aLimitedStack  |
	
	aLimitedStack := OOStack withCapacity: 3.
	
	aLimitedStack push: 'element'.
	aLimitedStack push: 'element 2'.
	self assert: (aLimitedStack size = 2 and: aLimitedStack capacity = 3).
	
	aLimitedStack pop.
	
	self assert: (aLimitedStack size = 1 and: aLimitedStack capacity = 3).! !

!OOStackTest methodsFor: 'test' stamp: 'chiara 5/15/2022 23:07:54'!
test13CanNotPushIntoLimitedStackWithZeroCapacity
	| aLimitedStack pushWhenStackIsFull |
	
	aLimitedStack := OOStack withCapacity: 0.
	
	pushWhenStackIsFull :=  [aLimitedStack push: 'element'].
	
	self should: pushWhenStackIsFull 
		raise: Error
		description: [aLimitedStack signalStackFullError ].
	! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'storedSentencesStack sentenceFinderByPrefix prefixToFind'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'chiara 5/15/2022 13:28:10'!
pushDefaultSentencesInto: aStack
	| sentencesCollection |
	sentencesCollection := OrderedCollection with: 'winter is coming' with: 'winning is everything' with: 'Winter is here'.
	sentencesCollection do: [:aSentence | aStack push: aSentence].! !

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'chiara 5/15/2022 12:37:12'!
setUp
	storedSentencesStack := OOStack new.
	sentenceFinderByPrefix := SentenceFinderByPrefix new initializeWith: storedSentencesStack.
	prefixToFind := 'Wint'! !


!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'chiara 5/15/2022 13:39:12'!
assertThat: aStack isEqualTo: otherStack
	self assert: aStack size = otherStack size.
	
	[ aStack isEmpty not ] whileTrue: [ self assert: aStack pop = otherStack pop].! !


!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'chiara 5/15/2022 12:50:49'!
test01findsNoSentencesWhenStackIsEmpty
	| sentencesFoundByPrefix|

	sentencesFoundByPrefix := sentenceFinderByPrefix find: prefixToFind.
	
	self assert: (sentencesFoundByPrefix isEmpty)
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'chiara 5/15/2022 12:38:35'!
test02findsCorrectSentenceWhenStackOnlyHasOneSentence
	| sentencesFoundByPrefix|

	storedSentencesStack push: 'Winter is here'.
	sentencesFoundByPrefix := sentenceFinderByPrefix find: prefixToFind.
	
	self assert: ((sentencesFoundByPrefix at:1)= 'Winter is here')
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'chiara 5/15/2022 22:54:45'!
test03findsCorrectSentencesWhenStackHasMoreThanOneSentence
	| sentencesFoundByPrefix|

	storedSentencesStack push: 'Winter is here'.
	storedSentencesStack push: 'Winter is not here'.
	sentencesFoundByPrefix := sentenceFinderByPrefix find: prefixToFind.
	
	self assert: ( (sentencesFoundByPrefix allSatisfy: [:aSentence | aSentence beginsWith: prefixToFind ])
		and: sentencesFoundByPrefix size = 2
	)
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'chiara 5/15/2022 13:44:39'!
test04findsTheOnlyCorrectSentenceWhenStackHasMoreThanOneSentence
	| sentencesFoundByPrefix |
	
	self pushDefaultSentencesInto: storedSentencesStack.
	sentencesFoundByPrefix := sentenceFinderByPrefix find: prefixToFind.
	
	self assert: ( (sentencesFoundByPrefix allSatisfy: [:aSentence | aSentence beginsWith: prefixToFind ])
		and: sentencesFoundByPrefix size = 1
	)! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'chiara 5/15/2022 22:53:19'!
test05findsNoSentencesWhenPrefixDoesNotMatch
	| sentencesFoundByPrefix |
	
	storedSentencesStack push: 'I love Winter'.
	sentencesFoundByPrefix := sentenceFinderByPrefix find: prefixToFind.
	
	self assert: (sentencesFoundByPrefix isEmpty).! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'chiara 5/15/2022 22:53:31'!
test06finderByPrefixIsCaseSensitive
	| sentencesFoundByPrefix|

	storedSentencesStack push: 'winter is here'.
	sentencesFoundByPrefix := sentenceFinderByPrefix find: prefixToFind.
	
	self assert: (sentencesFoundByPrefix isEmpty)! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'chiara 5/15/2022 22:53:50'!
test07prefixShouldNotBeEmpty
	| findInvalidPrefix |

	findInvalidPrefix := [sentenceFinderByPrefix find: ''].
	
	self should: findInvalidPrefix 
		raise: Error
		description: [sentenceFinderByPrefix signalInvalidEmptyPrefixError]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'chiara 5/15/2022 22:53:55'!
test08prefixShouldNotHaveSpaces
	| findInvalidPrefix |

	findInvalidPrefix := [sentenceFinderByPrefix find: 'Winter is'].
	
	self should: findInvalidPrefix 
		raise: Error
		description: [sentenceFinderByPrefix signalInvalidPrefixWithSpacesError ]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'chiara 5/15/2022 22:54:00'!
test09StackIsNotModifiedAfterUsingSentenceFinder
	| copyOfOriginalStack |
	
	copyOfOriginalStack := OOStack new.
	self pushDefaultSentencesInto: storedSentencesStack.
	self pushDefaultSentencesInto: copyOfOriginalStack.
	
	sentenceFinderByPrefix find: prefixToFind.
	
	self assertThat: copyOfOriginalStack isEqualTo: storedSentencesStack.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contents stackCapacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:34:34'!
capacity
	^stackCapacity.! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/12/2022 19:29:09'!
isEmpty
	^contents isEmpty.! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:04:30'!
pop
	^self status pop.! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/15/2022 10:58:27'!
popWhenStackIsEmpty
	^self signalStackEmptyError.! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/12/2022 20:00:50'!
popWhenStackIsNotEmpty
	^contents removeLast.! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:11:44'!
push: anElementToBePushed
	^self status push: anElementToBePushed.
	! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:20:55'!
pushWhenStackIsFull
	^self signalStackFullError.! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:17:33'!
pushWhenStackIsNotFull: anElementToBePushed
	contents addLast: anElementToBePushed.! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/12/2022 19:29:23'!
size
	^contents size.! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/15/2022 14:42:49'!
status
	^OOStackStatus associateTo: self.
	! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/15/2022 10:57:58'!
top
	^self status top.! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/15/2022 10:58:37'!
topWhenStackIsEmpty
	^self signalStackEmptyError.
	! !

!OOStack methodsFor: 'stack management' stamp: 'chiara 5/12/2022 20:04:43'!
topWhenStackIsNotEmpty
	^contents last.
	! !


!OOStack methodsFor: 'initialization' stamp: 'chiara 5/12/2022 21:01:51'!
initialize
	contents := OrderedCollection new.! !

!OOStack methodsFor: 'initialization' stamp: 'chiara 5/15/2022 22:31:08'!
initializeWith: aCapacity
	stackCapacity := aCapacity.! !


!OOStack methodsFor: 'signals' stamp: 'chiara 5/12/2022 16:25:27'!
signalStackEmptyError

	self error: self class stackEmptyErrorDescription ! !

!OOStack methodsFor: 'signals' stamp: 'chiara 5/15/2022 22:20:16'!
signalStackFullError

	self error: self class stackFullErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'chiara 5/15/2022 22:19:55'!
stackFullErrorDescription

	^'Stack is full'! !


!OOStack class methodsFor: 'instance creation' stamp: 'chiara 5/15/2022 22:30:37'!
withCapacity: aNumber
	^self new initializeWith: aNumber.
! !


!classDefinition: #OOStackStatus category: 'Stack-Exercise'!
Object subclass: #OOStackStatus
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStatus methodsFor: 'initialization' stamp: 'chiara 5/15/2022 10:44:15'!
initializeWith: aStack
	stack := aStack.! !


!OOStackStatus methodsFor: 'stack management' stamp: 'chiara 5/12/2022 20:02:31'!
pop
	self subclassResponsibility.! !

!OOStackStatus methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:05:15'!
push: anElementToBePushed
	self subclassResponsibility.! !

!OOStackStatus methodsFor: 'stack management' stamp: 'chiara 5/12/2022 20:05:04'!
top
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStatus class' category: 'Stack-Exercise'!
OOStackStatus class
	instanceVariableNames: ''!

!OOStackStatus class methodsFor: 'initialization' stamp: 'chiara 5/15/2022 22:41:44'!
associateTo: aStack
	| subclass |

	subclass := OOStackStatus subclasses detect: [:aSubclass | aSubclass canInstantiateWith: aStack].
	^subclass new initializeWith: aStack.
! !


!classDefinition: #OOStackEmptyStatus category: 'Stack-Exercise'!
OOStackStatus subclass: #OOStackEmptyStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmptyStatus methodsFor: 'stack management' stamp: 'chiara 5/15/2022 10:59:13'!
pop
	^stack popWhenStackIsEmpty.! !

!OOStackEmptyStatus methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:21:39'!
push: anElementToBePushed
	stack pushWhenStackIsNotFull: anElementToBePushed.! !

!OOStackEmptyStatus methodsFor: 'stack management' stamp: 'chiara 5/15/2022 10:59:17'!
top
	^stack topWhenStackIsEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackEmptyStatus class' category: 'Stack-Exercise'!
OOStackEmptyStatus class
	instanceVariableNames: ''!

!OOStackEmptyStatus class methodsFor: 'stack management' stamp: 'chiara 5/15/2022 23:07:08'!
canInstantiateWith: aStack
	^aStack isEmpty and: aStack size ~= aStack capacity.
! !


!classDefinition: #OOStackFullStatus category: 'Stack-Exercise'!
OOStackStatus subclass: #OOStackFullStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackFullStatus methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:13:33'!
pop
	^stack popWhenStackIsNotEmpty.! !

!OOStackFullStatus methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:21:59'!
push: anElementToBePushed
	stack pushWhenStackIsFull.! !

!OOStackFullStatus methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:13:52'!
top
	^stack topWhenStackIsNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackFullStatus class' category: 'Stack-Exercise'!
OOStackFullStatus class
	instanceVariableNames: ''!

!OOStackFullStatus class methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:40:56'!
canInstantiateWith: aStack
	^aStack size = aStack capacity.! !


!classDefinition: #OOStackNotEmptyStatus category: 'Stack-Exercise'!
OOStackStatus subclass: #OOStackNotEmptyStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmptyStatus methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:13:21'!
pop
	^stack popWhenStackIsNotEmpty.! !

!OOStackNotEmptyStatus methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:21:48'!
push: anElementToBePushed
	stack pushWhenStackIsNotFull: anElementToBePushed.! !

!OOStackNotEmptyStatus methodsFor: 'stack management' stamp: 'chiara 5/15/2022 22:13:41'!
top
	^stack topWhenStackIsNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmptyStatus class' category: 'Stack-Exercise'!
OOStackNotEmptyStatus class
	instanceVariableNames: ''!

!OOStackNotEmptyStatus class methodsFor: 'stack management' stamp: 'chiara 5/15/2022 23:06:57'!
canInstantiateWith: aStack
	^aStack isEmpty not and: aStack size ~= aStack capacity.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'storedSentencesStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'signals' stamp: 'chiara 5/15/2022 13:06:28'!
signalInvalidEmptyPrefixError
	self error: self class invalidEmptyPrefixErrorMessage.
! !

!SentenceFinderByPrefix methodsFor: 'signals' stamp: 'chiara 5/15/2022 13:09:10'!
signalInvalidPrefixWithSpacesError
	self error: self class invalidPrefixWithSpacesErrorMessage 
! !


!SentenceFinderByPrefix methodsFor: 'find' stamp: 'chiara 5/15/2022 14:28:53'!
find: aPrefix
	| sentencesFoundByPrefix auxiliarStack |
	self isValidPrefix: aPrefix.
	
	sentencesFoundByPrefix := OrderedCollection  new.
	auxiliarStack := OOStack new.
	
	self while: storedSentencesStack isNotEmptydo: [self copyTo: auxiliarStack andStoreIn: sentencesFoundByPrefix filteringBy: aPrefix ]. 
	
	self restoreOriginalStackFrom: auxiliarStack.
	
	^ sentencesFoundByPrefix.
	
	
! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'chiara 5/15/2022 14:24:58'!
checkAndStoreIn: sentencesFound if: aPoppedSentence beginsWith: aPrefix
	
	(aPoppedSentence beginsWith: aPrefix) ifTrue: [ sentencesFound add: aPoppedSentence ].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'chiara 5/15/2022 14:25:34'!
copyTo: anAuxiliarStack andStoreIn: sentencesFound filteringBy: aPrefix
	|sentencePopped|
	sentencePopped := storedSentencesStack pop.
		
	self checkAndStoreIn: sentencesFound if: sentencePopped beginsWith: aPrefix.
		
	anAuxiliarStack push: sentencePopped.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'chiara 5/15/2022 13:02:18'!
isValidPrefix: aPrefix
	self assertThatPrefixIsNotEmpty: aPrefix.
	self assertThatPrefixHasNoSpaces: aPrefix.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'chiara 5/15/2022 14:28:39'!
restoreOriginalStackFrom: anAuxiliarStack
	self while: anAuxiliarStack isNotEmptydo: [storedSentencesStack push: anAuxiliarStack pop].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'chiara 5/15/2022 14:15:52'!
while: aStack isNotEmptydo: anActionBlock
	
	[aStack isEmpty not] whileTrue: anActionBlock.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'chiara 5/15/2022 14:17:28'!
initializeWith: aStack
	storedSentencesStack  := aStack.! !


!SentenceFinderByPrefix methodsFor: 'assertions' stamp: 'chiara 5/15/2022 13:10:40'!
assertThatPrefixHasNoSpaces: aPrefix
	(aPrefix includesSubString: ' ') ifTrue: [ self signalInvalidPrefixWithSpacesError ].! !

!SentenceFinderByPrefix methodsFor: 'assertions' stamp: 'chiara 5/15/2022 13:09:42'!
assertThatPrefixIsNotEmpty: aPrefix
	(aPrefix isEmpty) ifTrue: [ self signalInvalidEmptyPrefixError ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'chiara 5/15/2022 13:06:53'!
invalidEmptyPrefixErrorMessage
	^'Empty prefix is invalid'.! !

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'chiara 5/15/2022 13:07:48'!
invalidPrefixWithSpacesErrorMessage
	^'A prefix with spaces is invalid'.! !
