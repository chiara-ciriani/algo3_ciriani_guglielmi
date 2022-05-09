# Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

Double dispatch es un mecanismo que despacha una llamada de función a diferentes funciones concretas.

En nuestro modelo, el primer llamado ejecuta el método del receptor que recibe un colaborador desconocido para realizar cierta operación aritmética. Mientras que en el segundo llamado ahora el receptor es el colaborador y ahora, al saber su clase, realiza la implementación correspondiente del método.
Básicamente, la idea de Double dispatch es intentar resolver la selección del método utilizando polimorfismo. Específicamente resuelve el problema de andar preguntando.
Por ejemplo, cuando queremos sumar un objeto de la clase número al objeto Entero en lugar de que el entero le pregunte de qué clase es al número a sumar, va a llamar a un método para que se encargue directamente el número.
La ventaja de esto es que si se desea agregar un nuevo tipo de objeto de la clase Número, nunca es necesario alterar el código existente, sino solo definir el mensaje de la operación aritmética en la nueva clase y los métodos de implementación correspondientes en cada una de las actuales clases.


# Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? 
¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas?  ¿cómo lo resuelven?

Los mensajes que tenemos del lado de Class en el System Browser son distintas formas de crear instancias. Cuando tiene sentido que el  mensaje lo responda el "concepto" este va a pertenecer a los mensajes de instancia. Creemos que definir mensajes de inicialización es una buena práctica para tener objetos con colaboradores designados al momento en que lo instanciamos.
Por ejemplo, cuando queremos instanciar una fracción indicamos with: para el numerador y over: para el denominador. Esto hace que la lógica de crear una función sea más sencilla porque crear un objeto Fracción sin numerador y denominador no tiene sentido, directamente no es válido y necesitamos tener un método de clase que nos permita crearla de esta forma.


# Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Un criterio que estamos usando para categorizar mensajes es en función de cuáles son de uso para nosotros y cuáles para afuera. Por un lado, están los privados al objeto que no esperamos que alguien los envíe desde afuera. Por el otro lado, podemos separar los públicos en varias categorías utilizando nombres relacionados al rol que están haciendo. Por ejemplo, todos los mensajes que imprimen algo se ponen en la categoría de printing. Justamente es una buena práctica categorizar los mensajes.


# Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” 
en la superclase? ¿para qué sirve?

El mensaje self subclassResponsibility significa que es responsabilidad de la subclase saber responder ese mensaje. Por ejemplo, todos los números saben multiplicarse pero los enteros y las fracciones se multiplican de forma distinta. Luego, dentro de la clase Número tenemos el método multiplicar implementado con self subclassResponsibility y es cada subclase (Fracción y Entero) la que tiene la
implementación correspondiente al método multiplicar.
A su vez, en nuestro modelo, por ejemplo, podríamos tener el caso en el que quisieramos crear una nueva subclase de números, imaginemos: los números 
complejos. En ese caso, al ser una subclase de la clase Números, y habiendo definido ese mensaje en la superclase, le estamos diciendo de 
alguna forma a esta nueva subclase de Complejos que debe saber responder el mensaje definido en la superclase. En otras palabras, si el
mensaje definido en la superclase es el de "beMultipliedByAnEntero" la subclase Complejos tiene la obligación de saber cómo multiplicar 
una instancia de Complejos por un entero.
Podríamos decir entonces que el método que está implementado con self subclassResponisbility es un mensaje abstracto, es decir, un mensaje 
que no tiene ninguna implementacion sino que lo van a implementar alguna de las subclases en la jerarquía. 


# No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

Cuando rompemos encapsulamiento le estamos pidiendo el colaborador al objeto y estamos directamente "hablando" con el colaborador. El problema
de esto es la mantenibilidad ya que si todos los objetos exponen a los colaboradores, todos empiezan a relacionarse con todos lo cual sería alto
acoplamiento. 
La idea es evitar romper encapsulamiento, es decir, evitar que ciertos objetos se conozcan más de lo que deberían y no estar exponiendo a
sus colaboradores. Básicamente, que cada objeto tenga su responsabilidad delegandole tareas y que ellos mismos lo resuelvan.
La ventaja de evitar el encapsulamiento es que nos lleva a un diseño más acoplado ya que si exponemos a los colaboradores de un objeto y
otros objetos le pueden enviar mensajes, esos otros objetos pasan a conocer un objeto que antes no conocían.

