# SPDX-License-Identifier: MIT

CC=gcc
# Uncomment the -DHW_* flag to compile for a specific hardware if you want to have it as a static library.
# then run `make clean` and `make`.
CFLAGS=-O2 -Wall -g -fPIE # -DHW_RPI4
LDFLAGS = -lpthread

SRCS = 360-w-gadget.c usb_descriptors.c usb_io.c usb_helpers.c example.c
SRCS_LIB = 360-w-gadget.c usb_descriptors.c usb_io.c usb_helpers.c 
OBJS = $(SRCS:.c=.o)
OBJS_LIB = $(SRCS_LIB:.c=.o)
TARGET = example
STATIC_LIB = lib360wgadget.a

all: $(TARGET) $(STATIC_LIB)

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)

$(STATIC_LIB): $(OBJS_LIB)
	ar rcs $@ $(OBJS_LIB)

.PHONY: rpi0_2
rpi0_2:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_RPI0_2" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)  

.PHONY: rpi4
rpi4: 
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_RPI4" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: rpi5
rpi5:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_RPI5" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: nanopi-neo2
nanopi-neo2:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_NANOPI_NEO2" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: usb-armory-mk2
usb-armory-mk2:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_USB_ARMORY_MK2" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: orange-pi-pc
orange-pi-pc:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_ORANGE_PI_PC" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: khadas-vim1
khadas-vim1:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_KHADAS_VIM1" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: thinkpad-x1
thinkpad-x1:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_THINKPAD_X1" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: nxp-imx8mp
nxp-imx8mp:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_NXP_IMX8MP" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: beaglebone-black
beaglebone-black:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_BEAGLEBONE_BLACK" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: beaglebone-ai
beaglebone-ai:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_BEAGLEBONE_AI" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: ec3380-ab
ec3380-ab:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_EC3380_AB" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: odroid-c2
odroid-c2:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_ODROID_C2" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

.PHONY: generic
generic:
	$(MAKE) CFLAGS="$(CFLAGS) -DHW_GENERIC" $(TARGET)
	ar rcs $(STATIC_LIB) $(OBJS_LIB)

clean:
	rm -f $(OBJS) $(TARGET) $(STATIC_LIB)
