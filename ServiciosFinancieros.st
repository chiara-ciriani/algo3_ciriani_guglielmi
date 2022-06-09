!classDefinition: #PortfolioAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 15:53:09'!
test01EmptyPortfolioHasZeroAsBalance
	| portfolio |
	
	portfolio := PortfolioAccount including: OrderedCollection new.
		
	self assert: 0 * peso equals: portfolio balance.

	

	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 15:54:44'!
test02PortfolioWithOneReceptiveAccountKnowsItsBalance
	| aGroupOfAccounts aReceptiveAccount portfolio |
	
	aReceptiveAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: aReceptiveAccount.
	
	aGroupOfAccounts := OrderedCollection with: aReceptiveAccount.
	
	portfolio := PortfolioAccount including: aGroupOfAccounts.
		
	self assert: 100 * peso equals: portfolio balance.

	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 15:54:33'!
test03PortfolioWithManyReceptiveAccountsKnowsItsBalance
	| aGroupOfAccounts aReceptiveAccount aReceptiveAccountTwo aReceptiveAccountThree portfolio |
	
	aReceptiveAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: aReceptiveAccount.
	
	aReceptiveAccountTwo := ReceptiveAccount new.
	Deposit register: 50 * peso on: aReceptiveAccount.
	
	aReceptiveAccountThree := ReceptiveAccount new.
	
	aGroupOfAccounts := OrderedCollection with: aReceptiveAccount with: aReceptiveAccountTwo with: aReceptiveAccountThree.
	
	portfolio := PortfolioAccount including: aGroupOfAccounts.
		
	self assert: 150 * peso equals: portfolio balance.

	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 15:54:22'!
test04PortfolioWithPortfolioAndReceptiveAccountKnowsItsBalance
	| aGroupOfAccounts aReceptiveAccount aReceptiveAccountTwo aPortfolio portfolioToBeTested |
	
	aReceptiveAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: aReceptiveAccount.
	
	aReceptiveAccountTwo := ReceptiveAccount new.
	Deposit register: 50 * peso on: aReceptiveAccount.

	aGroupOfAccounts := OrderedCollection with: aReceptiveAccount.
	aPortfolio := PortfolioAccount including: aGroupOfAccounts.
	
	portfolioToBeTested := PortfolioAccount including: (OrderedCollection with: aPortfolio with: aReceptiveAccountTwo). 
		
	self assert: 150 * peso equals: portfolioToBeTested balance.

	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 16:02:45'!
test05PortfolioKnowsIfAReceptiveAccountTransactionIsRegistered
	| aGroupOfAccounts aReceptiveAccount aPortfolio depositTransaction |
	
	aReceptiveAccount := ReceptiveAccount new.
	depositTransaction := Deposit register: 100 * peso on: aReceptiveAccount.
	
	aGroupOfAccounts := OrderedCollection with: aReceptiveAccount.
	aPortfolio := PortfolioAccount including: aGroupOfAccounts.
		
	self assert: (aPortfolio hasRegistered: depositTransaction).

	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 16:03:43'!
test06PortfolioKnowsIfAReceptiveAccountInPortfolioTransactionIsRegistered
	| aGroupOfAccounts aReceptiveAccount aReceptiveAccountTwo aPortfolio aPortfolioToBeTested depositTransaction |
	
	aReceptiveAccount := ReceptiveAccount new.
	depositTransaction := Deposit register: 100 * peso on: aReceptiveAccount.
	
	aGroupOfAccounts := OrderedCollection with: aReceptiveAccount.
	aPortfolio := PortfolioAccount including: aGroupOfAccounts.
	
	aReceptiveAccountTwo  := ReceptiveAccount new.
	
	aPortfolioToBeTested := PortfolioAccount including: (OrderedCollection with: aPortfolio with: aReceptiveAccountTwo).
		
	self assert: (aPortfolioToBeTested hasRegistered: depositTransaction).

	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 16:02:03'!
