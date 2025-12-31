# File saved with Nlview 7.8.0 2024-04-26 e1825d835c VDI=44 GEI=38 GUI=JA:21.0 threadsafe
# 
# non-default properties - (restore without -noprops)
property -colorscheme classic
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 18
property maxzoom 7.5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlaycolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 4
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 18
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 1
property timelimit 1
#
module new main work:main:NOFILE -nosplit
load symbol RTL_OR work OR pin I0 input pin I1 input pin O output fillcolor 1
load symbol fsm work:abstract:NOFILE HIERBOX pin clk input.left pin ped_mode input.left pin ps0 output.right pin ps1 output.right pin ps2 output.right pin rst input.left boxcolor 1 fillcolor 2 minwidth 13%
load symbol fsm work:fsm:NOFILE HIERBOX pin clk input.left pin ped_mode input.left pin ps0 output.right pin ps1 output.right pin ps2 output.right pin rst input.left boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_MUX16 work MUX pin O output.right pin S input.bot fillcolor 1
load symbol RTL_MUX2 work MUX pin I0 input.left pin I1 input.left pin O output.right pin S input.bot fillcolor 1
load symbol RTL_REG_SYNC__BREG_17 work GEN pin C input.clk.left pin CE input.left pin D input.left pin Q output.right pin RST input.top pin SET input.bot fillcolor 1
load port clk input -pg 1 -lvl 0 -x 0 -y 60
load port ew_green output -pg 1 -lvl 4 -x 910 -y 60
load port ew_red output -pg 1 -lvl 4 -x 910 -y 120
load port ew_yellow output -pg 1 -lvl 4 -x 910 -y 90
load port ns_green output -pg 1 -lvl 4 -x 910 -y 320
load port ns_red output -pg 1 -lvl 4 -x 910 -y 380
load port ns_yellow output -pg 1 -lvl 4 -x 910 -y 350
load port ped_EW input -pg 1 -lvl 0 -x 0 -y 580
load port ped_NS input -pg 1 -lvl 0 -x 0 -y 550
load port ped_wait output -pg 1 -lvl 4 -x 910 -y 630
load port rst input -pg 1 -lvl 0 -x 0 -y 100
load inst RTL_OR RTL_OR work -attr @cell(#000000) RTL_OR -pg 1 -lvl 1 -x 90 -y 470
load inst RTL_OR__0 RTL_OR work -attr @cell(#000000) RTL_OR -pg 1 -lvl 1 -x 90 -y 570
load inst ew1 fsm work:abstract:NOFILE -autohide -attr @cell(#000000) fsm -pg 1 -lvl 3 -x 670 -y 50
load inst ew2 fsm work:abstract:NOFILE -autohide -attr @cell(#000000) fsm -pg 1 -lvl 3 -x 670 -y 180
load inst ns1 fsm work:fsm:NOFILE -autohide -attr @cell(#000000) fsm -pg 1 -lvl 3 -x 670 -y 310
load inst ns2 fsm work:abstract:NOFILE -autohide -attr @cell(#000000) fsm -pg 1 -lvl 3 -x 670 -y 470
load inst ped_wait_i RTL_MUX16 work -attr @cell(#000000) RTL_MUX -pg 1 -lvl 2 -x 360 -y 730
load inst ped_wait_i__0 RTL_MUX2 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b1 -pinAttr I1 @attr S=default -pg 1 -lvl 2 -x 360 -y 600
load inst ped_wait_reg RTL_REG_SYNC__BREG_17 work -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 3 -x 670 -y 630
load net <const0> -ground -pin ped_wait_i__0 I1
load net RTL_OR__0_n_0 -pin RTL_OR__0 O -pin ped_wait_i__0 S -pin ped_wait_reg CE -pin ped_wait_reg RST
netloc RTL_OR__0_n_0 1 1 2 200 660N 560
load net clk -port clk -pin ew1 clk -pin ew2 clk -pin ns1 clk -pin ns2 clk -pin ped_wait_reg C
netloc clk 1 0 3 NJ 60 NJ 60 540
load net ew_green -pin ew1 ps0 -pin ew2 ps0 -port ew_green
netloc ew_green 1 3 1 890 60n
load net ew_red -pin RTL_OR I1 -pin ew1 ps2 -pin ew2 ps2 -port ew_red
netloc ew_red 1 0 4 20 400 NJ 400 NJ 400 830
load net ew_yellow -pin ew1 ps1 -pin ew2 ps1 -port ew_yellow
netloc ew_yellow 1 3 1 850 80n
load net ns_green -pin ns1 ps0 -pin ns2 ps0 -port ns_green
netloc ns_green 1 3 1 890 320n
load net ns_red -pin RTL_OR I0 -pin ns1 ps2 -pin ns2 ps2 -port ns_red
netloc ns_red 1 0 4 40 420 NJ 420 NJ 420 850
load net ns_yellow -pin ns1 ps1 -pin ns2 ps1 -port ns_yellow
netloc ns_yellow 1 3 1 870 340n
load net p_0_out -pin RTL_OR O -pin ped_wait_i S -pin ped_wait_i__0 I0
netloc p_0_out 1 1 1 220 470n
load net ped_EW -pin RTL_OR__0 I1 -pin ew1 ped_mode -pin ew2 ped_mode -port ped_EW
netloc ped_EW 1 0 3 40 520 NJ 520 480
load net ped_NS -pin RTL_OR__0 I0 -pin ns1 ped_mode -pin ns2 ped_mode -port ped_NS
netloc ped_NS 1 0 3 20 620 240J 540 500
load net ped_wait -port ped_wait -pin ped_wait_reg Q
netloc ped_wait 1 3 1 NJ 630
load net ped_wait_i__0_n_0 -pin ped_wait_i__0 O -pin ped_wait_reg SET
netloc ped_wait_i__0_n_0 1 2 1 480 600n
load net ped_wait_i_n_0 -pin ped_wait_i O -pin ped_wait_reg D
netloc ped_wait_i_n_0 1 2 1 580 650n
load net rst -pin ew1 rst -pin ew2 rst -pin ns1 rst -pin ns2 rst -port rst
netloc rst 1 0 3 NJ 100 NJ 100 520
levelinfo -pg 1 0 90 360 670 910
pagesize -pg 1 -db -bbox -sgen -100 0 1030 800
show
fullfit
#
# initialize ictrl to current module main work:main:NOFILE
ictrl init topinfo |
