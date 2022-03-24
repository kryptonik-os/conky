		
--[[
Conky, a system monitor, based on torsmo

Any original torsmo code is licensed under the BSD license

All code written since the fork of torsmo is licensed under the GPL

Please see COPYING for details

Copyright (c) 2004, Hannu Saransaari and Lauri Hakkarainen
Copyright (c) 2005-2019 Brenden Matthews, Philip Kovacs, et. al. (see AUTHORS)
All rights reserved.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

conky.config = {
    background = true,
    double_buffer = true,

    alignment = 'top_left',

    border_width = 1, 
    cpu_avg_samples = 2,
    default_color = 'white',
    default_outline_color = 'white',
    default_shade_color = 'white',
    draw_borders = false,
    draw_graph_borders = false,
    draw_outline = false,
    draw_shades = false,

    gap_x = 0,
    gap_y = 10,
    net_avg_samples = 2,
    
    out_to_console = false,
    out_to_stderr = false,
    extra_newline = false,
    --[[font = 'DejaVu Sans Mono:size=12',
]]
    own_window = true,
    own_window_type = 'normal',
    own_window_transparent = false,
    own_window_colour = '000000',
    own_window_argb_visual = true,
    own_window_argb_value = 0,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    top_cpu_separate = false,
    minimum_height = 325,
    minimum_width = 250,
    stippled_borders = 0,
    update_interval = 1.0,
    uppercase = false,
    use_spacer = 'none',
    --[[out_to_ncurses = false,
    
    out_to_x = true,
]]

    show_graph_range = false,
    show_graph_scale = false,
    use_xft = true,

    xftalpha = 0.1,
    xftfont = 'Ubuntu:size=12',
    color0 = '3422DA',
    color1 = '3422DA',
    color2 = 'FFA300',
    color3 = 'grey',
    color4 = '4059AA',

lua_load = '~/.conky/clock_rings.lua',
lua_draw_hook_pre = 'clock_rings',
 
}

conky.text = [[

#${color grey}Info:$color ${scroll 32 Conky $conky_version - $sysname $nodename $kernel $machine}

#${color grey}Uptime:$color $uptime
#${color grey}Frequency (in MHz):$color $freq
#${color grey}Frequency (in GHz):$color $freq_g
#${color grey}RAM Usage:$color $mem/$memmax - $memperc% ${membar 4}
#${color grey}Swap Usage:$color $swap/$swapmax - $swapperc% ${swapbar 4}
#${color grey}CPU Usage:$color $cpu% ${cpubar 4}
#${color grey}Processes:$color $processes  ${color grey}Running:$color $running_processes
#$hr
#${color grey}File systems:
# / $color${fs_used /}/${fs_size /} ${fs_bar 6 /}
#${color grey}Networking:
#Up:$color ${upspeed} ${color grey} - Down:$color ${downspeed}
#$hr
#${color grey}Name              PID     CPU%   MEM%
#${color lightgrey} ${top name 1} ${top pid 1} ${top cpu 1} ${top mem 1}
#${color lightgrey} ${top name 2} ${top pid 2} ${top cpu 2} ${top mem 2}
#${color lightgrey} ${top name 3} ${top pid 3} ${top cpu 3} ${top mem 3}
#${color lightgrey} ${top name 4} ${top pid 4} ${top cpu 4} ${top mem 4} 


${color0}${goto 0}${voffset 0}${font caviar dreams:size=15}${time %A %d %B %Y}
${color0}${goto 0}${voffset 15}${font caviar dreams:size=15}France: ${color1}${tztime Europe/Brussels %H:%M:%S}
${color0}${goto 0}${voffset 0}${font caviar dreams:size=10}Montréal: ${color1}${tztime Canada/Eastern %H:%M}
${color0}${goto 0}${voffset 10}${font caviar dreams:size=15}Connecte depuis ${color1} $uptime 
#
#
#################################################################
#				SYSTEME				#
#################################################################
#
${color FFFFFF}${goto 0}${voffset 30}${font caviar dreams:size=15}Systéme
#
#################################
#		CPU		#
#################################
#
#################
#	cpu1	#
#################
#
${color1}${goto 0}${voffset 30}${font caviar dreams:size=15}cpu1${goto 35}${voffset 25}${color0}${font caviar dreams:size=10}${cpu cpu1}%
#${color0}${goto 5}${voffset -25}${font caviar dreams:size=10}${hwmon 2 temp 2}°C
#
#################
#	cpu2	#
#################
#
${color1}${goto 90}${voffset -48}${font caviar dreams:size=15}cpu2${goto 125}${voffset 25}${color0}${font caviar dreams:size=10}${cpu cpu2}%
#${color0}${goto 95}${voffset -25}${font caviar dreams:size=10}${hwmon 2 temp 3}°C
#
#############
#	cpu3	#
#############
#${color1}${goto 180}${voffset -34}${font caviar dreams:size=15}cpu3${goto 215}${voffset 25}${color0}${font caviar dreams:size=10}${cpu cpu3}%
#${color0}${goto 185}${voffset -25}${font caviar dreams:size=10}${hwmon 2 temp 4}°C
#
#############
#	cpu4	#
#############
#${color1}${goto 270}${voffset -34}${font caviar dreams:size=15}cpu4${goto 305}${voffset 25}${color0}${font caviar dreams:size=10}${cpu cpu4}%
#${color0}${goto 275}${voffset -25}${font caviar dreams:size=10}${hwmon 2 temp 5}°C
#
#################
#	cpu	#
#################
#
${color1}${goto 25}${voffset 50}${font caviar dreams:size=20}Cpu${goto 60}${voffset 40}${color0}${font caviar dreams:size=15}${cpu cpu0}%
#${goto 30}${voffset -37}${color0}${font caviar dreams:size=15}${hwmon 1 temp 1}°C
#
###################
#	Gpu		
###################
#
${color0}${goto 130}${voffset 25}${font caviar dreams:size=10}GPU ${hwmon 3 temp 1}°C
#
#################################
#		RAM		#
#################################
#
#
${color1}${goto 170}${voffset -45}${font caviar dreams:size=15}Ram${goto 210}${voffset 20}${color0}${font caviar dreams:size=10}$memperc%
#
#
#${color1}${goto 250}${voffset -120}${font caviar dreams:size=15}Hdd${color0}${goto 283}${voffset 18}${font caviar dreams:size=10}${hddtemp /dev/sdb}°C
#
#################################
#		RESEAU		#
#################################
#
${color FFFFFF}${goto 0}${voffset 95}${font caviar dreams:size=15}Reseau 
# 
${color1}${goto 10}${voffset 30}${font caviar dreams:size=15}Download${goto 50}${voffset 20}${color0}${font caviar dreams:size=11}${downspeed eth0}
#
#
${color1}${goto 150}${voffset -40}${font caviar dreams:size=15}Upload${goto 165}${voffset 17}${color0}${font caviar dreams:size=11}${upspeed eth0}
#
#
#${color1}${goto 0}${voffset 50}${font caviar dreams:size=10}Accés:${goto 50}${color0}${wireless_essid wlan0}
#
#
#${color1}${goto 0}${voffset 10}${font caviar dreams:size=10}Taux:${color0}${wireless_bitrate wlan0}
#
#
#${color1}${goto 0}${voffset 10}${font caviar dreams:size=10}Force du signal:${goto 95}${color0}${wireless_link_qual_perc wlan0}
#
#
${color1}${goto 0}${voffset 30}${font caviar dreams:size=10}Ip de connection:${goto 115}${color0}${texeci 3600 wget http://checkip.dyndns.org -O - -o /dev/null | cut -d : -f 2 | cut -d \< -f 1}
#
#
#${color1}${goto 0}${voffset 0}${font caviar dreams:size=10}Ip locale:${goto 120}${color0}${addr wlan0}
#${color d38229}$stippled_hr
#
#
#
#
#################################
#		STOKAGE		#
#################################
#
${color FFFFFF}${goto 0}${voffset 30}${font caviar dreams:size=15}Stokage
#
#
${color1}${goto 0}${voffset 15}${font caviar dreams:size=10}Root:${goto 50}${color0}${fs_free /}#${goto 195}${fs_used_perc /}%
#
#
${color1}${goto 0}${voffset 15}${font caviar dreams:size=10}Home:${goto 50}${color0}${fs_free /home}#${goto 195}${fs_used_perc /home}%
#
#
#${color FFFFFF}${goto 0}${voffset 55}$stippled_hr
#
###########################################################################################################
]]


