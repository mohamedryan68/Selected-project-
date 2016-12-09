rule(1,
     lhs( [not(av(computer_turn_on,yes)),av(charging_lamp_off, yes),av(electricity_depend, yes) ] ),                                                                                   
     rhs( av(problem, charger), 90) ).                                         

rule(2,
     lhs( [av(no_battery_exist, yes),not(av(power_in_laptop, yes))] ),
     rhs( av(electricity_depend, yes), 80) ).

rule(3,
    lhs( [not(av(computer_turn_on,yes)),av(not_charged,yes)]),
    rhs( av(problem, battery),90) ).

rule(4,
     lhs( [not(av(computer_turn_on,yes)),not(av(not_charged,yes)),not(av(power_in_laptop,yes))] ),
     rhs( av(problem,battery),90) ).


rule(5,
     lhs( [av(charger_connected,yes),not(av(charging_lamp_off,yes))] ),
     rhs( av(not_charged,yes),90) ).

rule(6,
     lhs( [not(av(desktop_start,yes)),av(computer_turn_on,yes),av(labtop_fall_down,yes)] ),
     rhs( av(problem,ram),80) ).

rule(7,
     lhs( [not(av(desktop_start,yes)),av(computer_turn_on,yes),av(bios_screen,yes)] ),
     rhs( av(problem,ram),100) ).

rule(8,
     lhs( [av(desktop_start,yes),av(computer_turn_on,yes),av(labtop_fall_down, yes),av(bad_resoluation, yes) ] ),
     rhs( av(problem, displaycard), 80) ).

rule(9,
     lhs( [av(desktop_start,yes),av(computer_turn_on,yes),av(labtop_fall_down, yes),av(red_lines, yes) ] ),
     rhs( av(problem, displayflat), 90) ).

rule(10,
     lhs( [av(computer_turn_on,yes),av(hear_os_start, yes),av(black_display, yes) ] ),
     rhs( av(problem, displaymode), 90) ).

rule(11,
     lhs( [av(computer_turn_on,yes),av(hear_os_start, yes),av(labtop_fall_down, yes) ] ),
     rhs( av(problem, display), 90) ).


rule(12,
     lhs( [not(av(desktop_start,yes)),av(computer_turn_on,yes),not(av(hear_fan_sound,yes))] ) ,
     rhs( av(problem, cpufan), 90)).


rule(13,
     lhs( [not(av(desktop_start,yes)),av(computer_turn_on,yes),av(uncom_sound, yes),av(aircondition, yes) ] ),
     rhs( av(problem, cpufan), 90) ).

rule(14,
     lhs( [not(av(desktop_start,yes)),av(computer_turn_on,yes),av(high_temp,yes)]),
     rhs( av(aircondition,yes), 100) ).

rule(15,
     lhs( [not(av(desktop_start,yes)),av(computer_turn_on,yes),av(windows_do_con_op, yes),av(flash_screen, yes) ] ),
     rhs( av(problem, os), 100) ).

rule(16,
     lhs( [av(windows_restart_when_load,yes)] ), 
     rhs( av(windows_do_con_op,yes), 100)).

rule(17,
     lhs( [av(desktop_start,yes),av(computer_turn_on,yes),av(windows_op_disk_restart, yes) ] ),
     rhs( av(problem, os), 100) ).

rule(18,
     lhs( [av(desktop_start,yes),av(computer_turn_on,yes),av(windows_in_deadlock, yes) ] ),
     rhs( av(problem, os), 100) ).

rule(19,
     lhs( [not(av(desktop_start,yes)),av(computer_turn_on,yes),av(blue_page, yes) ] ),
     rhs( av(problem, os), 100) ).

rule(20,
     lhs( [not(av(desktop_start,yes)),av(computer_turn_on,yes),av(can_not_load_os, yes) ] ),
     rhs( av(problem, harddrive), 90) ).


rule(21,
     lhs([av(address_error_messag,yes),av(comp_restart,yes)]),
     rhs(av(can_not_load_os,yes), 100)).

rule(22,
     lhs( [not(av(computer_turn_on,yes)),av(smell_smoke, yes) ] ),
     rhs( av(problem, board), 90) ).

 rule(23,
     lhs( [not(av(computer_turn_on,yes)),av(fall_drink, yes) ] ),
     rhs( av(problem, board), 90) ).   

  rule(24,
     lhs( [av(labtop_fall_down, yes) ,av(smell_smoke, yes) ] ),
     rhs( av(problem, board), 90) ).

 rule(25,
     lhs( [not(av(charger,yes)),not(av(computer_turn_on,yes)) ] ),
     rhs( av(problem, powerbutton), 90) ).


askable(computer_turn_on, 'Does the computer turn on  : ').
askable(desktop_start, 'Does the desktop start : ').
askable(charging_lamp_off, 'Does the charging lamp off : ').
askable(no_battery_exist , 'no battery exist : ').
askable(power_in_laptop, 'Do you feel power in labtop : ').
askable(charger_connected,' Does the charger connected :').
askable(labtop_fall_down, 'Does the labtop fall down : ').
askable(red_lines, 'Do you see red lines  : ').
askable(bios_screen, 'Does Bios screen doesnot count ram : ').
askable(bad_resoluation, 'Does the screen get bad resoluation : ').
askable(flash_screen, 'Does the screen make flashes : ').
askable(hear_os_start, 'Do you here os start : ').
askable(black_display, 'Do you see black display : ').
askable(high_temp, 'Do you feel high temperature: ').
askable(hear_fan_sound, 'Do you here fan sound : ').
askable(uncom_sound, 'Do you here uncomfortable sound :  ').
askable(windows_restart_when_load, 'Does os restart when load its files : ').
askable(windows_op_disk_restart, 'Does os restart after open desktop : ').
askable(windows_in_deadlock, 'Does os get in deadlock :  '). 
askable(address_error_messag, 'Does address error messege appear : ').
askable(comp_restart, 'Does computer restart : ').
askable(fall_drink, 'Does drink droped on computer  : ').
askable(smell_smoke, 'Do you smell smoke : ').
askable(power_lamp_off, 'Does power lamp is off : ').
askable(blue_page, 'Do you see bule page : ').


