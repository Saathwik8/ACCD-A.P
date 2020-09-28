class Star{
  
  float velX=random(-3,3);
  float velY=random(-3,3);
  float radius;
  color starC;
  float positionX, positionY; 
  
  Star(float _pX, float _pY){
    
   positionX = _pX;
   positionY = _pY;
  
   radius = random(4,14);
   
   starC = color(random(255),random(255),random(255));
   
   
  }
  
  void show(){
    fill(starC);
    circle(positionX, positionY, radius*2);
  
    positionX = positionX + velX;
    positionY = positionY + velY;
  }
  
  
    
  
}
  
  
