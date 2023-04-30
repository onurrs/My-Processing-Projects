/*
*  Author: Haci Onur Sogut
 *  Date: 30.04.2023
 *  Description: Vizualizes Bubble Sort Algorithm
 */

float list[];
boolean swapped;
int max = 0;

void setup() {
  size(800, 600);
  background(0);
  stroke(255);

  list = new float[width];

  for (int i=0; i<list.length; i++) {
    list[i] = (int)random(height);  //This random values are more easier to see
    //list[i] = noise(i/100.) * height; //This random values are just more aesthetic
  }
}

void draw() {
  background(0);
  stroke(255);
  translate(0, height);
  swapped = false;


  for (int i=0; i<width; i++) {
    line(i, 0, i, -list[i]);
  }

  for (int i=0; i<width-1-max; i++) {    //for every index, it checks if the value on the right is lower than index. If so, then they will swap. In the end, we will find highest value and put it to the most right side.

    if (list[i]>list[i+1]) {
      swap(i);
      swapped = true;
    }
  }

  max++;                                //And it does the same thing again with lower max index.  i<(width-1-max)

  if (!swapped) {
    background(0, 0, 100);
    for (int i=0; i<width; i++) {
      line(i, 0, i, -list[i]);
    }
    System.out.println("FINISHED!");
    noLoop();
  }
}


void swap(int i) {
  float temp = list[i];
  list[i] = list[i+1];
  list[i+1] = temp;
}
