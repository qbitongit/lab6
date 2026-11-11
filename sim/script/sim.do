vlib work
vcom -93 -work work ../../src/top.vhd
vcom -93 -work work ../../src/alu.vhd
vcom -93 -work work ../../src/blipper.vhd
vcom -93 -work work ../../src/components.vhd
vcom -93 -work work ../../src/memory.vhd
vcom -93 -work work ../../src/double_dabble.vhd
vcom -93 -work work ../../src/nsl.vhd
vcom -93 -work work ../../src/seven_seg.vhd
vcom -93 -work work ../../src/synchronizer_1bit.vhd
vcom -93 -work work ../../src/synchronizer_2bit.vhd
vcom -93 -work work ../../src/synchronizer_8bit.vhd


vcom -93 -work work ../src/top_tb.vhd
vsim -voptargs=+acc top_tb
do wave.do
run 10000 ms
