#
# LED Matrix Makefile
#
# Copyright (c) 2016, Ready Set STEM
#
# Tested with CrossPack for AVR Development on Mac OS X 10.9.5

SRC=LED_Matrix_ATINY48/LED_Matrix_ATINY48.c
ELF=$(SRC:%.c=%.elf)
HEX=$(SRC:%.c=%.hex)

LFUSE=0xee
HFUSE=0xdf
EFUSE=0x07

AVRDUDE=avrdude -P usb -p t48 -c stk500

all: $(HEX)

.INTERMEDIATE: $(ELF)
$(ELF): $(SRC)
	avr-gcc -Os -mmcu=attiny48 -std=gnu99 $< -o $@

$(HEX): $(ELF)
	avr-objcopy -j .text -j .data -O ihex $< $@

fuses:
	$(AVRDUDE) -U lfuse:w:$(LFUSE):m

verify_fuses:
	$(eval LFUSE_ACTUAL=$(shell $(AVRDUDE) -U lfuse:r:-:h))
	@echo "################# Verifying LFUSE #######################"
	test $$(($(LFUSE_ACTUAL))) == $$(($(LFUSE)))
	$(eval HFUSE_ACTUAL=$(shell $(AVRDUDE) -U hfuse:r:-:h))
	@echo "################# Verifying HFUSE #######################"
	test $$(($(HFUSE_ACTUAL))) == $$(($(HFUSE)))
	$(eval EFUSE_ACTUAL=$(shell $(AVRDUDE) -U efuse:r:-:h))
	@echo "################# Verifying EFUSE #######################"
	test $$(($(EFUSE_ACTUAL))) == $$(($(EFUSE)))

safeinstall:: verify_fuses
fullinstall:: fuses
safeinstall fullinstall install:: $(HEX)
	$(AVRDUDE) -e -U flash:w:$(HEX)

clean:
	rm -f $(ELF) $(HEX)

help:
	@echo "Make target rules:"
	@echo "    all (default)     Build HEX image"
	@echo "    fuses             Burn fuses"
	@echo "    verify_fuses      Verify fuses are correct"
	@echo "    install           Flash HEX image to target"
	@echo "    safeinstall       Verify fuses and then install"
	@echo "    fullinstall       Burn fuses and then install"
