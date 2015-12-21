SLDS = base candy charhan charhan2 contest contest2 ct eye hoe hoehoe lattice \
lattice2 noe piero1 pika rot shuttle ss20 tron

default: test

clean:
	rm -f unicaml suiteki sim lib min-rt.unicaml min-rt.s sld/*.ppm sld/*.ppm.tmp sld/*.png *~

test: $(SLDS:%=sld/%.unicaml.ppm)

prepare:
	./prepare.sh

sld/%.unicaml.ppm: sld/%.sld min-rt.unicaml prepare
	./sim -i $< -o $@.tmp min-rt.unicaml
	mv $@.tmp $@

min-rt.unicaml: min-rt.s
	./suiteki $< -o $@ -l lib/libmincaml.S

min-rt.s: min-rt.ml
	./unicaml min-rt
