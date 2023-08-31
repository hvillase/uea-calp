// SynthDefs
(

(// sine
SynthDef(\sine, {|frec=440, pan=0, at=0.01, rel=0.1, amp=0.5|
	var sen, paneo, env;
	sen=SinOsc.ar(frec, 0, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0],[at,rel]),doneAction:2);
	Out.ar(0, paneo*env)
}).add
);

(// tri
SynthDef(\tri, {|frec=440, pan=0, at=0.01, rel=0.1, amp=0.5|
	var sen, paneo, env;
	sen=LFTri.ar(frec, 0, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0],[at,rel]),doneAction:2);
	Out.ar(0, paneo*env)
}).add
);

);