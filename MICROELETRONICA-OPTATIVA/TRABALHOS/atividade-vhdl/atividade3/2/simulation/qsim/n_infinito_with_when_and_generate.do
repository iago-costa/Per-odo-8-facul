onerror {exit -code 1}
vlib work
vlog -work work n_infinito_with_when_and_generate.vo
vlog -work work teste01.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.address_decoder_vlg_vec_tst -voptargs="+acc"
vcd file -direction n_infinito_with_when_and_generate.msim.vcd
vcd add -internal address_decoder_vlg_vec_tst/*
vcd add -internal address_decoder_vlg_vec_tst/i1/*
run -all
quit -f
