Star mystar;
Planet myplanet;
boolean clicked;
PImage img;
PImage img1;

ArrayList<Star> stars = new ArrayList<Star>();

import processing.serial.*; 
Serial myPort;    // The serial port
String inString = "";  // Input string from serial port
int lf = 10;      // ASCII linefeed 
float rotateVal = 0;
float translateValue = 0;
boolean buttonpress = false;

 float velX;
 float velY;
 float radius;
 color starC;
 float positionX;
 float positionY = 408;
 boolean alive;
 boolean showing;
 int counter;
 PVector v1;
 
 float posX;


void setup() {
  size(500, 500);

  img = loadImage("groud.jpg");
  img1 = loadImage("bhoom.png");

  myplanet = new Planet();

  clicked = false;
  printArray(Serial.list()); 
  myPort = new Serial(this, Serial.list()[3], 9600); 
  myPort.bufferUntil(lf);
 // v1 = new PVector();
  
}

void draw() {

  
  pressCheck();
  // background(242, 131, 144);
  background(255, 255, 255);
  image(img, 0, 0);
  image(img1, posX, 408); //-100 400



  myplanet.show();
  fill(255, 0, 0);
 // push();
  //translate(width/2, height - 50);
 // rotate(translateValue); // rotate(translateValue);
  //rect(0, -25, 80, 40);
 // pop();


  if (stars.size() > 0) {
    //mystar.show();

    for (int i = 0; i < stars.size() - 1; i ++) {

      Star mystar = stars.get(i);

      if (dist(myplanet.positionX, myplanet.positionY, mystar.positionX, mystar.positionY)<= myplanet.radius+mystar.radius) {
        mystar.alive = false;
      }

      if (mystar.showing) {
        mystar.show();
      } else {
        stars.remove(i);
      }
    }
  }
}


      

//void keyPressed() {
//  if (key == CODED) {
//    if (keyCode == LEFT) {
      
//      translateValue-= PI/8;
//      positionX-= PI/8;
      
//    } else if (keyCode == RIGHT) {
//      translateValue+= PI/8;
//       positionX+= PI/8;
//    }
//  }
//}

void serialEvent(Serial p) { 
  inString = p.readString(); 
  //println("hello event");
  //println(inString);

  if (inString != null) {
    String[] data = split(trim(inString), ":");
    if (data.length == 2){    
      translateValue = map(float(data[0]), 0, 1023, -PI, 0);
      positionX = map(float(data[0]), 0, 1023, 30, 500);
      posX = map(float(data[0]), 0, 1023, -100, 400);
      buttonpress = boolean(int(float(data[1])));
    }
  }
}

void pressCheck() {
    if (buttonpress == true) {
    stars.add(new Star(positionX,positionY));
    //mystar.show();
  } 
}
