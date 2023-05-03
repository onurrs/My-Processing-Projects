/*
*    Author: Haci Onur Sogut
*    Date:   04.05.2023
*    Description: Creates visual representation on a coordinate plane for any f(x).
*/

int planeMargin = 20;    //margin between values to show
float f_x, f_xOld;
float x, xOld;
float interval = 0.5;    //the interval along the abscissa, lower = more sensitive/accurate

void setup() {
  size(800, 800);        //You can adjust the size of the window
}

void draw() {
  translate(width/2, height/2);    //Default processing start position is top-left corner and goes right-bottom, this command is to set origin to the centre
  background(255);
  createPlane();
  stroke(255, 0, 0);
  fill(255,0,0);
  
  
  for (x = -width/2; x<=width; x+=interval) {

    f_x = (float)Math.pow(x/2, 2)+3*x-4;    //   <-------- Enter the function here

    circle(x*planeMargin, f_x*-planeMargin, 5);    //These 2 commands creates dots and lines
    line(x*planeMargin, f_x*-planeMargin, xOld*planeMargin, f_xOld*-planeMargin);   //I need to multiply ordinate axis by -1 because by default, increment is downwards.
                                                                                    //I also need to multiply with planeMargin because my coordinate plane values are different than window coordinates.

    xOld = x;    //These variables are just to remember old positions to create line
    f_xOld = f_x;
  }
}

void createPlane() {
  strokeWeight(1);

  stroke(200);
  for (int i = -height/2; i<height/2; i+=planeMargin) {
    line(-width/2, i, width/2, i);    //creates horizontal lines
  }
  for (int i = -width/2; i<width/2; i+=planeMargin) {
    line(i, -height/2, i, height/2);  //creates vertical lines
  }

  stroke(50);
  line(0, -height/2, 0, height/2);    //creates darker central lines
  line(-width/2, 0, width/2, 0);
  createNumbers();
}

void createNumbers() {
  textSize(10);
  fill(0);
  textAlign(RIGHT, CENTER);
  for (int i = -height/2+planeMargin; i<height/2; i+=planeMargin) {
    if (-i/planeMargin!=0)    
      text(-i/planeMargin, -2, i);    //creates ordinate numbers except 0
  }
  textAlign(CENTER, TOP);
  for (int i = -width/2+planeMargin; i<width/2; i+=planeMargin) {
    if (-i/planeMargin!=0)
      text(i/planeMargin, i, +2);    //creates abscissa numbers except 0
  }
}
