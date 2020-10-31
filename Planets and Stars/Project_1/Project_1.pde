Star mystar;
Planet myplanet;
boolean clicked;


ArrayList<Star> stars = new ArrayList<Star>();

void setup(){
 size(500,500);
 

 myplanet = new Planet();
 
 clicked = false;
 
}

void draw(){

background(242,131,144);

  myplanet.show();

  if(stars.size() > 0){
    //mystar.show();
    
    for (int i = 0; i < stars.size() - 1; i ++){
      stars.get(i).show();
    }
  }
  
  //clicked = false;
  
  //}
  
}

void mouseClicked(){
 clicked = true;
 stars.add(new Star(mouseX,mouseY));
 
}
