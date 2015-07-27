// NEMA17 engine
// export nema17(length){ top_holder }
// nema17_mount_points(){ holder }

module nema17_mount_points(offset = [0,0,0]){
	for(i = [-31/2, 31/2] , j = [ -31/2, 31/2])
		translate([i,j,0] + offset) children(0);
}

width = 42.3;
shaft_plate = 2;
shaft = 22;

module nema17(length){
	linear_extrude(length) square(width,center=true);
	if($children > 0){
		nema17_mount_points()	
			translate([0,0,length]) children(0);	
	}

 	cylinder(d=22, h = length + shaft_plate);
	cylinder(d=5, h = length + shaft);
}

include <libstuff/bolt_commons.scad>
use <libstuff/imbus.scad>

nema17(47){ imbus(M4,10); };
nema17_mount_points(){ rotate([180,0,0]) imbus(M4,10); }