test07PortfolioKnowsItsReceptiveAccountsTransactions
	| aReceptiveAccount aPortfolio depositTransaction |
	
	aReceptiveAccount := ReceptiveAccount new.
	depositTransaction := Deposit register: 100 * peso on: aReceptiveAccount.
	
	aPortfolio := PortfolioAccount including: (OrderedCollection with: aReceptiveAccount).
		
	self assert: (aPortfolio transactions) size equals: 1.
	self assert: ((aPortfolio transactions) first) equals: depositTransaction.
	

	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 16:04:29'!
test08PortfolioKnowsItsReceptiveAndPortfolioAccountsTransactions
	| aGroupOfAccounts aReceptiveAccount aReceptiveAccountTwo aPortfolio aPortfolioToBeTested depositTransaction |
	
	aReceptiveAccount := ReceptiveAccount new.
	depositTransaction := Deposit register: 100 * peso on: aReceptiveAccount.
	
	aGroupOfAccounts := OrderedCollection with: aReceptiveAccount.
	aPortfolio := PortfolioAccount including: aGroupOfAccounts.
	
	aReceptiveAccountTwo  := ReceptiveAccount new.
	
	aPortfolioToBeTested := PortfolioAccount including: (OrderedCollection with: aPortfolio with: aReceptiveAccountTwo).
		
	self assert: (aPortfolioToBeTested transactions) size equals: 1.
	self assert: ((aPortfolioToBeTested transactions) first) equals: depositTransaction.

	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 16:04:49'!
test09PortfolioCannotAddSameAccountTwice
	| aGroupOfAccounts aReceptiveAccount |
	
	aReceptiveAccount := ReceptiveAccount new.
	aGroupOfAccounts := OrderedCollection with: aReceptiveAccount with: aReceptiveAccount.

	self
		should: [ PortfolioAccount including: aGroupOfAccounts.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = PortfolioAccount repeatedAccountsErrorDescription ].
	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 16:05:16'!
test10PortfolioCannotAddAlreadyIncludedInPortfolio
	| aGroupOfAccounts aReceptiveAccount aPortfolio |
	
	aReceptiveAccount := ReceptiveAccount new.
	aGroupOfAccounts := OrderedCollection with: aReceptiveAccount.
	aPortfolio := PortfolioAccount including: aGroupOfAccounts.

	self
		should: [ PortfolioAccount including: (OrderedCollection with: aPortfolio with: aReceptiveAccount ) ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = PortfolioAccount repeatedAccountsErrorDescription ].
	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 16:11:42'!
test11PortfolioCannotAddItself
	| aPortfolio |
	
	aPortfolio := PortfolioAccount including: OrderedCollection new.

	self
		should: [ aPortfolio addAnAccount: aPortfolio ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = PortfolioAccount portfolioIncludingItselfErrorDescription ].
	
	
	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 16:06:25'!
test12PortfolioCannotAddAnAccountWhenItsParentAlreadyHasIt
	| aGroupOfAccounts aReceptiveAccount aPortfolioParent aPortfolioToBeTested|
	
	aReceptiveAccount := ReceptiveAccount new.
	aGroupOfAccounts := OrderedCollection with: aReceptiveAccount.
	aPortfolioParent := PortfolioAccount including: aGroupOfAccounts.

	aPortfolioToBeTested  := PortfolioAccount including: OrderedCollection new.
	aPortfolioParent addAnAccount: aPortfolioToBeTested. 
	
	self
		should: [ aPortfolioToBeTested addAnAccount: aReceptiveAccount ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = PortfolioAccount repeatedAccountsErrorDescription ].
	
	! !

