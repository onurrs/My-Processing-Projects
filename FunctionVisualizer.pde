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
  planeMargin = (int) map(mouseY, 0, height, 2, 100);   //With your mouse, you can adjust the scale on the window
  //interval = map(mouseX, 0, width, 0.1, 5);
  text("Interval= " + interval, width/2-30, height/2-30);
  text("Margin  = " + planeMargin, width/2-30, height/2-15);
  createPlane();
  stroke(255, 0, 0);
  fill(255, 0, 0);

  for (x = -width/2; x<=width; x+=interval) {

    f_x = (float)Math.pow(x/2, 2);    //   <-------- Enter the function here

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
  float xStart = round(-width/2 / planeMargin) * planeMargin;
  float xEnd = round(width/2 / planeMargin) * planeMargin;
  for (float i = xStart; i <= xEnd; i += planeMargin) {
    line(i, -height/2, i, height/2);  // creates vertical lines
  }

  float yStart = round(-height/2 / planeMargin) * planeMargin;
  float yEnd = round(height/2 / planeMargin) * planeMargin;
  for (float i = yStart; i <= yEnd; i += planeMargin) {
    line(-width/2, i, width/2, i);    // creates horizontal lines
  }

  stroke(50);
  line(0, -height/2, 0, height/2);    // creates darker central lines
  line(-width/2, 0, width/2, 0);

  createNumbers();
}


void createNumbers() {
  textSize(10);
  fill(0);
  textAlign(RIGHT, CENTER);

  int yStart = round(-height/2 / planeMargin) * planeMargin;
  int yEnd = round(height/2 / planeMargin) * planeMargin;
  for (int i = yStart; i <= yEnd; i += planeMargin) {
    if (i!=0)
      text(i / planeMargin, -2, -i);    // creates ordinate numbers
  }

  textAlign(CENTER, TOP);

  int xStart = round(-width/2 / planeMargin) * planeMargin;
  int xEnd = round(width/2 / planeMargin) * planeMargin;
  for (int i = xStart; i <= xEnd; i += planeMargin) {
    if (i!=0)
      text(i / planeMargin, i, 2);    // creates abscissa numbers
  }
}
