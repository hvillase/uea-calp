// Secuencias con sonidos

(
~son1 = Pdef(\son1, Pbind(\instrument, \audio,
	\dur, Pseq([0.25, 0.125, 0.125], inf),
	\sus, Pseq([0.04, 0.02], inf),
	\rel, Pseq([0.2, 0.1, 0.01, 0.02], inf),
	\rate, Pseq([1, 1.5, 1, 1, 1.8], inf),
	\sp, Pseq([0.1, 0.5, 0.75, 0.1, Pn(0.2, 4)], inf),
	\amp, 0.7
))
);

~son1.play.quant(4);
~son1.stop;

s.quit;