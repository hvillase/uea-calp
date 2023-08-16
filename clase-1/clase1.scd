// Creación audiovisual con lenguajes de programación sesión 1

"hola mundo".postln;

// presiona: ctrl + enter

// esto es comentario

// estas son cadenas de caracteres (string)
"palabras"
"3+3"
"45 cosas"

// esto es una operación matemática
3 + 3
3 * 8

// caracteres necesarios
~
()
[]
{}
;

// variable local dentro de un contexto
// el uso de ; indica salto de línea
(
var hola=3;
hola + 5
)

// variables globales usando las letras (poco recomendadas)

a=3
a
b="hola"
b
a=5
a

// variables globales con tilde
~hola = 8
~hola + 7

// prendemos supercollider
s.boot

// hacemos sonar una onda sinoidal de 940 Hertz
{SinOsc.ar(940, 0, 0.7)}.play

// Venos la ayuda de SinOsc
SinOsc.help
