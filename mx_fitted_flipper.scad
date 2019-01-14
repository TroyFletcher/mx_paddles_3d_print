// I know OpenSCAD makes no sense, but it works for modifying things programmatically!
// Measurements are intended to represent mm.
// I will comment this more and improve as I go

$fn=20;
overall_height = 36;

paddle_position_height  = 11;

paddle_height = overall_height-paddle_position_height;
paddle_width  = 19;
paddle_depth  = 3;

post_diameter = 1.718;
post_distance = 10.76;

flapper_height = paddle_depth;
flapper_width  = paddle_width;
flapper_depth  = 40;

axel_inner_diameter = 4;
axel_outer_diameter = 10;
axel_depth  = 50;

bearing_width  = 4;
bearing_depth  = axel_outer_diameter;

part_gap  = .5;
push_button_height = 4;
axel_opening = 10;

axel_wall_thickness =((axel_outer_diameter/2)-(axel_inner_diameter/2));
base_height = 5;
base_width  = paddle_width+(bearing_width*2+part_gap*2);
base_depth  = 19;

// the joined base for the paddle to rotate within.
translate([0,30,0]) {
    difference() {
        union() {
            union() {
                #cube([5,6,20]);
                cube([5,15,4]);
            };
            translate([21,0,0]) {
                    union() {
                        cube([5,6,20]);
                        cube([5,15,4]);
                };
            };
            cube([21,2,2]);
            translate([0,0,19]) {
                cube([6,1,1]);
            };
            translate([20,0,19]) {
                cube([6,1,1]);
            };
        };
        translate([-5, 3, (3.5/2)+15]) {
            rotate([0, 90, 0]) {
                cylinder(d=3.5, h=55);
            };
    };
    };
};

// this is the fitted paddle
translate([5.5,0,0]) {
    #union(){
        //translate([bearing_width+part_gap,  axel_wall_thickness, paddle_position_height]) {
            union(){
                cube([15,3,15]);
                cube([15,10,3]);
            };
        //};
        translate([-5,  1.5, 1.5]) {
            rotate([0, 90, 0]) {
                cylinder(d=3, h=25);
            };
        };
    };
};


