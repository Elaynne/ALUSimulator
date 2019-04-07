onerror {quit -f}
vlib work
vlog -work work ULA8bits.vo
vlog -work work ULA8bits.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ULA8bits_vlg_vec_tst
vcd file -direction ULA8bits.msim.vcd
vcd add -internal ULA8bits_vlg_vec_tst/*
vcd add -internal ULA8bits_vlg_vec_tst/i1/*
add wave /*
run -all
