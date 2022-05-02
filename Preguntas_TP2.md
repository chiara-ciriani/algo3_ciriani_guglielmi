
# Abstracción de los tests 01 y 02

Ambos tests realizaban la misma tarea de evaluar el tiempo de ejecución de una tarea específica, por lo tanto, tenían código repetido. Usando el algoritmo para eliminar código repetido, observamos que ambos códigos funcionaban de la misma forma con la única diferencia siendo la tarea cuyo tiempo querían medir. 
Nuestra solución fue abstraerlo a un método aparte que de alguna forma funciona como un cronómetro para medir los tiempos de ejecución de una determinada acción. Por lo tanto, podemos decir que la entidad de la realidad creada es el cronómetro que funciona cronometrando los mensajes del modelo.

# Cómo representar en Smalltalk

Las formas de representar entes de la realidad en Smalltalk que conocemos hasta ahora son los objetos.
En la primera parte de la materia, desde el Denotative Object Browser vimos la forma de modelar entedes de la realidad a partir del paradigma de Prototipado donde existen objetos prototípicos que nos permiten representar objetos únicos. 
Reciéntemente, empezamos a trabajar con el System Browser que nos permite crear clases que son objetos que representan una idea/concepto. Además, una clase tiene instancias asociadas que, de acuerdo paradigma de subclasificación, cuyo comportamiento está definido por la clase.

# Teoría de Naur

La relación entre sacar código repetido creando abstracciones y la teoría del modelo/sistema del paper de Naur es que la acción de abstracción está vinculada con el conocimiento que poseen los programadores que están relacionados con el programa. El tipo de similitud que debe ser determinada para detectar el código repetido es accesible al ser humano que posee la teoría del programa. Es decir, es un proceso personal que es propio y tiene sentido para un programador con el conocimiento. Luego, teniendo una idea de las similitudes entre los nuevos requerimientos y los ya satisfechos por el programa, el programador es capaz de diseñar el cambio en el texto del programa que se debe realizar para implementar la modificación.
