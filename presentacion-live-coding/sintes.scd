// SynthDefs de sintesis
s.boot;

(

(// sinuidal (sine)
SynthDef(\sine, {|frec=440, pan=0, at=0.01, rel=0.1, amp=0.5|
	var sen, paneo, env;
	sen=SinOsc.ar(frec, 0, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(0, paneo * env)
}).add
);

(// triangular (tri)
SynthDef(\tri, {|frec=440, pan=0, at=0.01, rel=0.1, amp=0.5|
	var sen, paneo, env;
	sen=LFTri.ar(frec, 0, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(0, paneo * env)
}).add
);

(// cuadrada (pulse)
SynthDef(\pulse, {|frec=440, pw=0.5, pan=0, at=0.01, rel=0.1, amp=0.5|
	var sen, paneo, env;
	sen=Pulse.ar(frec, pw, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(0, paneo * env)
}).add
);

(// diente de sierra (saw)
SynthDef(\saw, {|frec=440, pan=0, at=0.01, rel=0.1, amp=0.5|
	var sen, paneo, env;
	sen=Saw.ar(frec, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(0, paneo * env)
}).add
);

(// ruido blanco (white noise)
SynthDef(\wnoise, {|pan=0, at=0.01, rel=0.1, amp=0.5|
	var sen, paneo, env;
	sen=WhiteNoise.ar(amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(0, paneo * env)
}).add
);

(// sinuidal con envolvente de frecuencia (sine)
SynthDef(\sine2, {|frec=440, pan=0, at=0.01, rel=0.1, amp=0.5|
	var sen, paneo, env;
	sen=EnvGen.kr(Env.new([frec, frec * 1.02, frec * 1.12, frec], [0.1, 0.1, 3]), doneAction:0);
	sen=SinOsc.ar(sen, 0, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(0, paneo * env)
}).add
);

);
