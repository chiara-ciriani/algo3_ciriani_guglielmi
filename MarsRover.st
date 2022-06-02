!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'marsRoverWithNorthOrientation marsRoverWithSouthOrientation marsRoverWithEastOrientation marsRoverWithWestOrientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'assertions' stamp: 'chiara 6/1/2022 21:04:37'!
assertThatAMarsRover: aMarsRover receivesCommand: aSequenceOfCommands andEndsInPosition: aPosition withHeadFacing: aHeadOrientation
	aMarsRover recieveCommand: aSequenceOfCommands. 
	self assert: ((aMarsRover isInPosition: aPosition) and: (aMarsRover headIsFacingDirection: aHeadOrientation )).! !


!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 22:20:27'!
test01MarsRoverInitializesInOriginAndFacingNorth
	| marsRover |
	marsRover := MarsRover new.
	self assert: ((marsRover isInPosition: (0@0))and: (marsRover headIsFacingDirection: MarsRoverHeadFacingNorth)).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test02MarsRoverFacingNorthStepsForwardCorrectly
	self assertThatAMarsRover: marsRoverWithNorthOrientation receivesCommand: 'f' andEndsInPosition: (0@1) withHeadFacing: MarsRoverHeadFacingNorth.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test03MarsRoverStepsForwardMultipleTimesCorrectly
	self assertThatAMarsRover: marsRoverWithNorthOrientation receivesCommand: 'fff' andEndsInPosition: (0@3)  withHeadFacing: MarsRoverHeadFacingNorth.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test04MarsRoverFacingNorthStepsBackwardsCorrectly
	self assertThatAMarsRover: marsRoverWithNorthOrientation receivesCommand: 'b' andEndsInPosition: (0@-1) withHeadFacing: MarsRoverHeadFacingNorth.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test05MarsRoverFacingNorthRotatesRightCorrectly
	self assertThatAMarsRover: marsRoverWithNorthOrientation receivesCommand: 'r' andEndsInPosition: (0@0) withHeadFacing: MarsRoverHeadFacingEast.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test06MarsRoverRotatesAndMovesCorrectly
	self assertThatAMarsRover: marsRoverWithNorthOrientation receivesCommand: 'rf' andEndsInPosition: (1@0) withHeadFacing: MarsRoverHeadFacingEast.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test07MarsRoverRotatingInBothDirectionEndsInInitialHeadOrientation
	self assertThatAMarsRover: marsRoverWithNorthOrientation receivesCommand: 'rl' andEndsInPosition: (0@0) withHeadFacing: MarsRoverHeadFacingNorth.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test08MarsRoverFacingNorthRotatesLeftCorrectly
	self assertThatAMarsRover: marsRoverWithNorthOrientation receivesCommand: 'l' andEndsInPosition: (0@0) withHeadFacing: MarsRoverHeadFacingWest.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test09MarsRoverFacingSouthStepsForwardCorrectly
	self assertThatAMarsRover: marsRoverWithSouthOrientation receivesCommand: 'f' andEndsInPosition: (0@-1) withHeadFacing: MarsRoverHeadFacingSouth.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test10MarsRoverFacingSouthStepsBackwardsCorrectly
	self assertThatAMarsRover: marsRoverWithSouthOrientation receivesCommand: 'b' andEndsInPosition: (0@1) withHeadFacing: MarsRoverHeadFacingSouth.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test11MarsRoverFacingSouthRotatesRightCorrectly
	self assertThatAMarsRover: marsRoverWithSouthOrientation receivesCommand: 'r' andEndsInPosition: (0@0) withHeadFacing: MarsRoverHeadFacingWest.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test13MarsRoverFacingSouthRotatesLeftCorrectly
	self assertThatAMarsRover: marsRoverWithSouthOrientation receivesCommand: 'l' andEndsInPosition: (0@0) withHeadFacing: MarsRoverHeadFacingEast.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test14MarsRoverFacingEastStepsForwardCorrectly
	self assertThatAMarsRover: marsRoverWithEastOrientation receivesCommand: 'f' andEndsInPosition: (1@0) withHeadFacing: MarsRoverHeadFacingEast.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test15MarsRoverFacingEastStepsBackwardsCorrectly
	self assertThatAMarsRover: marsRoverWithEastOrientation receivesCommand: 'b' andEndsInPosition: (-1@0) withHeadFacing: MarsRoverHeadFacingEast.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test16MarsRoverFacingEastRotatesRightCorrectly
	self assertThatAMarsRover: marsRoverWithEastOrientation receivesCommand: 'r' andEndsInPosition: (0@0) withHeadFacing: MarsRoverHeadFacingSouth.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test17MarsRoverFacingEastRotatesLeftCorrectly
	self assertThatAMarsRover: marsRoverWithEastOrientation receivesCommand: 'l' andEndsInPosition: (0@0) withHeadFacing: MarsRoverHeadFacingNorth. ! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test18MarsRoverFacingWestStepsForwardCorrectly
	self assertThatAMarsRover: marsRoverWithWestOrientation receivesCommand: 'f' andEndsInPosition: (-1@0) withHeadFacing: MarsRoverHeadFacingWest.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test19MarsRoverFacingWestStepsBackwardsCorrectly
	self assertThatAMarsRover: marsRoverWithWestOrientation receivesCommand: 'b' andEndsInPosition: (1@0) withHeadFacing: MarsRoverHeadFacingWest.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test20MarsRoverFacingWestRotatesRightCorrectly
	self assertThatAMarsRover: marsRoverWithWestOrientation receivesCommand: 'r' andEndsInPosition: (0@0) withHeadFacing: MarsRoverHeadFacingNorth.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 20:32:34'!