!PortfolioAccountTest methodsFor: 'tests' stamp: 'chiara 6/9/2022 16:07:20'!
test13PortfolioCannotAddPortfolioWithAnAlreadyIncludedAccountAsChild
	| aGroupOfAccounts aReceptiveAccount aPortfolioParent aPortfolioToBeTested|
	
	aReceptiveAccount := ReceptiveAccount new.
	aGroupOfAccounts := OrderedCollection with: aReceptiveAccount.
	aPortfolioParent := PortfolioAccount including: aGroupOfAccounts.
	

	aPortfolioToBeTested  := PortfolioAccount including: aGroupOfAccounts.
	
	self
		should: [ aPortfolioParent addAnAccount: aPortfolioToBeTested ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = PortfolioAccount repeatedAccountsErrorDescription ].
	
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'chiara 6/6/2022 20:35:23'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'chiara 6/6/2022 11:00:54'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'chiara 6/6/2022 21:34:15'!
test01TransferAffectsBalanceCorrectlyOnBothReceptiveAccounts

	| receiverAccount senderAccount |
	
	receiverAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount .
		
	Transfer from: senderAccount to: receiverAccount anAmountOf: 50 * peso.
	
	self assert: 50 * peso equals: receiverAccount balance.
	self assert: 0 * peso equals: senderAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'chiara 6/8/2022 10:31:02'!
test02TransferKnowsTransactionValue

	| receiverAccount senderAccount transfer |
	
	receiverAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount .
		
	transfer := Transfer from: senderAccount to: receiverAccount anAmountOf: 50 * peso.
	
	self assert: 50 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'chiara 6/8/2022 10:41:59'!
test03EachPartOfTheTransferKnowsItsCounterpart

	| receiverAccount senderAccount transfer |
	
	receiverAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: senderAccount .
		
	transfer := Transfer from: senderAccount to: receiverAccount anAmountOf: 50 * peso.
	
	self assert: transfer withdrawal counterpart equals: transfer deposit.
	self assert: transfer deposit counterpart equals: transfer withdrawal.! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 21:19:25'!
balance
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 21:19:44'!
hasRegistered: aTransaction
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 21:19:54'!
transactions
	self subclassResponsibility.! !


!Account methodsFor: 'hierarchy' stamp: 'chiara 6/9/2022 16:34:05'!
isEqualOrHasIncludedAnAccountOf: anAccountAndItsComponents
	self subclassResponsibility.! !

!Account methodsFor: 'hierarchy' stamp: 'chiara 6/8/2022 23:24:29'!
itselfAndItsAccounts
 	| aCollectionOfAccounts |
	
	aCollectionOfAccounts := OrderedCollection new.
	self addItselfAndItsAccountsTo: aCollectionOfAccounts.
	^aCollectionOfAccounts.! !


!Account methodsFor: 'errors' stamp: 'chiara 6/8/2022 12:23:55'!
repeatedAccountsSignalError 
	self error: self class repeatedAccountsErrorDescription. ! !


!classDefinition: #PortfolioAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #PortfolioAccount
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioAccount methodsFor: 'initialization' stamp: 'chiara 6/8/2022 22:50:06'!
initializeWith: aGroupOfAccounts
	parents := OrderedCollection new.
	accounts := OrderedCollection new.
	aGroupOfAccounts do: [:anAccount | self addAnAccount: anAccount].! !


!PortfolioAccount methodsFor: 'main protocol' stamp: 'chiara 6/8/2022 23:38:30'!
addAnAccount: anAccount
	self assertThatAccountToBeAddedIsNotItself: anAccount.
	self assertThatCanAdd: anAccount.
	accounts add: anAccount.
	(anAccount isKindOf: PortfolioAccount) ifTrue: [anAccount assignParent: self].! !

!PortfolioAccount methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 20:32:19'!
balance
	^accounts sum: [:anAccount | anAccount balance ] ifEmpty: [^0].
	! !

!PortfolioAccount methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 21:34:46'!
hasRegistered: aTransaction
	accounts detect: [:anAccount | anAccount hasRegistered: aTransaction ]
		ifFound: [:accountWithTransaction| ^true]
		ifNone: [^false].
