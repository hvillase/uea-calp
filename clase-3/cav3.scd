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
SynthDef(\misinte,{|frec=440, amp=0.5|
	var sen;
	sen=SinOsc.ar(frec, 0, amp);
	Out.ar(0, sen)
}).add
);

// Llamar a un SynthDef
a=Synth(\misinte,[\frec, 680]);

// liberar un Synth
a.free;

// ayuda de SynthDef
SynthDef.help;

// envolvente

// Pdef o definicón de patrón