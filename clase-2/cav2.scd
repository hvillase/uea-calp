// Creación audiovisual con lenguajes de programación sesión 2

// prendemos supercollider
s.boot
s.quit
// formas de onda
s.meter
s.scope
// SinOsc
{SinOsc.ar(500,0,0.7)!2}.play

// LFTri
{LFTri.ar(550,0,0.7)!2}.play
// Saw
{Saw.ar(600,0.5)!2}.play
// Pulse
{Pulse.ar(500,0.5,0.3)!2}.play

// WhiteNoise
{WhiteNoise.ar(0.2)!2}.play

// formas de ver las ondas con scope y freqscope

// SynthDef

(
SynthDef(\misinte,{|frec=440, amp=0.5|
	var sen;
	sen=SinOsc.ar(frec, 0, amp);
	Out.ar(0, sen)
}).add
)

a=Synth(\misinte,[\frec, 680])
a.free

SynthDef.help

// Llamar a un SynthDef