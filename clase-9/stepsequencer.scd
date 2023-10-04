

(
Pdef(\sec16,
	Pbind(\instrument, \wnoise,
	\dur, 1/4,
\amp, Pseq([0.5, 0, 0.5, 0.5, 0, 0.5, 0.5, 0, 0.5, 0, 0.5, 0.5, 0.5, 0.5, 0, 0.5],inf),
		\out, 17
)).stop
);

(
Pdef(\bateria, Ppar([
	Pbind(\instrument, \wnoise,
		\dur, 1/4,
\amp, Pseq([0.5, 0, 0.5, 0.5, 0, 0.5, 0.5, 0, 0.5, 0, 0.5, 0.5, 0.5, 0.5, 0, 0.5],inf),
	),
	Pbind(\instrument, \sine,
		\dur, 1/4,
\amp, Pseq([0.5, 0, 0, 0, 0.5, 0, 0, 0, 0.5, 0, 0, 0, 0.5, 0, 0, 0],inf),
	)
])).stop
)