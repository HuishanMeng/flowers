float flowerX;
float flowerY;
float r;
float z;
float wave;
float bloomRadius;
float x;
float y;
float speedX=10;
int value=0;
float n=noise(wave)*width/12;
String s="Press any key";
int showFlower=1;
void setup() {
  size(800, 800);
}
void draw() {
  background(128, 197, 230);
  flowerX=width/16;
  flowerY=height/2;
  wave=wave+0.03;
  z=width/6; 
  y=height/4;
  x=x+speedX;
  textAlign(CENTER);
  textSize(20);
  fill(255, 240, 38);
  //set the location of the text
  text(s, width/4*3, height/10);
  if (showFlower==-1) {
    if ((x>width/2-30)) {
      x=x-width/2;
    }
    pushMatrix();
    translate(x, y-200);
    drawPetal(x, y-100);
    drawPetal(x-40, y-50);
    popMatrix();
    pushMatrix();
    translate(x-10, y-50);
    drawPetal(x, y-100);
    drawPetal(x-40, y-50);
    popMatrix();
  }
  for (z=0; z<width-width/8; z=z+width/8) {
    drawFlower(flowerX+z, flowerY);
  }
}
void drawFlower(float flowerX, float flowerY) {
  frameRate(8);
  pushMatrix();
  int numPetals=8;
  float n=noise(wave)*width/12;
  translate(flowerX, flowerY);
  strokeWeight(2);
  stroke(125, 138, 46);
  line(2+n, 10, 2, height/2);
  line(-2+n, 10, -2, height/2);
  translate(n, 0);
  strokeWeight(1);
  noStroke();
  fill(205, 232, 85);
  ellipse(10, 80, 10, 10);
  ellipse(10, 160, 10, 10);
  ellipse(10, 240, 10, 10);
  fill(255);
  ellipse(-18, 200, 10, 10);
  ellipse(-18, 120, 10, 10);
  for (float rot = 0; rot < 2*PI; rot += 2*PI/ numPetals) {
    rotate(rot);
    stroke(125, 138, 46);
    fill(255, 255, 157);
    ellipse(-5, -5, 5, 5);
    fill(255, 83, 13);
    beginShape();
    vertex(5, 5);
    bezierVertex(5, 5, 50, 20, 30, 30);
    bezierVertex(30, 30, 20, 60, 5, 5);
    endShape();
  }
  popMatrix();
}
void drawPetal(float x, float y) {
  fill(255, 97, 56);
  beginShape();
  vertex(x+5, y+5);
  bezierVertex(x+5, y+5, x+50, y+20, x+30, y+ 30);
  bezierVertex(x+30, y+30, x+20, y+60, x+5, y+5);
  endShape();
}
void keyPressed() {
  if (value==0) {
    showFlower*=-1;
  }
}
