/*
*  Author: Haci Onur Sogut
 *  Date: 30.04.2023
 *  Description: Vizualizes Insertion Sort Algorithm
 */

float list[];
int index = 1;

void setup() {
  size(800, 600);
  background(0);
  stroke(255);

  list = new float[width];

  for (int i=0; i<list.length; i++) {
    //list[i] = (int)random(height);  //This random values are more easier to see
    list[i] = noise(i/100.) * height; //This random values are just more aesthetic
  }
}

void draw() {
  background(0);
  stroke(255);
  translate(0, height);


  int j = index;    //j will start with the index and go back while always checking and swapping if needed
  while (j>0 && list[j-1]>list[j]) {    //j will swap with the left value until j is lower than j-1 (or until 0'th index if j is the lowest in the list)
    swap(j-1);
    j--;
  }
  index++;          //after j went all the way left, index goes up by 1 and j starts its journey again

  if (index==width) {    //if our index becomes width, program ends. (there are [width] values so [width-1]'th index is the last one. After we increase the index by 1, program ends.)
    System.out.println("FINISHED!");
    background(0, 55, 0);
    noLoop();
  }

  for (int i=0; i<width; i++) {  //prints all the values on the screen
    line(i, 0, i, -list[i]);
  }
}

void swap(int j) {    //just a simple swap method between 2 values using temporary variable.
  float temp = list[j];
  list[j] = list[j+1];
  list[j+1] = temp;
}
