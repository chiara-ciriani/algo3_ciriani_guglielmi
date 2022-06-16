!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-2-Grupo24'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-2-Grupo24'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
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


!classDefinition: #ReportTest category: 'ServiciosFinancieros-2-Grupo24'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:20:05'!
test01ReceptiveAccountWithoutTransactionsReturnsSummaryWithBalanceZero
	| aReceptiveAccount anAccountSummary |
	
	aReceptiveAccount := ReceptiveAccount new.
	anAccountSummary := (AccountSummaryReport for: aReceptiveAccount ) generate.
	
	self assert: (OrderedCollection with: 'Balance = 0 * pesos') equals: anAccountSummary .! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:20:30'!
test02ReceptiveAccountWithOneDepositReturnsCorrectSummary
	| aReceptiveAccount anAccountSummary |
	
	aReceptiveAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: aReceptiveAccount.
	
	anAccountSummary := (AccountSummaryReport for: aReceptiveAccount ) generate.
	
	self assert: (OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos') equals: anAccountSummary.! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:20:57'!
test03ReceptiveAccountWithOneWithdrawReturnsCorrectSummary
	| aReceptiveAccount anAccountSummary |
	
	aReceptiveAccount := ReceptiveAccount new.
	Withdraw register: 100 * peso on: aReceptiveAccount.
	
	anAccountSummary := (AccountSummaryReport for: aReceptiveAccount ) generate.
	
	self assert: (OrderedCollection with: 'Extracción por 100 * pesos' with: 'Balance = -100 * pesos') equals: anAccountSummary.! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:21:55'!
test04ReceptiveAccountWithTransferDepositReturnsCorrectSummary
	| aReceptiveAccount aReceptiveAccount2 anAccountSummary |
	
	aReceptiveAccount := ReceptiveAccount new.
	Deposit register: 2 * peso on: aReceptiveAccount.
	aReceptiveAccount2 := ReceptiveAccount new.
	
	Transfer amount: 2 * peso from: aReceptiveAccount to: aReceptiveAccount2.
	
	anAccountSummary := (AccountSummaryReport for: aReceptiveAccount2) generate.
	
	self assert: (OrderedCollection with: 'Entrada por transferencia de 2 * pesos' with: 'Balance = 2 * pesos') equals: anAccountSummary.! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:22:40'!
test05ReceptiveAccountWithTransferWithdrawReturnsCorrectSummary
	| aReceptiveAccount aReceptiveAccount2 anAccountSummary |
	
	aReceptiveAccount := ReceptiveAccount new.
	aReceptiveAccount2 := ReceptiveAccount new.
	
	Transfer amount: 2 * peso from: aReceptiveAccount to: aReceptiveAccount2.
	
	anAccountSummary := (AccountSummaryReport for: aReceptiveAccount) generate.
	
	self assert: (OrderedCollection with: 'Salida por transferencia de 2 * pesos' with: 'Balance = -2 * pesos') equals: anAccountSummary.! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:23:08'!
test06ReceptiveAccountWithMultipleTransactionsReturnsCorrectSummary
	| aReceptiveAccount aReceptiveAccount2 anAccountSummary |
	
	aReceptiveAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: aReceptiveAccount.
	Withdraw register: 50 * peso on: aReceptiveAccount.
	aReceptiveAccount2 := ReceptiveAccount new.
	
	Transfer amount: 20 * peso from: aReceptiveAccount to: aReceptiveAccount2.
	Transfer amount: 30 * peso from: aReceptiveAccount2 to: aReceptiveAccount.
	
	anAccountSummary := (AccountSummaryReport for: aReceptiveAccount) generate.
		
	self assert: (OrderedCollection with: 'Depósito por 100 * pesos'
								with: 'Extracción por 50 * pesos'
								with: 'Salida por transferencia de 20 * pesos' 
								with: 'Entrada por transferencia de 30 * pesos' 
								with: 'Balance = 60 * pesos') 
				equals: anAccountSummary.! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:23:34'!
test07PortfolioAccountWithoutTransactionsReturnsSummaryWithBalanceZero
	| aPortfolio anAccountSummary |
	
	aPortfolio := Portfolio with: ReceptiveAccount new.
	
	anAccountSummary := (AccountSummaryReport for: aPortfolio) generate.
	
	self assert: (OrderedCollection with: 'Balance = 0 * pesos') equals: anAccountSummary.! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:23:56'!
test08PortfolioAccountWithReceptiveAccountWithOneTransactionReturnsCorrectSummary
	| aPortfolio aReceptiveAccount anAccountSummary |
	
	aReceptiveAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: aReceptiveAccount.
	
	aPortfolio := Portfolio with: aReceptiveAccount .
	
	anAccountSummary := (AccountSummaryReport for: aPortfolio) generate.
	
	self assert: (OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos') equals: anAccountSummary.! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:24:25'!
test09PortfolioAccountWithMultipleReceptiveAccountsWithTransactionsReturnsCorrectSummary
	| aPortfolio aReceptiveAccount aReceptiveAccount2 anAccountSummary|
	
	aReceptiveAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: aReceptiveAccount.
	aReceptiveAccount2 := ReceptiveAccount new.
	Withdraw register: 50 * peso on: aReceptiveAccount2.
		
	aPortfolio := Portfolio with:aReceptiveAccount with: aReceptiveAccount2.
	
	anAccountSummary := (AccountSummaryReport for: aPortfolio) generate.
	
	self assert: (OrderedCollection with: 'Depósito por 100 * pesos' with: 'Extracción por 50 * pesos' with: 'Balance = 50 * pesos') equals: anAccountSummary.! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:24:52'!
test10PortfolioAccountWithReceptiveAccountsWithTransactionsAmongThemselvesReturnsCorrectSummary
	| aPortfolio aReceptiveAccount aReceptiveAccount2 anAccountSummary |
	
	aReceptiveAccount := ReceptiveAccount new.
	aReceptiveAccount2 := ReceptiveAccount new.
	
	Transfer amount: 50 * peso from: aReceptiveAccount to: aReceptiveAccount2.
	
	aPortfolio := Portfolio with:aReceptiveAccount with: aReceptiveAccount2.
	
	anAccountSummary := (AccountSummaryReport for: aPortfolio) generate.
	
	self assert: (OrderedCollection with: 'Salida por transferencia de 50 * pesos' with: 'Entrada por transferencia de 50 * pesos' with: 'Balance = 0 * pesos') equals: anAccountSummary.! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:25:12'!
test11PortfolioAccountWithDifferentAccountTypesReturnsCorrectSummary
	| aPortfolio aPortfolioToBeTested aReceptiveAccount aReceptiveAccount2 anAccountSummary |
	
	aReceptiveAccount := ReceptiveAccount new.
	aReceptiveAccount2 := ReceptiveAccount new.
	
	Transfer amount: 50 * peso from: aReceptiveAccount to: aReceptiveAccount2.
	
	aPortfolio := Portfolio with: aReceptiveAccount.
	aPortfolioToBeTested := Portfolio with: aPortfolio with: aReceptiveAccount2.
	
	anAccountSummary := (AccountSummaryReport for: aPortfolioToBeTested ) generate.
	
	self assert: (OrderedCollection with: 'Salida por transferencia de 50 * pesos' with: 'Entrada por transferencia de 50 * pesos' with: 'Balance = 0 * pesos') equals: anAccountSummary.! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:26:28'!
test12ReceptiveAccountWithoutTransfersReturnsTransferNetZero
	| aTransferNet |
	
	aTransferNet := (TransferNetReport for: ReceptiveAccount new) generate.
	
	self assert: 0 * peso equals: aTransferNet.
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:26:52'!
test13ReceptiveAccountWithTransferWithdrawReturnsCorrectTransferNet
	| aReceptiveAccount aReceptiveAccount2 aTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	aReceptiveAccount2 := ReceptiveAccount new.
	
	Transfer amount: 100 * peso from: 	aReceptiveAccount to: aReceptiveAccount2.
	
	aTransferNet := (TransferNetReport for: aReceptiveAccount) generate.
	
	self assert: -100 * peso equals: aTransferNet.
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:27:09'!
test14ReceptiveAccountWithTransferDepositReturnsCorrectTransferNet
	| aReceptiveAccount aReceptiveAccount2 aTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	aReceptiveAccount2 := ReceptiveAccount new.
	
	Transfer amount: 100 * peso from: 	aReceptiveAccount2 to: aReceptiveAccount.
	
	aTransferNet := (TransferNetReport for: aReceptiveAccount) generate.
	
	self assert: 100 * peso equals: aTransferNet.
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:27:28'!
test15ReceptiveAccountWithTransfersReturnsCorrectTransferNet
	| aReceptiveAccount aReceptiveAccount2 aTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	aReceptiveAccount2 := ReceptiveAccount new.
	
	Transfer amount: 100 * peso from: 	aReceptiveAccount to: aReceptiveAccount2.
	Transfer amount: 50 * peso from: 	aReceptiveAccount2 to: aReceptiveAccount.
	
	aTransferNet := (TransferNetReport for: aReceptiveAccount) generate.
	
	self assert: -50 * peso equals: aTransferNet.
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:28:40'!
test16PortfolioAccountWithoutTransfersReturnsTransferNetZero
	| aTransferNet |
	
	aTransferNet := (TransferNetReport for: (Portfolio with: ReceptiveAccount new)) generate.

	self assert: 0 * peso equals: aTransferNet.
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:29:12'!
test17PortfolioAccountWithTransfersReturnsCorrectTransferNet
	| aReceptiveAccount aReceptiveAccount2 aPortfolio aTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	aReceptiveAccount2 := ReceptiveAccount new.
	
	Transfer amount: 100 * peso from: 	aReceptiveAccount to: aReceptiveAccount2.
	Transfer amount: 50 * peso from: 	aReceptiveAccount2 to: aReceptiveAccount.
	
	aPortfolio := Portfolio with: aReceptiveAccount.
	
	aTransferNet := (TransferNetReport for: aPortfolio) generate.
	
	self assert: -50 * peso equals: aTransferNet.
	
	! !

!ReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:29:34'!
test18PortfolioAccountWithTransfersAmongItsOwnAccountsReturnsTransferNetZero
	| aReceptiveAccount aReceptiveAccount2 aPortfolio aTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	aReceptiveAccount2 := ReceptiveAccount new.
	
	Transfer amount: 100 * peso from: 	aReceptiveAccount to: aReceptiveAccount2.
	Transfer amount: 50 * peso from: 	aReceptiveAccount2 to: aReceptiveAccount.
	
	aPortfolio := Portfolio with: aReceptiveAccount with: aReceptiveAccount2 .
	
	aTransferNet := (TransferNetReport for: aPortfolio) generate.
	
	self assert: 0 * peso equals: aTransferNet.
	
	! !


!classDefinition: #SpecialReportTest category: 'ServiciosFinancieros-2-Grupo24'!
TestCase subclass: #SpecialReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!SpecialReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:49:34'!
test01ReceptiveAccountIsNamedCorrectly
	
	self assert: 'Cuenta de ECBellocq' equals: (ReceptiveAccount named: 'Cuenta de ECBellocq') name.! !

!SpecialReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:49:45'!
test02PortfolioIsNamedCorrectly
	
	self assert: 'Portfolio de ECBellocq' equals: (Portfolio named: 'Portfolio de ECBellocq' with: ReceptiveAccount new) name.! !

!SpecialReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:57:14'!
test03EmptyPortfolioReturnsCorrectTreePrinter
	| aPortfolio aTreePrinter |
	
	aPortfolio := Portfolio named: 'Portfolio de la familia'.
	
	aTreePrinter := (PortfolioTreePrinter for: aPortfolio) generate.
	
	self assert: (OrderedCollection with: 'Portfolio de la familia') 
		equals: aTreePrinter.! !

!SpecialReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 13:08:28'!
test04PortfolioContainingReceptiveAccountReturnsCorrectTreePrinter
	| aPortfolio aReceptiveAccount aTreePrinter |
	
	aReceptiveAccount := ReceptiveAccount named: 'Cuenta de Lucho'.
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: aReceptiveAccount.
	
	aTreePrinter := (PortfolioTreePrinter for: aPortfolio) generate.
	
	self assert: (OrderedCollection with: 'Portfolio de la familia' with: '  Cuenta de Lucho') 
		equals: aTreePrinter.! !

!SpecialReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 13:08:22'!
test05PortfolioContainingReceptiveAccountAndPortfolioReturnsCorrectTreePrinter
	| aPortfolio aParentAccount aChildrenPortfolio aSonAccount aDaugtherAccount aTreePrinter |
	
	aParentAccount := ReceptiveAccount named: 'Cuenta de Lucho'.
	aSonAccount := ReceptiveAccount named: 'Cuenta de Joaco'.
	aDaugtherAccount := ReceptiveAccount named: 'Cuenta de Ana'.
	
	aChildrenPortfolio := Portfolio named: 'Portfolio de hijos' with: 	aSonAccount with: aDaugtherAccount.
	
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: aParentAccount with: aChildrenPortfolio.
	
	aTreePrinter := (PortfolioTreePrinter for: aPortfolio) generate.
	
	self assert: (OrderedCollection with: 'Portfolio de la familia' with: '  Cuenta de Lucho' with: '  Portfolio de hijos' with: '    Cuenta de Joaco' with: '    Cuenta de Ana') 
		equals: aTreePrinter.! !

!SpecialReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 13:08:11'!
test06PortfolioContainingReceptiveAccountAndPortfolioWithInvertedOrderReturnsCorrectTreePrinter
	| aPortfolio aParentAccount aChildrenPortfolio aSonAccount aDaugtherAccount aTreePrinter |
	
	aParentAccount := ReceptiveAccount named: 'Cuenta de Lucho'.
	aSonAccount := ReceptiveAccount named: 'Cuenta de Joaco'.
	aDaugtherAccount := ReceptiveAccount named: 'Cuenta de Ana'.
	
	aChildrenPortfolio := Portfolio named: 'Portfolio de hijos' with: 	aSonAccount with: aDaugtherAccount.
	
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: aChildrenPortfolio with: aParentAccount.
	
	aTreePrinter := (PortfolioTreePrinter for: aPortfolio) generate.
	
	self assert: (OrderedCollection with: 'Portfolio de la familia' with: '  Portfolio de hijos' with: '    Cuenta de Joaco' with: '    Cuenta de Ana' with: '  Cuenta de Lucho') 
		equals: aTreePrinter.! !

!SpecialReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 12:58:41'!
test07EmptyPortfolioReturnsCorrectDetailedTreePrinter
	| aPortfolio aDetailedTreePrinter |
	
	aPortfolio := Portfolio named: 'Portfolio de la familia'.
	
	aDetailedTreePrinter := (PortfolioDetailedTreePrinter for: aPortfolio) generate.
	
	self assert: (OrderedCollection with: 'Portfolio de la familia' with: '  Balance = 0 * pesos') equals: aDetailedTreePrinter.! !

!SpecialReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 13:08:00'!
test08PortfolioContainingReceptiveAccountReturnsCorrectDetailedTreePrinter
	| aPortfolio aParentAccount aDetailedTreePrinter expectedDetailedTree |
	
	aParentAccount := ReceptiveAccount named: 'Cuenta de Lucho'.
	
	Deposit register: 10 * peso on: aParentAccount .
	
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: aParentAccount.
	aDetailedTreePrinter := (PortfolioDetailedTreePrinter for: aPortfolio) generate.
	
	expectedDetailedTree := OrderedCollection new.
	expectedDetailedTree add: 'Portfolio de la familia'; 
				add: '  Cuenta de Lucho';
				add: '    Depósito por 10 * pesos'; 
				add: '    Balance = 10 * pesos';
				add: '  Balance = 10 * pesos'.
	
	self assert: expectedDetailedTree equals: aDetailedTreePrinter.! !

!SpecialReportTest methodsFor: 'tests' stamp: 'NG 6/16/2022 13:07:54'!
test09PortfolioContainingReceptiveAccountAndPortfolioReturnsCorrectDetailedTreePrinter
	| aPortfolio aParentAccount aChildrenPortfolio aSonAccount aDaugtherAccount aDetailedTreePrinter expectedDetailedTree |
	
	aParentAccount := ReceptiveAccount named: 'Cuenta de Lucho'.
	aSonAccount := ReceptiveAccount named: 'Cuenta de Joaco'.
	aDaugtherAccount := ReceptiveAccount named: 'Cuenta de Ana'.
	
	Deposit register: 50000 * peso on: aDaugtherAccount.
	Withdraw register: 100 * peso on: aSonAccount.
	Transfer amount: 100 * peso from: aParentAccount to: aSonAccount.
	
	aChildrenPortfolio := Portfolio named: 'Portfolio de hijos' with: 	aSonAccount with: aDaugtherAccount.
	
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: aParentAccount with: aChildrenPortfolio.
	
	aDetailedTreePrinter := (PortfolioDetailedTreePrinter for: aPortfolio) generate.
	
	expectedDetailedTree := OrderedCollection new.
	
	expectedDetailedTree add: 'Portfolio de la familia'; 
							add: '  Cuenta de Lucho'; 
							add: '    Salida por transferencia de 100 * pesos'; 
							add: '    Balance = -100 * pesos'; 
							add: '  Portfolio de hijos'; 
							add: '    Cuenta de Joaco'; 
							add: '      Extracción por 100 * pesos';
							add: '      Entrada por transferencia de 100 * pesos';
							add: '      Balance = 0 * pesos';
							add: '    Cuenta de Ana';
							add: '      Depósito por 50000 * pesos';
							add: '      Balance = 50000 * pesos';
							add: '    Balance = 50000 * pesos';
							add: '  Balance = 49900 * pesos' .
	
	self assert: expectedDetailedTree equals: aDetailedTreePrinter.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-2-Grupo24'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-2-Grupo24'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'chiara 6/13/2022 20:11:20'!
name
	^name.! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'reports' stamp: 'NG 6/15/2022 11:19:16'!
accept: aVisitor
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-2-Grupo24'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!Portfolio methodsFor: 'initialization' stamp: 'chiara 6/13/2022 20:06:48'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := ''.! !

!Portfolio methodsFor: 'initialization' stamp: 'chiara 6/13/2022 20:07:08'!
initializeNamed: aName

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := aName.! !


!Portfolio methodsFor: 'main protocol' stamp: 'NG 6/16/2022 13:00:23'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'reports' stamp: 'NG 6/15/2022 12:24:30'!
accept: aVisitor
	aVisitor visitPortfolioAccount: self.
	 accounts do: [:anAccount | anAccount accept: aVisitor].
	aVisitor endVisitPortfolio: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-2-Grupo24'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error description' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'NG 6/16/2022 12:55:37'!
named: aName

	^(self new initializeNamed: aName).! !

!Portfolio class methodsFor: 'instance creation' stamp: 'chiara 6/13/2022 20:10:22'!
named: aName with: anAccount

	^(self new initializeNamed: aName)
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'chiara 6/13/2022 20:10:17'!
named: aName with: anAccount with: anotherAccount

	^(self new initializeNamed: aName) 
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-2-Grupo24'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'chiara 6/13/2022 20:06:35'!
initialize
	transactions := OrderedCollection new.
	name := ''.
	! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'chiara 6/13/2022 20:05:55'!
initializeNamed: aName
	transactions := OrderedCollection new.
	name := aName.
	
	! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NG 6/12/2022 20:47:54'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'reports' stamp: 'NG 6/15/2022 11:19:08'!
accept: aVisitor
	aVisitor visitReceptiveAccount: self.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-2-Grupo24'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'chiara 6/13/2022 20:07:18'!
named: aName
	^self new initializeNamed: aName.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-2-Grupo24'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'reports' stamp: 'chiara 6/13/2022 21:43:36'!
accept: aReport
	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-2-Grupo24'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'reports' stamp: 'chiara 6/13/2022 21:45:08'!
accept: aReport
	aReport visitDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-2-Grupo24'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-2-Grupo24'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-2-Grupo24'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-2-Grupo24'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'reports' stamp: 'chiara 6/13/2022 21:45:20'!
accept: aReport
	aReport visitDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-2-Grupo24'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'reports' stamp: 'chiara 6/13/2022 21:45:41'!
accept: aReport
	aReport visitWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-2-Grupo24'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'reports' stamp: 'chiara 6/13/2022 21:45:30'!
accept: aReport
	aReport visitWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-2-Grupo24'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancieros-2-Grupo24'!
Object subclass: #Report
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!Report methodsFor: 'initialization' stamp: 'chiara 6/12/2022 19:51:52'!
initializeFor: anAccount
	self subclassResponsibility.! !


!Report methodsFor: 'private' stamp: 'chiara 6/13/2022 21:45:08'!
visitDeposit: aDeposit
	self subclassResponsibility.! !

!Report methodsFor: 'private' stamp: 'chiara 6/13/2022 21:45:20'!
visitDepositLeg: aDepositLeg
	self subclassResponsibility.! !

!Report methodsFor: 'private' stamp: 'chiara 6/13/2022 21:45:30'!
visitWithdraw: aWithdraw
	self subclassResponsibility.! !

!Report methodsFor: 'private' stamp: 'chiara 6/13/2022 21:45:41'!
visitWithdrawLeg: aWithdrawLeg
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-2-Grupo24'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'chiara 6/12/2022 19:51:01'!
for: anAccount
	^self new initializeFor: anAccount.! !


!classDefinition: #AccountSummaryReport category: 'ServiciosFinancieros-2-Grupo24'!
Report subclass: #AccountSummaryReport
	instanceVariableNames: 'summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!AccountSummaryReport methodsFor: 'initialization' stamp: 'chiara 6/12/2022 20:06:20'!
initializeFor: anAccount
	account := anAccount.
	summary := OrderedCollection new.! !


!AccountSummaryReport methodsFor: 'transactions' stamp: 'chiara 6/13/2022 21:45:08'!
visitDeposit: aDeposit
	summary add: 'Depósito por ', aDeposit value asString.! !

!AccountSummaryReport methodsFor: 'transactions' stamp: 'chiara 6/13/2022 21:45:20'!
visitDepositLeg: aDepositLeg
	summary add: 'Entrada por transferencia de ', aDepositLeg value asString.! !

!AccountSummaryReport methodsFor: 'transactions' stamp: 'chiara 6/13/2022 21:45:30'!
visitWithdraw: aWithdraw
	summary add: 'Extracción por ', aWithdraw value asString.! !

!AccountSummaryReport methodsFor: 'transactions' stamp: 'chiara 6/13/2022 21:45:41'!
visitWithdrawLeg: aWithdrawLeg
	summary add: 'Salida por transferencia de ', aWithdrawLeg value asString.! !


!AccountSummaryReport methodsFor: 'main protocol' stamp: 'chiara 6/13/2022 21:43:36'!
generate
	account transactions do: [:aTransaction | aTransaction accept: self ].
	summary add: ('Balance = ', account balance asString).
	^summary.
	! !


!classDefinition: #PortfolioTreeReport category: 'ServiciosFinancieros-2-Grupo24'!
Report subclass: #PortfolioTreeReport
	instanceVariableNames: 'tree tab indentationCounter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!PortfolioTreeReport methodsFor: 'initialization' stamp: 'NG 6/16/2022 12:38:13'!
initializeFor: anAccount
	account := anAccount.
	indentationCounter := 0.
	tab := '  '.
	tree := OrderedCollection new.! !


!PortfolioTreeReport methodsFor: 'main protocol' stamp: 'NG 6/15/2022 12:24:17'!
endVisitPortfolio: aPortfolio
	self subclassResponsibility.! !

!PortfolioTreeReport methodsFor: 'main protocol' stamp: 'NG 6/15/2022 12:10:10'!
generate
	account accept: self.
	^tree.! !


!PortfolioTreeReport methodsFor: 'private - indentation' stamp: 'NG 6/16/2022 12:38:13'!
correspondingIndentation
	| indentation |
	indentation _ ''.
	(indentationCounter) timesRepeat: [indentation := indentation appendToString: tab].
	^indentation .! !

!PortfolioTreeReport methodsFor: 'private - indentation' stamp: 'NG 6/16/2022 12:42:15'!
countIndentation
	indentationCounter := indentationCounter + 1.! !

!PortfolioTreeReport methodsFor: 'private - indentation' stamp: 'NG 6/16/2022 12:45:09'!
subtractIndentation
	indentationCounter := indentationCounter - 1.! !


!PortfolioTreeReport methodsFor: 'transactions' stamp: 'NG 6/15/2022 12:11:23'!
visitPortfolioAccount: aPortfolioAccount
	self subclassResponsibility.! !

!PortfolioTreeReport methodsFor: 'transactions' stamp: 'NG 6/15/2022 12:11:32'!
visitReceptiveAccount: aReceptiveAccount
	self subclassResponsibility.! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-2-Grupo24'!
PortfolioTreeReport subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!PortfolioDetailedTreePrinter methodsFor: 'main protocol' stamp: 'NG 6/16/2022 12:45:09'!
endVisitPortfolio: aPortfolio
	tree add: (self correspondingIndentation, 'Balance = ', aPortfolio balance asString).
	self subtractIndentation.
	! !


!PortfolioDetailedTreePrinter methodsFor: 'transactions' stamp: 'NG 6/16/2022 12:42:16'!
visitPortfolioAccount: anAccount
	tree add: (self correspondingIndentation, anAccount name).
	self countIndentation.! !

!PortfolioDetailedTreePrinter methodsFor: 'transactions' stamp: 'NG 6/16/2022 12:45:09'!
visitReceptiveAccount: anAccount
	| receptiveAccountSummary |
	tree add: (self correspondingIndentation, anAccount name).
	self countIndentation.
	receptiveAccountSummary := (AccountSummaryReport for: anAccount) generate.
	receptiveAccountSummary do: [ :aTransaction | tree add: (self correspondingIndentation, aTransaction)].
	self subtractIndentation.! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-2-Grupo24'!
PortfolioTreeReport subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!


!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'NG 6/16/2022 12:45:09'!
endVisitPortfolio: aPortfolio
	self subtractIndentation.! !


!PortfolioTreePrinter methodsFor: 'transactions' stamp: 'NG 6/16/2022 12:42:16'!
visitPortfolioAccount: anAccount
	tree add: (self correspondingIndentation, anAccount name).
	self countIndentation.! !

!PortfolioTreePrinter methodsFor: 'transactions' stamp: 'NG 6/15/2022 11:12:44'!
visitReceptiveAccount: anAccount
	tree add: (self correspondingIndentation, anAccount name).! !


!classDefinition: #TransferNetReport category: 'ServiciosFinancieros-2-Grupo24'!
Report subclass: #TransferNetReport
	instanceVariableNames: 'transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!TransferNetReport methodsFor: 'main protocol' stamp: 'chiara 6/13/2022 21:43:36'!
generate
	account transactions do: [:aTransaction | aTransaction accept: self ].
	^transferNet.! !


!TransferNetReport methodsFor: 'transactions' stamp: 'chiara 6/13/2022 21:45:08'!
visitDeposit: aDeposit! !

!TransferNetReport methodsFor: 'transactions' stamp: 'chiara 6/13/2022 21:45:20'!
visitDepositLeg: aTransferDeposit
	transferNet := transferNet + aTransferDeposit value.! !

!TransferNetReport methodsFor: 'transactions' stamp: 'chiara 6/13/2022 21:45:30'!
visitWithdraw: aWithdraw! !

!TransferNetReport methodsFor: 'transactions' stamp: 'chiara 6/13/2022 21:45:41'!
visitWithdrawLeg: aTransferWithdraw
	transferNet := transferNet - aTransferWithdraw value.! !


!TransferNetReport methodsFor: 'initialization' stamp: 'NG 6/12/2022 21:56:07'!
initializeFor: anAccount
	account := anAccount. 
	transferNet := 0 * peso.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-2-Grupo24'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2-Grupo24'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'NG 6/16/2022 12:48:45'!
depositLeg
	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'NG 6/16/2022 12:48:42'!
withdrawLeg
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-2-Grupo24'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