test21MarsRoverFacingWestRotatesLeftCorrectly
	self assertThatAMarsRover: marsRoverWithWestOrientation receivesCommand: 'l' andEndsInPosition: (0@0) withHeadFacing: MarsRoverHeadFacingSouth.! !

!MarsRoverTests methodsFor: 'testing' stamp: 'chiara 6/1/2022 22:23:50'!
test22MarsRoverRaisesErrorWhenInvalidCommandIsSentAndMaintainsPosition
	self
		should: [ marsRoverWithNorthOrientation recieveCommand: 'fx'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRoverCommands invalidCommandErrorDescription ].
	self assert: (marsRoverWithNorthOrientation isInPosition: (0@1)).
! !


!MarsRoverTests methodsFor: 'setUp' stamp: 'chiara 6/1/2022 20:24:45'!
setUp
	marsRoverWithNorthOrientation  := MarsRover inPosition: (0@0) withHeadFacing: MarsRoverHeadFacingNorth new.
	marsRoverWithSouthOrientation  := MarsRover inPosition: (0@0) withHeadFacing: MarsRoverHeadFacingSouth new.
	marsRoverWithEastOrientation  := MarsRover inPosition: (0@0) withHeadFacing: MarsRoverHeadFacingEast new.
	marsRoverWithWestOrientation  := MarsRover inPosition: (0@0) withHeadFacing: MarsRoverHeadFacingWest new.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position headOrientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'chiara 6/1/2022 22:08:22'!
initialize
	"Si alguien crea un MarsRover utilizando el new por defecto se inicializa en (0,0) apuntando al Norte"
	self initializeInPosition: (0@0) withHeadFacing: MarsRoverHeadFacingNorth new.! !

!MarsRover methodsFor: 'initialization' stamp: 'chiara 6/1/2022 20:26:07'!
initializeInPosition: anInitialPosition withHeadFacing: anInitialHeadOrientation
	position := anInitialPosition.
	headOrientation  := anInitialHeadOrientation.
! !


!MarsRover methodsFor: 'information' stamp: 'chiara 6/1/2022 20:29:10'!
headIsFacingDirection: aHeadDirection
	^headOrientation = aHeadDirection.! !

!MarsRover methodsFor: 'information' stamp: 'chiara 6/1/2022 21:03:52'!
isInPosition: aPosition
	^position = aPosition.! !


