// secuencias

(
~sec1=Pdef(\sec, Pbind(\instrument, \sine,
	\dur, Pseq([0.5, 0.25, 0.25], inf),
	\amp, 0.3,
	\frec, Pseq([300, 400, 800, 890], inf)
)).play
);

(
~sec2=Pdef(\sec2, Pbind(\instrument, \tri,
	\dur, Pseq([0.5, 0.125, 0.125], inf),
	\amp, 0.2,
	\frec, Pseq([330, 430], inf)
)).play
);

~sec1.play;
~sec1.stop;

~sec2.play;
~sec2.play;