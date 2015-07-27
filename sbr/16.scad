// SRB rail + bearing
// export sbr16_rail(length), sbr16_bearing(), sbr16_mount_position(offset)


include <libstuff/bolt_commons.scad>
use <libstuff/imbus.scad>

module sbr16_rail(length){
	echo (str ("SRB16x", length));
	rotate([90,0,90]){
		linear_extrude(length){
			import("16-rail.dxf");
		}
	}
	if($children == 1){
		for(i = [20:150:length-20]){
			for(j = [-15,15]){
				translate([i,j,5]) 
					children(0);
			}
		}
	}
}

module sbr16_bearing(){
	length = 45;
	difference(){
		rotate([90, 0, 90]) linear_extrude(length){
			import("16-bearing.dxf");
		}
		translate([length/2, 0, 11]) 
			for(i = [-10,10], j = [-25/2, 25/2])
					translate([i,j,0]) cylinder(d=5,h=9.1);
	}

}

module sbr16_mount_position(offset = [0,0,0]) {
	translate(offset+[0,0,25]) children();
}


translate([-340/2,0,0])
sbr16_rail(340){ imbus(M4,10); } 

sbr16_mount_position([50,0,0])
	sbr16_bearing();
