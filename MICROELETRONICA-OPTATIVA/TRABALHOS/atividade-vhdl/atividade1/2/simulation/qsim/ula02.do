onerror {exit -code 1}
vlib work
vlog -work work ula02.vo
vlog -work work ula02.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ula02_vlg_vec_tst -voptargs="+acc"
vcd file -direction ula02.msim.vcd
vcd add -internal ula02_vlg_vec_tst/*
vcd add -internal ula02_vlg_vec_tst/i1/*
run -all
quit -f
