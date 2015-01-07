
ArrayList <Eship> eships= new ArrayList<Eship>();
int fc=0;
void setup(){
size(displayWidth, displayHeight, P3D);  
noStroke();
}
void draw(){
  background(255);

  if(frameCount-fc>10){
  eships.add(new Eship());
fc=frameCount;}
for(int i=eships.size()-1; i>1; i--){
Eship myship=eships.get(i);
myship.make();
if(myship.loc.z>=height/(2*tan(PI/6))){
eships.remove(myship);}
}
 
}



class Eship{
  PVector loc, vel;
  int sz=90;
  boolean shooting;
  Eship(){
   int sz=90;
   loc=new PVector(random(-200, width), random(-200,height), -9000);
vel=new PVector(random(-20,20), random(-20,20), 50);
  }
  void make(){
    loc.add(vel);
    
   translate(loc.x, loc.y, loc.z);
    fill(0,0,0,200);
box(sz*2/sqrt(3));
 fill(0,255,255,65);
 sphere(sz);
 fill(0,0,0,200);
box(sz*2/sqrt(3));
translate(-1*loc.x, -1*loc.y, -1*loc.z);

fill(0);
}

}
