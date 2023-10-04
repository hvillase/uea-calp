// secuenciador de 16 pasos
\dur, 0.25,
\amp, Pseq([0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5],inf)

// efectos y sus parámetros

// Reverb
// mix: entre 0 y 1. Cantidad de efecto
// room: entre 0 y 1. Sensación de espacio
// damp: entre 0 y 1. Amortiguamiento de graves

~rev.set(\mix, 0.5, \room, 0.5, \damp, 0.5);

// Delay
// dt o delay time. Tiempo entre repticiones
// dct o decay time. Cantidad de repeticiones en tiempo

~dly.set(\dt, 0.25, \dct, 1.5);

// filtro pasa bajo
// cfl o corte de frecuencia bajo en Hertz

~lpf.set(\cfl, 5000);

// filtro pasa alto
// cfh o corte de frecuencia alto en Hertz

~hpf.set(\cfh, 500);

// fitro pasa banda
// cfb o corte de frecuencia en Hertz
// rq amplitud del filtro

~bpf.set(\cfb, 1200, \rq, 1);