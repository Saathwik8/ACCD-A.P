class Star{
  
  float velX;
  float velY;
  float radius;
  color starC;
  float positionX=100, positionY=408;
  boolean alive;
  boolean showing;
  int counter;
  
  Star(float _pX, float _pY){
    
   positionX = _pX;
   positionY = _pY;
   
   alive = true;
   showing = true;
   
   counter = 0;
   
   //velX=random(-3,3);
   velY=10; // value of the direction 
  
   radius = random(4,10);
   
   starC = color(random(255),random(255),random(255));
   
   
  }
  
  void show(){
    // show state
   if(alive){ 
    fill(starC);
    circle(positionX, positionY, radius*2);
  
    //positionX = 100;
    positionY = positionY - velY;//decide direction
     } 
     
    else{
      // blastig
      fill(255,0,0,80);
      circle(positionX, positionY, radius*2);
      
      radius = radius + 20;
      counter++;
      
      if ( counter > 6){
      showing = false;
      }
      
    }       
      
  }
  
}
  
  
