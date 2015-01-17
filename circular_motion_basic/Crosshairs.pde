class Crosshairs{
  
 Crosshairs(){
  
 } 
 void make(){
   float sz = 100/(1-((-3*height/((2*frameRate)*sq(zfire))*frameRate)/2078)); //resizes cursor to show where you're firing
  stroke(255,0,0);
  fill(255,0,0);
 translate(-movex, -movey, -movez);
 rotateX(-rotatey);
 rotateY(-rotatex);
  ellipse(width/2, height/2, sz/3, sz/3);
  noFill();
  ellipse(width/2, height/2, sz,sz);
  translate(movex,movey, movez);
  rotateX(rotatey);
  rotateY(rotatex);
 noStroke(); 

 }
  
}
