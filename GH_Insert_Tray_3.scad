include <ghmodules.scad>;

/*
Top Left: difference, difference
Top Right: difference, intersection
Bottom Left: intersection, difference
Bottom Right: intersection, intersection
*/
intersection() {
intersection() {
    union() {
        translate([0, 0, BASETHICK/2]) {
            cube([245, 285, BASETHICK], true);
        }

        wall([122.5-THICK, 142.5], [285, 37], 90);
        wall([-122.5, 142.5], [285, 37], 90);
        
        wall([122.5, 142.5], [245, 30], 0);
        wall([122.5, -142.5+THICK], [245, 30], 0);
        wall([16.5, -142.5+THICK], [139, 7], 0, 30);
        wall([16.5, 142.5], [55, 7], 0, 30);
        wall([-71.5, 142.5], [51, 7], 0, 30);
        
        wall([122.5, 58.5], [136, 23], 0);
        wall([122.5, 6.5], [136, 23], 0);
        wall([122.5, -73.5], [72, 23], 0);
        wall([-49.5, -14.5], [73, 23], 0);
        
        // Angle section and associated parts
        wall([19, -56.5], [70, 23], 0);
        wall([50.5+THICK, -73.5], [
            sqrt(pow(50.5+THICK-19, 2)+pow(73.5-56.5,2)), 23], 
            -atan((73.5-56.5)/(50.5+THICK-19)));
        //%translate([-50.5-THICK, 73.5, 0]) cylinder(h=50, r=.2);
        //%translate([-19, 56.5, 0]) cylinder(h=50, r=.2);
        wall([50.5, -73.5], [69, 23], 90);
        
        wall([-51.5, -14.5], [128, 23], 90);
        wall([72.5, 4], [78, 23], 90);
        wall([-13.5, 142], [200, 23], 90);
        wall([42.5, 58], [53, 23], 90);
        
        wall([-11.5, 33.5], [24, 23], 0);
        wall([-97.5, 33.5], [24, 23], 0);
        prism([-33.5, -49.5, 0], [14, 23], 90);
        prism([33.5-THICK, 83.5, 0], [14, 23], -90);
        
        
        // No holes on potential joins
        /*
        translate([122.5-THICK, -5, 0]) cube([THICK, 10, 37]);
        translate([-122.5, -5, 0]) cube([THICK, 10, 37]);
        translate([-72.5-THICK, -5, 0]) cube([THICK, 10, 23]);
        translate([13.5-THICK, -5, 0]) cube([THICK, 10, 23]);

        translate([-5, -142.5, 0]) cube([10, THICK, 37]);
        translate([-5, 142.5-THICK, 0]) cube([10, THICK, 37]);
        translate([-5, 56.5, 0]) cube([10, THICK, 23]);
        translate([-5, -6.5, 0]) cube([10, THICK, 23]);
        translate([-5, -58.5, 0]) cube([10, THICK, 23]);
        */
    }


    // Left/Right divide
    linear_extrude(height=40) {
        polygon(points=[[0,-200],[200,-200],[200,200],[0,200],
            [0,130], [-10,120], [-10,80], [0,70],
            [0,-70], [-10,-80], [-10,-120], [0,-130],]);
    }
    
}
    
    // Upper/Lower divide
    linear_extrude(height=40) {
        polygon(points=[[-200,0],[-200,-200],[200,-200],[200,0],
            [70, 0], [60, 10], [40, 10], [30, 0],
            [-20, 0], [-30, 10], [-50, 10], [-60, 0],
            ]);
        
    }
    
}
