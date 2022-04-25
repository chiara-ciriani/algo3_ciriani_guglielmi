!classDefinition: #ElHabitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #ElHabitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElHabitat class' category: 'AvispasYAbejasParte2'!
ElHabitat class
	instanceVariableNames: 'cantidadDeHuevosPorFirmaGenetica cantidadDeOrugas cantidadDePolillas'!

!ElHabitat class methodsFor: 'estado actual del habitat' stamp: 'chiara 4/23/2022 22:23:27'!
cantidadDeHuevosConLaFirmaGeneticaDe: unaAvispa
	| firmaGeneticaDeAvispa |
	firmaGeneticaDeAvispa := unaAvispa firmaGeneticaDeAvispa.
	^cantidadDeHuevosPorFirmaGenetica at: firmaGeneticaDeAvispa ifAbsent: [ 0 ].! !

!ElHabitat class methodsFor: 'estado actual del habitat' stamp: 'chiara 4/23/2022 16:03:51'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevosPorFirmaGenetica sum: [ : unNumero | unNumero ] ifEmpty: [ 0 ].! !

!ElHabitat class methodsFor: 'estado actual del habitat' stamp: 'chiara 4/24/2022 20:44:03'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!ElHabitat class methodsFor: 'estado actual del habitat' stamp: 'chiara 4/23/2022 15:03:44'!
cantidadDePolillas
	^cantidadDePolillas.! !

!ElHabitat class methodsFor: 'estado actual del habitat' stamp: 'chiara 4/21/2022 20:31:26'!
existenOrugasEnHabitat
	^cantidadDeOrugas > 0.! !

!ElHabitat class methodsFor: 'estado actual del habitat' stamp: 'chiara 4/23/2022 14:54:20'!
existenPolillasEnHabitat
	^cantidadDePolillas > 0.! !


!ElHabitat class methodsFor: 'privado' stamp: 'chiara 4/24/2022 20:43:41'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self agregarOrugaEnHabitat.
	self agregarOrugaEnHabitat.
	self agregarPolillaEnHabitat.! !

!ElHabitat class methodsFor: 'privado' stamp: 'chiara 4/24/2022 22:22:22'!
retrocederElHabitatAlInicioDeLosTiempos
	cantidadDeHuevosPorFirmaGenetica := Dictionary new.
	cantidadDeOrugas := 0.
	cantidadDePolillas  := 0.! !


!ElHabitat class methodsFor: 'desarrollo de población del habitat' stamp: 'chiara 4/21/2022 20:08:08'!
agregarOrugaEnHabitat
	cantidadDeOrugas := cantidadDeOrugas + 1! !

!ElHabitat class methodsFor: 'desarrollo de población del habitat' stamp: 'chiara 4/23/2022 14:57:53'!
agregarPolillaEnHabitat
	cantidadDePolillas  := cantidadDePolillas + 1.! !

!ElHabitat class methodsFor: 'desarrollo de población del habitat' stamp: 'chiara 4/21/2022 20:26:24'!
consumirOrugaDelHabitat
	cantidadDeOrugas := cantidadDeOrugas - 1 .! !

!ElHabitat class methodsFor: 'desarrollo de población del habitat' stamp: 'chiara 4/23/2022 14:55:45'!
consumirPolillaDelHabitat
	cantidadDePolillas := cantidadDePolillas - 1.! !

!ElHabitat class methodsFor: 'desarrollo de población del habitat' stamp: 'chiara 4/23/2022 16:16:04'!
depositarHuevoDeAvispaEnHabitat: unProgenitor
	| cantidadDeHuevosPorFirmaGeneticaActual |
	cantidadDeHuevosPorFirmaGeneticaActual := cantidadDeHuevosPorFirmaGenetica  at: unProgenitor ifAbsent: [0].
	cantidadDeHuevosPorFirmaGenetica  at: unProgenitor put: cantidadDeHuevosPorFirmaGeneticaActual + 1.! !

