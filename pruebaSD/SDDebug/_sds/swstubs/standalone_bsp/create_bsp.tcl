hsi::open_hw_design G:/pruebaSD/SDDebug/_sds/p0/ipi/zybo_hdmi_in.sdk/zybo_hdmi_in.hdf
set hw_design [hsi::current_hw_design]
hsi::generate_bsp -dir G:/pruebaSD/SDDebug/_sds/swstubs/standalone_bsp/scratch -hw ${hw_design} -os standalone -proc ps7_cortexa9_0
quit
