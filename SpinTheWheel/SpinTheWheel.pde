/*
 *  Author: Haci Onur Sogut
 *  Date: 08.06.2023
 *  Description: Wheel spinner to decide between 8 referance colors
 */

int rgb = 255;
float vel = 0;
float ang = 0;

boolean spinning = false;
boolean speeding = true;
PImage bg;
PImage wait;
PImage normal;
PImage hand;

void setup() {
  size(600, 600);
  bg = loadImage("bg.png");
  wait = loadImage("wait.png");
  normal = loadImage("cursor.png");
  hand = loadImage("click.png");
}

void draw() {
  background(bg);
  translate(width/2, height/2-50);

  if (spinning) {
    spinSettings();
  }

  push();
  rotate(radians(ang));
  for (int i = 0; i<=315; i+=45) {
    colorChange(i);
    stroke(0);
    strokeWeight(0.5);
    arc(0, 0, 300, 300, radians(i), radians(i+45), PIE);
  }
  pop();

  if (!spinning) {
    buttonCreate();
  }

  shadowAround();
  triangleCreate();
}

void spinSettings() {
  cursor(wait);
  if (speeding)
    vel+=random(0, 1);
  ang+=vel;

  if (vel>random(30, 45))
    speeding = false;

  if (!speeding) {
    vel-=0.1;
    if (vel < 0.01) {
      vel = 0;
      spinning = false;
      speeding = true;
    }
  }
}

void triangleCreate() {
  fill(0);
  stroke(0);
  triangle(0, -140, 5, -150, -5, -150);
}

void buttonCreate() {
  fill(150, 0, 0);
  strokeWeight(3);
  rect(-75, 200, 150, 50);

  if (mouseX>225 && mouseX<375 && mouseY>450 && mouseY<500) {
    cursor(hand);
    if (mousePressed) {
      spinning = true;
    }
  } else
    cursor(normal);


  fill(0);
  textAlign(CENTER, CENTER);
  textSize(25);
  text("SPIN", 0, 220);
}

void shadowAround() {

  for (int i = 346; i>=301; i-=5) {
    float red;
    if (i<=321)
      red = map(i, 321, 301, 255, 0);
      else
      red = map(i, 346, 321, 0, 255);

    stroke(red, 0, 0);
    noFill();
    circle(0, 0, i);
  }
}

void colorChange(int i) {
  switch(i) {
  case 0:
    fill(rgb, 0, 0);
    //stroke(rgb, 0, 0);
    break;
  case 45:
    fill(rgb, rgb/2, 0);
    //stroke(rgb, rgb/2, 0);
    break;
  case 90:
    fill(rgb, rgb, 0);
    //stroke(rgb, rgb, 0);
    break;
  case 135:
    fill(0, rgb, 0);
    //stroke(0, rgb, 0);
    break;
  case 180:
    fill(0, rgb, rgb);
    //stroke(0, rgb, rgb);
    break;
  case 225:
    fill(0, 0, rgb);
    //stroke(0, 0, rgb);
    break;
  case 270:
    fill(rgb/2, 0, rgb);
    //stroke(rgb/2, 0, rgb);
    break;
  case 315:
    fill(rgb, 0, rgb);
    //stroke(rgb, 0, rgb);
    break;
  }
}
