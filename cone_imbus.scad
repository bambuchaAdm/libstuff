// cone imbus bolt - DIN 7991

include <bolt_commons.scad>
include <bolt_internal.scad>

coneHeadParams = [
	// type, [d_k - head diameter, k - headHeight]
	[M4, [8, 2.3]]
];

module cone_imbus(diameter, length){
	head = searchFor(diameter, coneHeadParams);
	rotate([180,0,0]) color(bolt_color) {
		cylinder(d=diameter, length);
		translate([0,0,-head[heightIndex]]) {
			cylinder(d1=head[diameterIndex], d2=diameter, h= head[heightIndex]);
		}
	}
}

function cone_head_height(diameter) = 
	searchFor(diameter, coneHeadParams)[heightIndex];

function cone_head_diameter(diameter) = 
	searchFor(diameter, coneHeadParams)[diameterIndex];

cone_imbus(M4, 10);
