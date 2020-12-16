class Planet{
  

  float velX;
  float radius;
  color planetC;
  float positionX, positionY; 
  
  Planet(){
    
   
   positionX = random(-3,3);
   positionY = random(50,200);
   
   velX=10;
  
   radius = random(25,50);
   
   planetC = color(random(255),random(255),random(255));
   
  }
  
  void show(){
   
    fill(planetC);
    circle(positionX, positionY, radius*2);
    
    positionX = positionX + velX;
    
    if(positionX >= width+(radius*2)){
      positionX = -(radius*2);
    }
  
  }
  
  
    
}
 
