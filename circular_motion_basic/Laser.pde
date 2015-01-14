class Laser{
 PVector loc, vel, ploc;
float create;
boolean death=false;
boolean moved=false;

 Laser(int lasernum){

if(lasernum==1){
 loc = new PVector(width-movex, height-movey, height/( tan(PI/6))-movez);
 vel = new PVector(-1*width/120, -1*height/120,-3*height/(120*tan(PI/6))); 
  ploc= new PVector(loc.x+width/120, loc.y+height/120, loc.z+ 3*height/(120*tan(PI/6)));}
if(lasernum==2){
 loc = new PVector(0-movex, height-movey, height/( tan(PI/6))-movez);
 vel = new PVector(width/120, -1*height/120,-3*height/(120*tan(PI/6)));
 ploc= new PVector(loc.x- width/120, loc.y+ height/120, loc.z+ 3*height/(120*tan(PI/6))); }
if(lasernum==3){
 loc = new PVector(0-movex, 0-movey, height/( tan(PI/6))-movez);
 vel = new PVector(width/120, height/120,-3*height/(120*tan(PI/6))); 
  ploc= new PVector(loc.x- width/120, loc.y- height/120, loc.z+ 3*height/(120*tan(PI/6)));}
if(lasernum==4){
 loc = new PVector(width-movex, 0-movey, height/( tan(PI/6))-movez);
 vel = new PVector(-1*width/120, height/120,-3*height/(120*tan(PI/6)));
 ploc= new PVector(loc.x+ width/120, loc.y- height/120, loc.z+ 3*height/(120*tan(PI/6))); }

create=frameCount;

 }
 void make(){
   strokeWeight(4);
    loc.add(vel);
   ploc.add(vel);
   fill(255,0,0);
   stroke(255,0,0);
line(ploc.x, ploc.y,ploc.z, loc.x, loc.y, loc.z); 
strokeWeight(1);
noStroke();

 }

 void hits(Eship tship){
 tship.shield--;
 death=true;

 }
  
}