!MarsRover methodsFor: 'functionality' stamp: 'chiara 5/29/2022 19:43:37'!
recieveCommand: aSequenceOfCommands
	aSequenceOfCommands do: [:aPotentialCommand | 
		| marsRoverCommand |
		marsRoverCommand := MarsRoverCommands associatedWith: aPotentialCommand.
		marsRoverCommand actionFor: self.
	].! !


!MarsRover methodsFor: 'actions' stamp: 'chiara 6/1/2022 22:04:25'!
moveBackwards
	position := position + headOrientation backwardPointing.! !

!MarsRover methodsFor: 'actions' stamp: 'chiara 6/1/2022 22:04:05'!
moveForward
	position := position + headOrientation forwardPointing.! !

!MarsRover methodsFor: 'actions' stamp: 'chiara 6/1/2022 20:26:07'!
rotateNinetyDegreesLeft
	headOrientation := headOrientation rotateNinetyDegreesLeft.! !

!MarsRover methodsFor: 'actions' stamp: 'chiara 6/1/2022 20:26:07'!
rotateNinetyDegreesRight
	headOrientation := headOrientation rotateNinetyDegreesRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'chiara 6/1/2022 20:25:32'!
inPosition: anInitialPosition withHeadFacing: anInitialHeadOrientation
	^self new initializeInPosition: anInitialPosition withHeadFacing: anInitialHeadOrientation.! !


!classDefinition: #MarsRoverCommands category: 'MarsRover'!
Object subclass: #MarsRoverCommands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverCommands methodsFor: 'actions' stamp: 'chiara 5/29/2022 19:29:04'!
actionFor: aMarsRover
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommands class' category: 'MarsRover'!
MarsRoverCommands class
	instanceVariableNames: ''!

!MarsRoverCommands class methodsFor: 'instance creation' stamp: 'chiara 6/1/2022 22:11:04'!
associatedWith: aPotentialCommand
	
	MarsRoverCommands allSubclasses 
		detect:  [ :aSubclass | aSubclass isRepresentedBy: aPotentialCommand ] 
		ifFound: [ :selectedSubclass | ^selectedSubclass for: aPotentialCommand ] 
		ifNone:  [ ^self error: self invalidCommandErrorDescription ].! !


!MarsRoverCommands class methodsFor: 'as yet unclassified' stamp: 'chiara 5/29/2022 20:19:46'!
invalidCommandErrorDescription
	^'Invalid command'! !


!MarsRoverCommands class methodsFor: 'private' stamp: 'chiara 5/29/2022 19:21:08'!
for: aValue

	^self new! !

!MarsRoverCommands class methodsFor: 'private' stamp: 'chiara 5/29/2022 19:49:11'!
isRepresentedBy: aPotentialCommand
	self subclassResponsibility.! !


!classDefinition: #Backwards category: 'MarsRover'!
MarsRoverCommands subclass: #Backwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Backwards methodsFor: 'actions' stamp: 'chiara 5/29/2022 19:29:47'!
actionFor: aMarsRover
	^aMarsRover moveBackwards.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backwards class' category: 'MarsRover'!
Backwards class
	instanceVariableNames: ''!

!Backwards class methodsFor: 'private' stamp: 'chiara 5/29/2022 19:24:16'!
isRepresentedBy: aCharacter
	^aCharacter = $b.! !


!classDefinition: #Forward category: 'MarsRover'!
MarsRoverCommands subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Forward methodsFor: 'actions' stamp: 'chiara 5/29/2022 19:29:54'!
actionFor: aMarsRover
	^aMarsRover moveForward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'private' stamp: 'chiara 5/29/2022 19:24:23'!
isRepresentedBy: aCharacter
	^aCharacter = $f.! !


!classDefinition: #Rotate90DegreesLeft category: 'MarsRover'!
MarsRoverCommands subclass: #Rotate90DegreesLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Rotate90DegreesLeft methodsFor: 'actions' stamp: 'chiara 5/29/2022 19:30:08'!
actionFor: aMarsRover
	^aMarsRover rotateNinetyDegreesLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rotate90DegreesLeft class' category: 'MarsRover'!
