//Serial Stuff
import processing.serial.*; 
Serial myPort;    // The serial port
String inString = "";  // Input string from serial port
int lf = 10;      // ASCII linefeed 
float rotateVal = 0;
float translateValue = 0;
boolean buttonpress = false;

void setup() {
  size(500, 500);

  printArray(Serial.list()); 
  myPort = new Serial(this, Serial.list()[3], 9600); 
  myPort.bufferUntil(lf);
}

void draw() {

  if (buttonpress) {
    background(255);
  } else {
    background(0);
  }

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
    }
  }
}

void serialEvent(Serial p) { 
  inString = p.readString(); 
  //println("hello event");
  //println(inString);

  if (inString != null) {
    String[] data = split(trim(inString), ":");
    if (data.length == 2){    
      translateValue = map(float(data[0]), 0, 1023, -PI, 0);
      buttonpress = boolean(int(float(data[1])));
    }
  }
}
