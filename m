#! c:/iverilog-x64/bin/vvp
:ivl_version "10.1 (stable)" "(v10_1_1)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "system";
:vpi_module "vhdl_sys";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_0000000000f8c8c0 .scope module, "test" "test" 2 10;
 .timescale 0 0;
v00000000027d2340_0 .var "d0", 0 0;
v00000000027d23e0_0 .var "d1", 0 0;
v00000000027d2480_0 .var "d2", 0 0;
v00000000027d2520_0 .var "d3", 0 0;
v00000000027d3330_0 .net "out", 0 0, L_00000000027d31f0;  1 drivers
v00000000027d2f70_0 .var "s0", 0 0;
v00000000027d2610_0 .var "s1", 0 0;
S_0000000000f8ca40 .scope module, "sex" "mux4_1" 2 13, 2 1 0, S_0000000000f8c8c0;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "d0"
    .port_info 1 /INPUT 1 "d1"
    .port_info 2 /INPUT 1 "d2"
    .port_info 3 /INPUT 1 "d3"
    .port_info 4 /INPUT 1 "s0"
    .port_info 5 /INPUT 1 "s1"
    .port_info 6 /OUTPUT 1 "out"
v0000000002742720_0 .net *"_s0", 0 0, L_00000000027d3150;  1 drivers
v0000000002778a50_0 .net *"_s2", 0 0, L_00000000027d3470;  1 drivers
v0000000002778af0_0 .net "d0", 0 0, v00000000027d2340_0;  1 drivers
v00000000027427c0_0 .net "d1", 0 0, v00000000027d23e0_0;  1 drivers
v0000000002742860_0 .net "d2", 0 0, v00000000027d2480_0;  1 drivers
v0000000002742900_0 .net "d3", 0 0, v00000000027d2520_0;  1 drivers
v00000000027429a0_0 .net "out", 0 0, L_00000000027d31f0;  alias, 1 drivers
v0000000002742a40_0 .net "s0", 0 0, v00000000027d2f70_0;  1 drivers
v00000000027d2210_0 .net "s1", 0 0, v00000000027d2610_0;  1 drivers
L_00000000027d3150 .functor MUXZ 1, v00000000027d2480_0, v00000000027d2520_0, v00000000027d2610_0, C4<>;
L_00000000027d3470 .functor MUXZ 1, v00000000027d2340_0, v00000000027d23e0_0, v00000000027d2610_0, C4<>;
L_00000000027d31f0 .functor MUXZ 1, L_00000000027d3470, L_00000000027d3150, v00000000027d2f70_0, C4<>;
    .scope S_0000000000f8c8c0;
T_0 ;
    %vpi_call 2 15 "$monitor", "d0=%b,d1=%b,d2=%b,d3=%b,s0=%b,s1=%b,out=%b", v00000000027d2340_0, v00000000027d23e0_0, v00000000027d2480_0, v00000000027d2520_0, v00000000027d2f70_0, v00000000027d2610_0, v00000000027d3330_0 {0 0 0};
    %end;
    .thread T_0;
    .scope S_0000000000f8c8c0;
T_1 ;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v00000000027d2340_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v00000000027d23e0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v00000000027d2480_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v00000000027d2520_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v00000000027d2f70_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v00000000027d2610_0, 0, 1;
    %end;
    .thread T_1;
# The file index is used to find the file name in the following table.
:file_names 3;
    "N/A";
    "<interactive>";
    "mux4to1.v";