! !

!PortfolioAccount methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 21:37:40'!
transactions
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | transactions addAll: (anAccount transactions)].
	^ transactions.! !


!PortfolioAccount methodsFor: 'hierarchy' stamp: 'chiara 6/8/2022 23:18:34'!
addItselfAndItsAccountsTo: aCollectionOfAccounts
	accounts do: [:anAccount | anAccount addItselfAndItsAccountsTo: aCollectionOfAccounts].! !

!PortfolioAccount methodsFor: 'hierarchy' stamp: 'chiara 6/8/2022 22:38:30'!
addRootPortfoliosTo: rootPortfolios
	(parents isEmpty) 
		ifTrue: [rootPortfolios add: self]
		ifFalse: [ parents do: [:aParentPortfolio | aParentPortfolio addRootPortfoliosTo: rootPortfolios ]].! !

!PortfolioAccount methodsFor: 'hierarchy' stamp: 'chiara 6/8/2022 22:14:35'!
assignParent: aPortfolioParent
	parents add: aPortfolioParent.! !

!PortfolioAccount methodsFor: 'hierarchy' stamp: 'chiara 6/8/2022 22:46:37'!
getPortfolioRoots
	| rootPortfolios |
	
	rootPortfolios := OrderedCollection new.
	self addRootPortfoliosTo: rootPortfolios.
	^rootPortfolios.! !

!PortfolioAccount methodsFor: 'hierarchy' stamp: 'chiara 6/9/2022 16:33:16'!
isEqualOrHasIncludedAnAccountOf: anAccountAndItsComponents
	^accounts anySatisfy: [:anAccountInPortfolio | anAccountInPortfolio isEqualOrHasIncludedAnAccountOf: anAccountAndItsComponents] ! !


!PortfolioAccount methodsFor: 'errors' stamp: 'chiara 6/8/2022 13:15:22'!
portfolioIncudingItselfSignalError 
	self error: self class portfolioIncludingItselfErrorDescription.! !


!PortfolioAccount methodsFor: 'assertions' stamp: 'chiara 6/8/2022 13:15:48'!
assertThatAccountToBeAddedIsNotItself: anAccount
	(self = anAccount) ifTrue: [self portfolioIncudingItselfSignalError ].! !

!PortfolioAccount methodsFor: 'assertions' stamp: 'chiara 6/9/2022 16:33:16'!
assertThatCanAdd: anAccount
	((self getPortfolioRoots) anySatisfy: [:aRootPortfolio | aRootPortfolio isEqualOrHasIncludedAnAccountOf: (anAccount itselfAndItsAccounts)]) ifTrue: [self repeatedAccountsSignalError ].
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioAccount class' category: 'ServiciosFinancieros-Ejercicio'!
PortfolioAccount class
	instanceVariableNames: ''!

!PortfolioAccount class methodsFor: 'error descriptions' stamp: 'chiara 6/8/2022 13:14:55'!
portfolioIncludingItselfErrorDescription
	^'Cannot create a portfolio including itself'! !

!PortfolioAccount class methodsFor: 'error descriptions' stamp: 'chiara 6/8/2022 11:04:02'!
repeatedAccountsErrorDescription
	^'Cannot create a portfolio with repeated accounts'! !


!PortfolioAccount class methodsFor: 'instance creation' stamp: 'chiara 6/8/2022 12:52:49'!
including: aGroupOfAccounts
	^self new initializeWith: aGroupOfAccounts.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'chiara 6/9/2022 16:13:37'!
balance
	^transactions inject: 0 into:[:balance :aTransaction | aTransaction affectBalance: 	balance].		
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 21:19:32'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'hierarchy' stamp: 'chiara 6/8/2022 23:25:11'!
addItselfAndItsAccountsTo: aCollectionOfAccounts
	aCollectionOfAccounts add: self.! !

