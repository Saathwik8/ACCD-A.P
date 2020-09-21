
float posX = 100.0;
float posY = 100.0;

float velX = 3;
float velY = 3;

float radius = 50;

float wildcard = 0;

//boolean dirX= true; // it means left

void setup() {
  size(500, 700);
}

void draw() {

  background(242,131,144);
 
  circle(posX, posY, radius*2);
  
  if(millis()%5000 == 0){  
  wildcard = random(-1,1);
  println(wildcard);
  
  }
  
  if(posX + radius >= width || posX - radius <=0) {
  velX = velX*-1;
  }
  
  posX = posX + velX;
  
  if(posY + radius >= height || posY - radius <=0){
  velY = velY*-1;
  
  }
  
  posY = posY + velY;
  
}