Rotate90DegreesLeft class
	instanceVariableNames: ''!

!Rotate90DegreesLeft class methodsFor: 'private' stamp: 'chiara 5/29/2022 19:24:31'!
isRepresentedBy: aCharacter
	^aCharacter = $l.! !


!classDefinition: #Rotate90DegreesRight category: 'MarsRover'!
MarsRoverCommands subclass: #Rotate90DegreesRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Rotate90DegreesRight methodsFor: 'actions' stamp: 'chiara 5/29/2022 19:30:17'!
actionFor: aMarsRover
	^aMarsRover rotateNinetyDegreesRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rotate90DegreesRight class' category: 'MarsRover'!
Rotate90DegreesRight class
	instanceVariableNames: ''!

!Rotate90DegreesRight class methodsFor: 'private' stamp: 'chiara 5/29/2022 19:24:37'!
isRepresentedBy: aCharacter
	^aCharacter = $r.! !


!classDefinition: #MarsRoverHead category: 'MarsRover'!
Object subclass: #MarsRoverHead
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHead methodsFor: 'information' stamp: 'chiara 6/1/2022 22:04:25'!
backwardPointing
	^self forwardPointing negated.! !

!MarsRoverHead methodsFor: 'information' stamp: 'chiara 6/1/2022 22:04:05'!
forwardPointing
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'information' stamp: 'chiara 5/29/2022 18:03:07'!
rotateNinetyDegreesLeft
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'information' stamp: 'chiara 5/29/2022 18:03:16'!
rotateNinetyDegreesRight
	self subclassResponsibility.! !


!MarsRoverHead methodsFor: 'comparison' stamp: 'chiara 5/29/2022 19:44:48'!
= aOrientation
	^self class isKindOf: aOrientation class.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadFacingEast methodsFor: 'information' stamp: 'chiara 6/1/2022 22:04:05'!
forwardPointing
	^(1@0).! !

!MarsRoverHeadFacingEast methodsFor: 'information' stamp: 'chiara 5/30/2022 22:29:28'!
rotateNinetyDegreesLeft
	^MarsRoverHeadFacingNorth new.! !

!MarsRoverHeadFacingEast methodsFor: 'information' stamp: 'chiara 5/30/2022 22:29:44'!
rotateNinetyDegreesRight
	^MarsRoverHeadFacingSouth new.! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadFacingNorth methodsFor: 'information' stamp: 'chiara 6/1/2022 22:04:05'!
forwardPointing
	^(0@1).! !

!MarsRoverHeadFacingNorth methodsFor: 'information' stamp: 'chiara 5/30/2022 22:30:00'!
rotateNinetyDegreesLeft
	^MarsRoverHeadFacingWest new.! !

!MarsRoverHeadFacingNorth methodsFor: 'information' stamp: 'chiara 5/30/2022 22:29:07'!
rotateNinetyDegreesRight
	^MarsRoverHeadFacingEast new.! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadFacingSouth methodsFor: 'information' stamp: 'chiara 6/1/2022 22:04:05'!
forwardPointing
	^(0@-1).! !

!MarsRoverHeadFacingSouth methodsFor: 'information' stamp: 'chiara 5/30/2022 22:29:07'!
rotateNinetyDegreesLeft
	^MarsRoverHeadFacingEast new.! !

!MarsRoverHeadFacingSouth methodsFor: 'information' stamp: 'chiara 5/30/2022 22:30:00'!
rotateNinetyDegreesRight
	^MarsRoverHeadFacingWest new.! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeadFacingWest methodsFor: 'information' stamp: 'chiara 6/1/2022 22:04:05'!
forwardPointing
	^(-1@0).! !

!MarsRoverHeadFacingWest methodsFor: 'information' stamp: 'chiara 5/30/2022 22:29:44'!
rotateNinetyDegreesLeft
	^MarsRoverHeadFacingSouth new.! !

!MarsRoverHeadFacingWest methodsFor: 'information' stamp: 'chiara 5/30/2022 22:29:28'!
rotateNinetyDegreesRight
	^MarsRoverHeadFacingNorth new.! !
