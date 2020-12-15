//Serial Stuff
import processing.serial.*; 
Serial myPort;    // The serial port
String inString = "";  // Input string from serial port
int lf = 10;      // ASCII linefeed 
float rotateVal = 0;
float translateValue = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  fill(255, 0, 0);
  translate(width/2, height - 100);
  rotate(translateValue); // rotate(translateValue);
  rect(0, -25, 100, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      translateValue-= PI/8;
    } else if (keyCode == RIGHT) {
      translateValue+= PI/8;
    } else if (keyCode == click) {
      projectile = new projectile();
    }
  }
}

class projectile {
  projectile() {
    angleofprojectile = translateValue;
  }
  void fire() {
  pushamatrix();
  translate(l*cos(angleofprojectile, l * sin(angleofprojectile)));
  rect(l * cos(angleofprojectile, l * sin(angleofprojectile), 40, 40));
  thisrectxpos = l * cos(angleofprojectile);
  thisrectypos = l * sin(angleofprojectile);
  popMatrix();
  
}
}


void serialEvent(Serial p) { 
  inString = p.readString(); 
  //println("hello event");
  //println(inString);

  if (inString != null) {
    String[] data = split(trim(inString), "|");

    translateValue = map(float(data[0]), 0, 4096, -PI, PI);
  }
}
