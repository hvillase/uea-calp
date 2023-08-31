// Creación audiovisual con lenguajes de programación
// Ejemplo 1 hydra + supercollider + pulsar
// En Pulsar los atajos de ejecución de código son distintos
// shift + enter para ejecutar una línea de código
// alt + enter para ejecutar lo que hay entre paréntesis

// prendemos supercollider
s.boot;
// apagamos supercollider
s.quit;

// SynthDef
(
SynthDef(\misinte, {|frec=440, amp=0.5|
	var sen, env;
	sen=SinOsc.ar(frec, 0, amp);
	env=EnvGen.kr(Env.new([0,1,0],[0.02,0.15]),doneAction:2);
	Out.ar(0, sen*env)
}).add
);

(
~sec1=Pdef(\sec,
	Pbind(\instrument, \misinte,
		\dur, Pseq([0.25, 0.25, 0.125], inf),
		\frec, Pseq([340, 500, 550, 650],inf),
		\amp, 0.7
	)
);
)

~sec1.play;
~sec1.stop;
