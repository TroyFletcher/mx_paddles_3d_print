$fn=20;
unit = 19.05;
u = unit;
switch_bottom_height= 5;
sbh = switch_bottom_height;
switch_bottom_diameter= 14;
sbd = switch_bottom_diameter;
axel_diameter = 3.5;
paddle_position_height  = 11;
paddle_height = 20;
ph = 20;
paddle_width = 8;
pw = paddle_width;
paddle_depth = 3;
pd = paddle_depth;
signum31_left_paddle_triad();
// signum31_right_paddle_triad();
// signum30_left_paddle_triad();
// signum30_right_paddle_triad();
// paddle();
// UNCOMMENT ABOVE THE TRIAD YOU WANT TO RENDER
module signum31_left_paddle_triad() {
  mirror([0, 1, 0]) {signum31_right_paddle_triad();}
};
module signum31_right_paddle_triad() {
  translate([5.022193,0,0]){
    translate([0,u,0]){
      rotate([0,0,-90]){
	base();
      };
    };
  };
  translate([3.378522,20.01308,0]){
    difference() {
      translate([-1,-1,0]){
	cube([u+2,u+2,sbh]);
      };
      translate([(u-sbd)/2,(u-sbd)/2,-1]){
	cube([sbd,sbd,sbh+10]);
      };
    };
  };
  translate([u,39.561307,0]){
    rotate([0,0,90]){
      base();
    };
  };
};
module signum30_left_paddle_triad() {
  mirror([0, 1, 0]) {signum30_right_paddle_triad();}
};
module signum30_right_paddle_triad() {
  translate([3.719936,0,0]){
    translate([0,u,0]){
      rotate([0,0,-90]){
	base();
      };
    };
  };
  translate([0.871598,19.517088,0]){
    difference() {
      translate([-1,-1,0]){
	cube([u+2,u+2,sbh]);
      };
      translate([(u-sbd)/2,(u-sbd)/2,-1]){
	cube([sbd,sbd,sbh+10]);
      };
    };
  };
  translate([u,39.26772,0]){
    rotate([0,0,90]){
      base();
    };
  };
};
module base() {
  difference() {
    union() {
      cube([u,u,sbh]);
      stand();
      union() {
	translate([0,u-pd,0]){
	  stand();
	};
      };
    };
    translate([(u-sbd)/2,(u-sbd)/2,-1]){
      cube([sbd,sbd,sbh+10]);
      translate([-1,-1,6]){
	cube([sbd+2,sbd+2,sbh+4]);
      };
    };
    translate([pw/2,-1,(axel_diameter/2)+15]){
      rotate([-90,0,0]){
	cylinder(d=axel_diameter, h=u+2);
      };
    };
  };
};
module stand() {
  union() {
    cube([pw,pd,ph]);
    translate([u-7,0,0]){
      rotate([0,-37,0]){
	cube([pw,pd,ph-1]);
      };
    };
  };
};
module paddle() {
  translate([0,0,2]){
    translate([pd+0.5,0-(axel_diameter/2),0-(axel_diameter/2)]){
      cube([((u-(pd*2))-1),3.5,15]);
      cube([((u-(pd*2))-1),10,3.5]);
    };
    rotate([0,90,0]){
      translate([0,0,1]){
	#cylinder(d=axel_diameter-0.5, h=u-2);
      };
    };
  };
};
