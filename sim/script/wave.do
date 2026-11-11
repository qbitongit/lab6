onerror {resume}
radix define States {
    "7'b1000000" "0" -color "red",
    "7'b1111001" "1" -color "red",
    "7'b0100100" "2" -color "red",
    "7'b0110000" "3" -color "red",
    "7'b0011001" "4" -color "red",
    "7'b0010010" "5" -color "red",
    "7'b0000010" "6" -color "red",
    "7'b1111000" "7" -color "red",
    "7'b0000000" "8" -color "red",
    "7'b0011000" "9" -color "red",
	"7'b0001000" "A" -color "red",
	"7'b0000011" "B" -color "red",
	"7'b1000110" "C" -color "red",
	"7'b0100001" "D" -color "red",
	"7'b0000110" "E" -color "red",
	"7'b0001110" "F" -color "red",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/uut/clock
add wave -noupdate /top_tb/uut/rst
add wave -noupdate /top_tb/uut/execute
add wave -noupdate -radix Unsigned /top_tb/uut/num_in
add wave -noupdate /top_tb/uut/state_leds
add wave -noupdate -radix States /top_tb/uut/hex0
add wave -noupdate -radix States /top_tb/uut/hex1
add wave -noupdate -radix States /top_tb/uut/hex2

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 400
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {400250 ps} {505250 ps}