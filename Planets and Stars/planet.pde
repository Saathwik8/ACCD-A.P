class Planet{
  
  float velX=1;
  float radius;
  color planetC;
  float positionX, positionY; 
  
  Planet(){
   
   positionX = -100;
   positionY = height/2;
   
   
  
   radius = random(25,50);
   
   
   planetC = color(random(255),random(255),random(255));
   
  }
  
  void show(){
    
   
    fill(planetC);
    circle(positionX, positionY, radius*2);
    
  
    positionX = positionX + velX;
    
    if(positionX==600){
      positionX = -100;
    }
  
  
  }
  
  
    
}
 
