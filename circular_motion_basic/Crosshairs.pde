class Crosshairs{
  
 Crosshairs(){
  
 } 
 void make(){
  stroke(255,0,0);
  fill(255,0,0);
 translate(-movex, -movey, -movez);
 rotateX(-rotatey);
 rotateY(-rotatex);
  ellipse(width/2, height/2, 10,10);
  noFill();
  ellipse(width/2, height/2, 30,30);
  translate(movex,movey, movez);
  rotateX(rotatey);
  rotateY(rotatex);
 noStroke(); 

 }
  
}
