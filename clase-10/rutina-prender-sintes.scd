// Fork para prender en orden el documento de sintes

(
s.waitForBoot(
	{
		fork{"Primero declara los sintes".postln; 2.wait;
		"Dos segundos depués prende efectos".postln}
});
);