
// 1 abre el documento sintes y declara el código
// 2 declara los sintes de efectos
// 3 delcra los sintes de ondas y cambia el parámetro \out entre los valores 9, 11, 13, 15, 17

// --- Sintes de efectos
(
Synth(\rev); // 9 Reverberación
Synth(\dly); // 11 Delay
Synth(\lpf); // 13 Low Pass Filter
Synth(\hpf); // 15 High Pass Filter
Synth(\bpf); // 17 Band Pass Filter
);

// --- Sintes de ondas

Synth(\sine, [\out, 0]);
Synth(\tri, [\out, 0]);
Synth(\pulse, [\out, 0]);
Synth(\saw, [\out, 0]);
Synth(\wnoise, [\out, 0]);

// -- Secuencia con efectos

(
Pdef(\efectos, Pbind(\instrument, \saw,
	\dur, Pseq([0.375, 0.5, Pn(0.125, 3), 0.5], inf),
	\amp, 0.5,
	\midinote, Pseq([60, 62, 64, 65, 72], inf),
	\out, 11
)).stop;
);