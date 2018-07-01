include <ghmodules.scad>;
/*
left/right: difference/intersection
*/
difference() {
    union() {
        translate([0, 0, BASETHICK/2]) {
            cube([285, 120, BASETHICK], true);
        }
        
        wall([142.5, 60], [285, 23], 0);
        wall([142.5, -60+THICK], [285, 23], 0);
        
        for (x = [142.5-THICK, 101.5, 63.5, 25.5, -20.5, -76.5, -100.5, -142.5]) {
            wall([x, 60], [120, 23], 90);
        }
 
        wall([142, 21], [116, 23], 0);
        wall([142, -18], [116, 23], 0);
        wall([26, -25], [45, 23], 0);
        wall([26, 7], [45, 23], 0);
        wall([-19, -18], [57, 23], 0);
        wall([-75, 2], [25, 23], 0);
                
        // No holes across potential joins
        for(y=[60-THICK, -7, 25, -60]) {
            translate([-5, y, 0]) cube([10, THICK, 23]);
        }
    }
    // Left/Right divide
    linear_extrude(height=35) {
        polygon(points=[[0,-200],[200,-200],[200,200],[0,200],
            [0,-15], [-10,-25], [-10,-40], [0,-50],]);
    }

}

