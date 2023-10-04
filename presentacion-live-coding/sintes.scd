// SynthDefs de sintesis y procesamiento
// Creación audiovisual con lenguajes de programación

s.boot;

// 1 activar los sintes y luego ir abajo al paso 2 para activar efectos
(

// --- Onda sinuidal (sine)
(
SynthDef(\sine, {|freq=440, pan=0, at=0.01, rel=0.1, amp=0.5, out=0|
	var sen, paneo, env;
	sen=SinOsc.ar(freq, 0, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(out, paneo * env)
}).add
);

// --- Onda triangular (tri)
(
SynthDef(\tri, {|freq=440, pan=0, at=0.01, rel=0.1, amp=0.5, out=0|
	var sen, paneo, env;
	sen=LFTri.ar(freq, 0, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(out, paneo * env)
}).add
);

// --- Onda cuadrada (pulse)
(
SynthDef(\pulse, {|freq=440, pw=0.5, pan=0, at=0.01, rel=0.1, amp=0.5, out=0|
	var sen, paneo, env;
	sen=Pulse.ar(freq, pw, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(out, paneo * env)
}).add
);

// --- Onda diente de sierra (saw)
(
SynthDef(\saw, {|freq=440, pan=0, at=0.01, rel=0.1, amp=0.5, out=0|
	var sen, paneo, env;
	sen=Saw.ar(freq, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(out, paneo * env)
}).add
);

// --- ruido blanco (white noise)
(
SynthDef(\wnoise, {|pan=0, at=0.01, rel=0.1, amp=0.5, out=0|
	var sen, paneo, env;
	sen=WhiteNoise.ar(amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(out, paneo * env)
}).add
);

// --- onda sinuidal con envolvente de frecuencia
(
SynthDef(\sine2, {|frec=440, pan=0, at=0.01, rel=0.1, amp=0.5, out=0|
	var sen, paneo, env;
	sen=EnvGen.kr(Env.new([frec, frec * 1.02, frec * 1.12, frec], [0.1, 0.1, 3]), doneAction:0);
	sen=SinOsc.ar(sen, 0, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0,1,0], [at, rel]), doneAction:2);
	Out.ar(out, paneo * env)
}).add
);

// Procesamineto de señal y efectos =======

// --- Reverberación - bus 9
(
SynthDef(\rev, {|in = 9, mix = 0.4, room = 0.9, damp = 0.1, amp = 1, gate = 1, out = 0|
	var sen, env;
	sen = FreeVerb.ar(InFeedback.ar(in, 2), mix, room, damp, amp);
	env = EnvGen.kr(Env.asr(0.01, 1, 0.1), gate, doneAction: 0);
	Out.ar(out, sen * env);
}).add
);

// --- Delay - bus 11, mdt = maxdelayTime, dt = delayTime, dct = decayTime
(
SynthDef(\dly, {|in = 11, mdt = 0.3, dt = 0.25, dct = 2, gate = 1, out = 0|
var del, env;
	del = CombL.ar(InFeedback.ar(in, 2), mdt, dt, dct);
	env = EnvGen.kr(Env.asr(0.01, 1, 0.01), gate, doneAction: 0);
	Out.ar(out, del * env);
}).add
);

// --- Filtro pasa bajos (lpf) - bus 13
(
SynthDef(\lpf, {|in = 13, cfl = 100, gate = 1,  out = 0|
	var lpf, env;
	lpf = LPF.ar(InFeedback.ar(in, 2), cfl, 1);
	env = EnvGen.kr(Env.asr(0.01, 1, 0.01), gate, doneAction: 0);
	Out.ar(out, lpf * env);
}).add
);

// --- Filtro pasa altos (hpf) - bus 15
(
SynthDef(\hpf, {|in = 15, cfh = 1000, gate = 1, out = 0|
	var hpf, env;
	hpf = HPF.ar(InFeedback.ar(in, 2), cfh, 1);
	env = EnvGen.kr(Env.asr(0.01, 1, 0.01), gate, doneAction: 0);
	Out.ar(out, hpf * env);
}).add
);

// --- Filtro pasa banda (bpf) - bus 17
(
SynthDef(\bpf, {|in = 17, cfb = 1000, rq = 1, gate = 1, out = 0|
	var bpf, env;
	bpf = BPF.ar(InFeedback.ar(in, 2), cfb, rq, 1);
	env = EnvGen.kr(Env.asr(0.01, 1, 0.01), gate, doneAction: 0);
	Out.ar(out, bpf * env);
}).add
);

);

// 2 activar efectos
(
~rev=Synth(\rev); // 9 Reverberación
~dly=Synth(\dly); // 11 Delay
~lpf=Synth(\lpf); // 13 Low Pass Filter
~hpf=Synth(\hpf); // 15 High Pass Filter
~bpf=Synth(\bpf); // 17 Band Pass Filter
);
