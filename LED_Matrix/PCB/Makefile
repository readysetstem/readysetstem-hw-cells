COMMON_DIR=$(abspath $(shell git rev-parse --show-toplevel)/../readysetstem-hw-base/PCB/)
MAK=$(COMMON_DIR)/master.mak
ifeq ($(wildcard $(MAK)),)
  $(error Master Makefile not found!)
endif
include $(MAK)