!ReceptiveAccount methodsFor: 'hierarchy' stamp: 'chiara 6/9/2022 16:33:16'!
isEqualOrHasIncludedAnAccountOf: anAccountAndItsComponents
	^(anAccountAndItsComponents includes: self).! !


!classDefinition: #Transaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transaction methodsFor: 'value' stamp: 'chiara 6/8/2022 10:47:49'!
affectBalance: aBalance
	self subclassResponsibility.! !

!Transaction methodsFor: 'value' stamp: 'chiara 6/8/2022 10:47:25'!
value
	self subclassResponsibility.! !



!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Transaction subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 11:21:17'!
affectBalance: aBalance
	self subclassResponsibility.
	! !


!AccountTransaction methodsFor: 'value' stamp: 'chiara 6/6/2022 11:22:31'!
value 
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'chiara 6/6/2022 11:06:11'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !



!Deposit methodsFor: 'main protocol' stamp: 'chiara 6/2/2022 21:36:05'!
affectBalance: aBalance

	^aBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !



!Withdraw methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 11:21:46'!
affectBalance: aBalance

	^ aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferTransaction category: 'ServiciosFinancieros-Ejercicio'!
Transaction subclass: #TransferTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTransaction methodsFor: 'value' stamp: 'chiara 6/6/2022 11:25:09'!
value
	^ transfer value.! !


!TransferTransaction methodsFor: 'initialization' stamp: 'chiara 6/6/2022 11:26:57'!
initializeAssociatedTo: aTransfer
	transfer := aTransfer.! !


!TransferTransaction methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 11:21:28'!
affectBalance: aBalance
	self subclassResponsibility.! !

!TransferTransaction methodsFor: 'main protocol' stamp: 'chiara 6/8/2022 10:22:09'!
counterpart
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction class
	instanceVariableNames: ''!

!TransferTransaction class methodsFor: 'instance creation' stamp: 'chiara 6/9/2022 16:24:32'!
associatedTo: aTransfer on: anAccount
	| transaction |
	
	transaction := self associatedToTransfer: aTransfer.
	anAccount register: transaction.
		
	^ transaction! !

!TransferTransaction class methodsFor: 'instance creation' stamp: 'chiara 6/9/2022 16:24:32'!
associatedToTransfer: aTransfer.
	^ self new initializeAssociatedTo: aTransfer.! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 11:29:08'!
affectBalance: aBalance

	^aBalance + self value.! !

!TransferDeposit methodsFor: 'main protocol' stamp: 'chiara 6/8/2022 10:24:25'!
counterpart
	^transfer withdrawal.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'main protocol' stamp: 'chiara 6/6/2022 11:29:03'!
affectBalance: aBalance

	^ aBalance - self value.! !

!TransferWithdraw methodsFor: 'main protocol' stamp: 'chiara 6/8/2022 10:24:37'!
counterpart
	^transfer deposit.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawal deposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'value' stamp: 'chiara 6/6/2022 10:38:42'!
value
	^value.! !


!Transfer methodsFor: 'initialization' stamp: 'chiara 6/6/2022 11:27:55'!
initializeFrom: aWithdrawalAccount to: aDepositAccount anAmountOf: aValue
	withdrawal  := TransferWithdraw associatedTo: self on: aWithdrawalAccount. 
	deposit  := TransferDeposit associatedTo: self on: aDepositAccount.
	value  := aValue. ! !


!Transfer methodsFor: 'parts' stamp: 'chiara 6/8/2022 10:23:22'!
deposit
	^deposit.! !

!Transfer methodsFor: 'parts' stamp: 'chiara 6/8/2022 10:23:31'!
withdrawal
	^withdrawal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'chiara 6/6/2022 10:37:47'!
from: aWithdrawalAccount to: aDepositAccount anAmountOf: aValue
	^ self new initializeFrom: aWithdrawalAccount to:  aDepositAccount anAmountOf: aValue. ! !
