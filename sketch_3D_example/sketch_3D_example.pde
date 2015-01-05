int x, y, z;

void setup(){
size(displayWidth, displayHeight, P3D);
}

void draw(){
  background(0);
  fill(0,0,255);
  translate(mouseX,mouseY,20);
  rotateX(5*x);
rotateY(5*y);
rotateZ(5*z);
sphere(60);
translate(-50,-50,0);
box(70);

}


void keyPressed(){
 if(key=='d'){
 x+=5;} 
 if(key=='s'){
 x-=5;} 
 if(key=='e'){
 y+=5;} 
 if(key=='w'){
 y-=5;} 
 if(key=='x'){
 z+=5;} 
 if(key=='z'){
 z-=5;} 
}