!ElHabitat class methodsFor: 'desarrollo de población del habitat' stamp: 'chiara 4/24/2022 19:59:59'!
intentarConsumirHuevoDelHabitat: avispaLadrona
	| firmasConHuevos firmaGeneticaARobar cantidadDeHuevosDeFirmaPrevioARobar|
	firmasConHuevos := cantidadDeHuevosPorFirmaGenetica keys select: [:firmaGenetica | (cantidadDeHuevosPorFirmaGenetica at: firmaGenetica) > 0 and: [avispaLadrona firmaGeneticaDeAvispa ~= firmaGenetica ] ].
	(firmasConHuevos isEmpty) ifTrue: [ ^false ] ifFalse: [
		firmaGeneticaARobar := firmasConHuevos at: 1.
		cantidadDeHuevosDeFirmaPrevioARobar := cantidadDeHuevosPorFirmaGenetica at: firmaGeneticaARobar.
		cantidadDeHuevosPorFirmaGenetica at: firmaGeneticaARobar put: cantidadDeHuevosDeFirmaPrevioARobar - 1.
		^true.
		]! !


!ElHabitat class methodsFor: '--** private fileout/in **--' stamp: 'chiara 4/24/2022 22:57:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosPorFirmaGenetica := ((Dictionary new) add: ('cantidadDeHuevosConFirmaGeneticaAvispaPolly'->1); yourself).
	cantidadDeOrugas := 0.
	cantidadDePolillas := 1.! !


!classDefinition: #LaAvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaLara class' category: 'AvispasYAbejasParte2'!
LaAvispaLara class
	instanceVariableNames: 'firmaGeneticaDeAvispaLara'!

!LaAvispaLara class methodsFor: 'publico' stamp: 'chiara 4/24/2022 18:46:26'!
firmaGeneticaDeAvispa
	^firmaGeneticaDeAvispaLara.! !


!LaAvispaLara class methodsFor: 'funciones vitales' stamp: 'chiara 4/24/2022 20:10:44'!
intentarReproducirse
	(ElHabitat intentarConsumirHuevoDelHabitat: LaAvispaLara) ifTrue: [
	ElHabitat depositarHuevoDeAvispaEnHabitat: firmaGeneticaDeAvispaLara ].! !


!LaAvispaLara class methodsFor: '--** private fileout/in **--' stamp: 'chiara 4/24/2022 22:57:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	firmaGeneticaDeAvispaLara := 'cantidadDeHuevosConFirmaGeneticaAvispaLara'.! !


!classDefinition: #LaAvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOriana class' category: 'AvispasYAbejasParte2'!
LaAvispaOriana class
	instanceVariableNames: 'firmaGeneticaDeAvispasOrianaYOrnella'!

!LaAvispaOriana class methodsFor: 'funciones vitales' stamp: 'chiara 4/24/2022 20:10:34'!
intentarReproducirse
	(ElHabitat existenOrugasEnHabitat) ifTrue: [ 
		ElHabitat consumirOrugaDelHabitat .
		ElHabitat depositarHuevoDeAvispaEnHabitat: firmaGeneticaDeAvispasOrianaYOrnella ].! !


!LaAvispaOriana class methodsFor: 'publico' stamp: 'chiara 4/24/2022 18:29:56'!
firmaGeneticaDeAvispa
	^firmaGeneticaDeAvispasOrianaYOrnella.! !


!LaAvispaOriana class methodsFor: '--** private fileout/in **--' stamp: 'chiara 4/24/2022 22:57:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	firmaGeneticaDeAvispasOrianaYOrnella := 'cantidadDeHuevosConFirmaGeneticaAvispasOrianaYOrnella'.! !


!classDefinition: #LaAvispaOrnella category: 'AvispasYAbejasParte2'!
LaAvispaOriana subclass: #LaAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOrnella class' category: 'AvispasYAbejasParte2'!
LaAvispaOrnella class
	instanceVariableNames: ''!

