class Eship{
  PVector loc, vel;
  int sz=90;
  boolean shooting;
  int shield=2;
  boolean dead=false;
  float ypos;
  float xfactor;
  int amplitude=1000;
  Eship(){
    xfactor=random(-TAU*500, TAU*500);
    ypos= random(-200,height);
   int sz=90;
   loc=new PVector(random(-200, width),ypos, -9000);
vel=new PVector(0,0,0);
  }
  void make(){
 loc.set(width/2+width/2*sin((frameCount+xfactor)*TAU/360), ypos , -300*height/(120*tan(PI/6))*cos((frameCount+xfactor)*TAU/360));
   translate(loc.x, loc.y, loc.z);
    fill(255,255,0,200);
box(sz*2/sqrt(3));
if(shield==2){
 fill(0,255,255,65);}
 if(shield==1){
 fill(255,0,0,65);}
 sphere(sz);
 fill(255,255,0,200);

translate(-1*loc.x, -1*loc.y, -1*loc.z);

fill(0);
if(shield<=0){
dead=true;
score++;
addmiss=false;}
}

}
