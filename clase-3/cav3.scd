// Creación audiovisual con lenguajes de programación sesión 3

// prendemos supercollider
s.boot;

// apagamos supercollider
s.quit;

// medidores
s.meter;
s.scope;
s.freqscope;

// SynthDef
(
SynthDef(\misinte, {|frec=440, amp=0.5|
	var sen, env;
	sen=SinOsc.ar(frec, 0, amp);
	env=EnvGen.kr(Env.new([0,1,0],[0.1,0.1]),doneAction:2);
	Out.ar(0, sen*env)
}).add
);

// Llamar a un SynthDef
a=Synth(\misinte,[\frec, rrand(550,780)]);

// liberar un Synth
a.free;

// ayuda de SynthDef
SynthDef.help;

// Envolventes
Env.help;
Env.new([0,1,0.5,0.5,0],[0.1,0.1,0.1,0.5]).plot;

// Pdef o definicón de patrón
Pattern.help;
Pbind.help;
Pdef.help;

(
~sec1=Pdef(\sec,
	Pbind(\instrument, \misinte,
		\dur, Pseq([0.25, 0.25, 0.125], inf),
		\frec, Pseq([340, 500, 550],inf),
		\amp, 1
	)
);
)

~sec1.play;
~sec1.stop;