!LaAvispaOrnella class methodsFor: '--** private fileout/in **--' stamp: 'chiara 4/24/2022 22:57:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	firmaGeneticaDeAvispasOrianaYOrnella := 'cantidadDeHuevosConFirmaGeneticaAvispasOrianaYOrnella'.! !


!classDefinition: #LaAvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaPolly class' category: 'AvispasYAbejasParte2'!
LaAvispaPolly class
	instanceVariableNames: 'firmaGeneticaDeAvispaPolly'!

!LaAvispaPolly class methodsFor: 'publico' stamp: 'chiara 4/23/2022 22:23:13'!
firmaGeneticaDeAvispa
	^firmaGeneticaDeAvispaPolly.! !


!LaAvispaPolly class methodsFor: 'funciones vitales' stamp: 'chiara 4/24/2022 20:10:34'!
intentarReproducirse
	(ElHabitat existenPolillasEnHabitat) ifTrue: [ 
		ElHabitat consumirPolillaDelHabitat .
		ElHabitat depositarHuevoDeAvispaEnHabitat: firmaGeneticaDeAvispaPolly].! !


!LaAvispaPolly class methodsFor: '--** private fileout/in **--' stamp: 'chiara 4/24/2022 22:57:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	firmaGeneticaDeAvispaPolly := 'cantidadDeHuevosConFirmaGeneticaAvispaPolly'.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'chiara 4/24/2022 20:09:38'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'chiara 4/24/2022 20:09:38'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'chiara 4/24/2022 20:09:38'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'chiara 4/24/2022 20:09:38'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'chiara 4/24/2022 20:09:38'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'chiara 4/24/2022 20:10:21'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'chiara 4/24/2022 20:10:21'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'chiara 4/24/2022 20:10:21'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'chiara 4/24/2022 20:10:51'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'chiara 4/24/2022 20:10:51'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'chiara 4/24/2022 20:10:51'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'chiara 4/24/2022 20:10:51'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'chiara 4/24/2022 20:09:38'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'chiara 4/24/2022 20:09:38'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'chiara 4/24/2022 20:10:51'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'chiara 4/24/2022 20:10:21'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'chiara 4/24/2022 20:10:44'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'chiara 4/24/2022 20:10:44'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'chiara 4/24/2022 20:10:51'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'chiara 4/24/2022 20:10:44'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/24/2022 20:10:44'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDe: LaAvispaLara .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/24/2022 20:09:38'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDe: LaAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/24/2022 20:10:21'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDe: LaAvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/24/2022 20:10:51'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDe: LaAvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/24/2022 20:10:34'!
habitat
	^ElHabitat
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/23/2022 15:00:45'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat hacerQueElHabitatTengaLosRecursosSuficientes.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/24/2022 20:10:44'!
laAvispaLara
	^LaAvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/24/2022 20:09:38'!
laAvispaOriana
	^LaAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/24/2022 20:10:21'!
laAvispaOrnella
	^LaAvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/24/2022 20:10:51'!
laAvispaPolly
	^LaAvispaPolly.	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/21/2022 20:12:58'!
queElHabitatTengaDosOrugasMas
	self habitat agregarOrugaEnHabitat .
	self habitat agregarOrugaEnHabitat.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/23/2022 15:03:10'!
queElHabitatTengaDosPolillasMas
	self habitat agregarPolillaEnHabitat.
	self habitat agregarPolillaEnHabitat.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/21/2022 20:08:49'!
queElHabitatTengaUnaOrugaMas
	self habitat agregarOrugaEnHabitat.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/23/2022 15:02:49'!
queElHabitatTengaUnaPolillaMas
	self habitat agregarPolillaEnHabitat .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'chiara 4/24/2022 22:22:22'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat retrocederElHabitatAlInicioDeLosTiempos.! !

ElHabitat initializeAfterFileIn!
LaAvispaLara initializeAfterFileIn!
LaAvispaOriana initializeAfterFileIn!
LaAvispaOrnella initializeAfterFileIn!
LaAvispaPolly initializeAfterFileIn!