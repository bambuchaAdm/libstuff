// Imbus bolts - DIN 912
// export: imbus

include <bolt_commons.scad>
include <bolt_internal.scad>

cylinderImbusHeadParams = [ 
	// type, [ d_k - head diameter, k - head height ]
	[M4, [7.0, 4]]
];

module imbus(diameter, length){
	echo (str("DIN 912 M", diameter,"x",length));
	head = searchFor(diameter, cylinderImbusHeadParams);
	rotate([180,0,0]) color(bolt_color) {
		cylinder(d=diameter, length);
		translate([0,0,-head[heightIndex]]) 
			cylinder(d=head[diameterIndex], h=head[heightIndex]);
	}
}

function imbus_head_height(diameter) = 
	searchFor(diameter, cylinderImbusHeadParams)[heightIndex];

function imbus_head_diameter(diameter) = 
	searchFor(diameter, cylinderImbusHeadParams)[diameterIndex];

imbus(M4,10);
