PImage ballImage;
PImage childImage;
PImage child2Image;
float ballX = 100;
float ballY = 300;
float shadowX = 120;
float shadowY = 350;
float bsX = 2;
float bsY = -0.8;
float ssY = 0;
float targetY = 230;
float slider = 350;
boolean start = false;

void setup() {
  size(700, 500);
  ballImage = loadImage("ball.png");
  childImage = loadImage("child.png");
  child2Image = loadImage("child2.png");
}

void draw() {
  //targetY = slider;
  if (ballX<100) {
    bsX = -bsX;
    bsY = -bsY;
    ssY = -ssY;
  }
  if (ballX>440) {
    bsX = -bsX;
    bsY = -bsY;
    ssY = -ssY;
  }
  strokeWeight(1);
  for (int i=0; i<height; i++) {
    int c1 = 255 * i / height-10;
    float c2 = 255 * i*4 / height-10;
    if (c2<220) {
      c2=220;
    }
    stroke(c2);
    line(0, i, width, i);
  }
  for (int i=0; i<12; i++) {
    stroke(200);
    line((width/11)*i, height, 10*i+(width-110)/2, height/4);
  }
  int j=0;
  for (int i=height/4; i<height; i+=j) {
    line((i-height)*(-118)/150, i, width-((i-height)*(-118)/150)-j*0.15, i);
    j+=3;
  }
  noStroke();
  fill(0, 0, 0, 100);
  ellipse(shadowX, shadowY, 35, 10);
  image(childImage, 425, 134);
  image(ballImage, ballX, ballY); 
  image(childImage, 75, 300);

  if (dist(mouseX, mouseY, 600, 430)<40) {
    fill(100, 100, 255);
  } else {
    fill(200);
  }
  ellipse(600, 430, 80, 80);
  fill(255);
  if (start) {
    rect(587, 417, 26, 26);
    ballX+=bsX;
    shadowX+=bsX;
    ballY+=bsY;
    shadowY += ssY;
  } else {
    triangle(590, 415, 590, 445, 620, 430);
    ballX = 100;
    ballY = 300;
    shadowX = 120;
    shadowY = 350;
  }
  stroke(0);
  strokeWeight(3);
  line(width-100, 380, width-100, 200);
  fill(150, 150, 255);
  noStroke();
  rect(width-110, slider-25, 20, 50);
}

void mouseDragged() {
  if (!start) {
    if (mouseX>width-110 && mouseX<width+90 && mouseY>=230 && mouseY<=350) {
      slider=mouseY;
    }
  }
}

void mousePressed() {
  if (dist(mouseX, mouseY, 600, 430)<40) {
    targetY = slider;
    ssY = (targetY - shadowY)/170;
    start = !start;
  }
}

