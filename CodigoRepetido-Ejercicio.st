!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook johnLennon paulMcCartney'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'NG 5/1/2022 19:51:13'!
setUp
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.	
	paulMcCartney := 'Paul McCartney'.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NG 5/1/2022 19:43:24'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	| actionAddCustomer |
	
	actionAddCustomer := [customerBook addCustomerNamed: johnLennon.].
	
	self 
		validateThatDoing: actionAddCustomer
		shouldNotTakeMoreThan: 50.
	
	
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NG 5/1/2022 19:32:21'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	
	| actionRemoveCustomer|
	
	customerBook addCustomerNamed: paulMcCartney.
	
	actionRemoveCustomer := [customerBook removeCustomerNamed: paulMcCartney ].
	
	self 
		validateThatDoing: actionRemoveCustomer 
		shouldNotTakeMoreThan: 100.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NG 5/1/2022 19:54:10'!
test03CanNotAddACustomerWithEmptyName 

	| actionAddCustomerWithEmptyName expectedAssertions |
		
	actionAddCustomerWithEmptyName := [customerBook addCustomerNamed: ''].
	
	expectedAssertions := [:anError | self validateAddingCustomerWithEmptyNameInACustomerBookRaisesError: anError].
	
	self 
		validateThatCanNotDo: actionAddCustomerWithEmptyName 
		becauseItRaises: Error 
		andChecks: expectedAssertions.
	
	
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NG 5/1/2022 20:44:01'!
test04CanNotRemoveAnInvalidCustomer
	
	| actionRemoveAnInvalidCustomer expectedAssertions|
			
	customerBook addCustomerNamed: johnLennon.
	
	actionRemoveAnInvalidCustomer := [customerBook removeCustomerNamed: paulMcCartney ].
	
	expectedAssertions := [:anError | self validateThatACustomerBookOnlyIncludesJohnLennon ].
	
	self 
		validateThatCanNotDo: actionRemoveAnInvalidCustomer 
		becauseItRaises: NotFound 
		andChecks: expectedAssertions.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NG 5/1/2022 19:58:00'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self 
		validateThatNumberOfTotalCustomersIsCorrectWhenActiveIs: 0 
		andSuspendedIs: 1. 
	self 
		assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NG 5/1/2022 19:59:02'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self 
		validateThatNumberOfTotalCustomersIsCorrectWhenActiveIs: 0 
		andSuspendedIs: 0. 
	self 
		deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NG 5/1/2022 20:44:10'!
test07CanNotSuspendAnInvalidCustomer
	
	| actionSuspendCustomer expectedAssertions |
			
	customerBook addCustomerNamed: johnLennon.
	
	actionSuspendCustomer := [customerBook suspendCustomerNamed: 'Ringo Starr'].
	
	expectedAssertions := [ :anError | self validateThatACustomerBookOnlyIncludesJohnLennon ].
	
	self 
		validateThatCanNotDo: actionSuspendCustomer 
		becauseItRaises: CantSuspend 
		andChecks: expectedAssertions.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NG 5/1/2022 20:44:15'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| actionSuspendCustomer expectedAssertions|
	
	customerBook addCustomerNamed: johnLennon.
	actionSuspendCustomer := [customerBook suspendCustomerNamed: johnLennon].
	actionSuspendCustomer value.
	
	expectedAssertions :=	 [:anError | self validateThatACustomerBookOnlyIncludesJohnLennon ].
	
	self 
		validateThatCanNotDo: actionSuspendCustomer 
		becauseItRaises: CantSuspend 
		andChecks: expectedAssertions.
! !


!CustomerBookTest methodsFor: 'validations' stamp: 'NG 5/1/2022 20:42:49'!
validateAddingCustomerWithEmptyNameInACustomerBookRaisesError: anError

	self assert: anError messageText = customerBook class customerCanNotBeEmptyErrorMessage.
	self assert: customerBook isEmpty! !

!CustomerBookTest methodsFor: 'validations' stamp: 'NG 5/1/2022 19:55:28'!
validateThatACustomerBookOnlyIncludesJohnLennon

	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: johnLennon)! !

!CustomerBookTest methodsFor: 'validations' stamp: 'NG 5/1/2022 21:04:37'!
validateThatCanNotDo: aBlock becauseItRaises: anExceptionType andChecks: expectedAssertionsBlock
	
	[ aBlock value.
	self fail ]
		on: anExceptionType 
		do: [ :anError | expectedAssertionsBlock value: anError].
		
		
	
		
		! !

!CustomerBookTest methodsFor: 'validations' stamp: 'NG 5/1/2022 19:44:46'!
validateThatDoing: aBlock shouldNotTakeMoreThan: aNumberOfMilliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aNumberOfMilliseconds * millisecond)
	
	! !

!CustomerBookTest methodsFor: 'validations' stamp: 'NG 5/1/2022 19:40:53'!
validateThatNumberOfTotalCustomersIsCorrectWhenActiveIs: aNumberOfActiveCustomers andSuspendedIs: aNumberOfSuspendedCustomers

	self assert: aNumberOfActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: aNumberOfSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: aNumberOfActiveCustomers + aNumberOfSuspendedCustomers equals: customerBook numberOfCustomers.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NG 4/30/2022 17:01:10'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NG 4/30/2022 17:02:55'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NG 4/30/2022 17:11:41'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^NotFound signal]].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NG 5/1/2022 20:34:18'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'signals' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signals' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
