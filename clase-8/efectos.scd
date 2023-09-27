
// 1 Abre el documento sintes y declara el código
// 2 Declara los sintes de efectos
// 3 Declara los sintes de ondas y cambia el parámetro \out entre los valores 9, 11, 13, 15, 17

// --- Sintes de efectos
(
~rev=Synth(\rev); // 9 Reverberación
~dly=Synth(\dly); // 11 Delay
~lpf=Synth(\lpf); // 13 Low Pass Filter
~hpf=Synth(\hpf); // 15 High Pass Filter
~bpf=Synth(\bpf); // 17 Band Pass Filter
);

// --- Sintes de ondas

Synth(\sine, [\out, 11]);
Synth(\tri, [\out, 0]);
Synth(\pulse, [\out, 0]);
Synth(\saw, [\out, 11]);
Synth(\wnoise, [\out, 0]);

// -- Secuencia con efectos

(
Pdef(\efectos, Pbind(\instrument, \saw,
	\dur, Pseq([0.375, 0.5, Pn(0.125, 3), 0.5], inf),
	\amp, 0.5,
	\midinote, Pseq([60, 62, 64, 65, 72, Pn(67, 3), 60, 55], inf),
	\out, 11
)).stop.quant(4);
);