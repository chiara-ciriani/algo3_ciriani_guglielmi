# Sobre implementar funcionalidad

Cuando los implementamos, los tests no pasaron los tres de una ya que nuestra manera de encarar los tests fue hacer lo justo y necesario para que pasaran las pruebas. Por ejemplo, asignando los recursos específicamente a lo que necesitabamos para las pruebas. Primero, para el test 02 en hacerQueElHabitatTengaLosRecursosSuficientes asignábamos la cantidad de orugas a 1. Luego, cuando vimos el test 03 y que necesitábamos 2 orugas, lo cambiamos y asignamos la cantidad de orugas a 2. Pero, finalmente, terminamos haciendo un método para agregar orugas donde en vez de asignar un número a la cantidad de orugas, incrementa esta cantidad de a uno.
Por lo tanto, nuestra idea fue implementar esta funcionalidad de a partes. Primero haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03. 
Nuestra opinión acerca de implementar esa funcionalidad de esta forma es que es conveniente empezar por lo justo y necesario para que pase las pruebas. La idea es no complicarlo y que cumpla lo que tiene que hacer. Pero, una vez que el problema nos lo exige, nos parece mejor buscar la forma de hacerlo más escalable.

# Sobre código repetido

No creemos que nos haya quedado mucho código repetido ya que para modelar las avispas observamos que LaAvispaOriana y LaAvispaOrnella se comportaban de la misma manera y con la misma firma genética, por lo tanto, esto nos llevó a establecer una relación de "parentesco" entre ambas. Gracias a esto nos ahorramos de repetir código en ambos objetos. Este no fue el caso con LaAvispaPolly y LaAvispaLara ya que su función vital de reproducirse tenía otras características. 
Además, no consideramos de utilidad, de acuerdo a nuestro dominio de problema, modelar como objetos a las orugas y polillas porque en este contexto no tienen ninguna función. 
En nuestro modelo cada avispa es responsable de chequear que en el habitat existan los recursos suficientes para poder reproducirse. Esto tiene sentido porque el habitat no tendría porque encargarse de indicarle a la avispa si puede reproducirse o no. El habitat lo único  que sabe es qué recursos tiene, y en base a eso la avispa tiene la responsabilidad de decidir si eso es suficiente para que se reproduzca.
Por este motivo, nosotros lo implementamos de esta forma y creemos que es la más lógica.

# Sobre código repetido 2

Como mencionamos en la pregunta anterior y de acuerdo a lo que vimos en la clase del jueves, nuestra manera de simplificar el problema fue estableciendo la relación de "parentesco" entre LaAvispaOriana y LaAvispaOrnella. En este caso, Oriana es el padre de Ornella, es decir, el objeto prototípico en el cual el objeto está basado.
Para guardar los huevos de cada avispa decidimos usar un diccionario donde cada clave era la firma genética y su valor la cantidad de huevos correspondientes. Para la clave nosotros decidimos que cada avispa tenga como colaborador interno un string que represente la firma genética. 
El propósito de tener la clave como un colaborador interno de cada avispa era por el hecho de que si por cualquier motivo después queríamos cambiarla, teníamos que estar cambiándola en todos los lados donde accedíamos al diccionario. Por ejemplo, en el método de depositarHuevoDeAvispaEnHabitat donde accedíamos para aumentar en uno la cantidad de huevos de la firma genética y en el método cantidadDeHuevosConLaFirmaGeneticaDe: donde accedemos al diccionario con la clave para obtener la cantidad de huevos con la firma que deseamos.
Algo más básico hubiese sido, en vez de hacer un diccionario, hacer colaboradores internos en el objeto Habitat donde cada uno sea una firma genética distinta para que el Habitat sepa la cantidad de huevos de cada una. Pero, no creemos que sea más sencillo porque es más desorganizado y no es algo escalable. En cambio, al tener un diccionario se facilita el manejo de información ya que está toda en el mismo lugar.

