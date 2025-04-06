# Programación funcional y en entorno de datos - Prueba práctica final - Resultados fútbol

La prueba consistirá en la programación en haskell de consultas al conjunto de datos contenidos en el archivo `key_stats.csv` respetando los requisitos establecidos y que figuran en el enunciado: "Incluir obligatoriamente una función `fold` y al menos dos de las siguientes funciones de orden superior: `zip`, `map`, `filter`."

El conjunto de datos elegidos recoge estadísticas relativas a la "Liga de Campeones" del año 2021. El contenido del archivo `csv` incluye los siguientes campos:

- `player_name` nombre del jugador. Ejemplo: Benzema
- `club` club al que pertenece. Ejemplo: Real Madrid
- `position` posición que ocupa en el terreno de juego. Ejemplo: Forward (delantero)
- `minutes_played` minutos que ha jugado a lo largo del campeonato. Ejemplo: 1106
- `match_played` número de partidos en los que ha jugado. Ejemplo: 12
- `goals` número de goles que ha marcado. Ejemplo: 15
- `assists` número de asistencias o pases para marcar gol. Ejemplo: 1
- `distance_covered` distancia en kilómetros recorrida durante el total de partidos jugados. Ejemplo: 121.5

Para la realización de las consultas se puede tomar como dato la lista de todas las posibles posiciones de los jugadores, que incluye defensa, delantero, portero y centrocampista.

```
positions = ["Defender","Forward","Goalkeeper","Midfielder"]
```

Como punto de partida se puede tomar el archivo `stats1.hs`, acceso simple al archivo `csv`, o el archivo `stats2.hs` donde se introduce el tipo de datos `Player`. El hecho de elegir uno u otro no tiene efecto alguno en la nota final.

El finalizar la primera parte de la prueba se deberá actualizar en el repositorio la solución a la consulta planteada.

## Realización de la prueba

La prueba tendrá lugar durante las dos horas de una sesión de prácticas de la asignatura de la última semana de mayo y se llevará a cabo de manera individual. La estructura de la prueba consta de tres partes:

### Enunciado
- Descripción: Elaboración de un enunciado de una o más consultas relativas a los datos proporcionados y que deben respetar una serie de requisitos relativos al uso de funciones de orden superior. El enunciado debe incluir:
    * Una descripción clara y concisa de la tarea que se debe llevar a cabo
    * Un ejemplo de ejecución de la consulta propuesta
- Ordenador: Se puede hacer uso del ordenador.
- Duración: 40 minutos.
- Resultado: El enunciado junto con el ejemplo en la plantilla en papel proporcionada.

### Solución
- Descripción: Se intercambiarán los enunciados elaborados en la fase anterior para proponer una posible solución a las consultas planteadas.
- Ordenador: NO se puede hacer uso del ordenador. 
- Duración: 40 minutos.
- Resultado: El código que resuelve la consulta propuesta en la plantilla de papel proporcionada.

### Corrección
- Descripción: Los autores de las consultas corregirán el código propuesto como solución.
- Ordenador: NO se puede hacer uso del ordenador.
- Duración: 15 minutos.
- Resultado: La calificación con una nota numérica de la solución a la consulta.

## Evaluación de la práctica

La nota de la parte práctica se corresponde con el 40% del total de la asignatura. La distribución sobre 100 dentro de ese 40% es como sigue:
- 10% prácticas semanales
- 90% práctica final:
    - 40% enunciado consulta
    - 50% solución consulta
    - 10% corrección consulta
