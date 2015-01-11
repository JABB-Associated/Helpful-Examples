class Laser{
 PVector loc, vel, ploc;
float create;


 Laser(int lasernum){

if(lasernum==1){
 loc = new PVector(width, height, height/(2*tan(PI/6)));
 vel = new PVector(-1*width/120, -1*height/120,-height/(120*tan(PI/6))); 
  ploc= new PVector(loc.x+12, loc.y+12, loc.z+12);}
if(lasernum==2){
 loc = new PVector(0, height, height/(2*tan(PI/6)));
 vel = new PVector(width/120, -1*height/120,-height/(120*tan(PI/6)));
 ploc= new PVector(loc.x-12, loc.y+12, loc.z+12); }
if(lasernum==3){
 loc = new PVector(0, 0, height/(2*tan(PI/6)));
 vel = new PVector(width/120, height/120,-height/(120*tan(PI/6))); 
  ploc= new PVector(loc.x-12, loc.y-12, loc.z+12);}
if(lasernum==4){
 loc = new PVector(width, 0, height/(2*tan(PI/6)));
 vel = new PVector(-1*width/120, height/120,-height/(120*tan(PI/6)));
 ploc= new PVector(loc.x+12, loc.y-12, loc.z+12); }

create=frameCount;

 }
 void make(){
   loc.add(vel);
   ploc.add(vel);
   fill(255,0,0);
   stroke(255,0,0);
line(ploc.x, ploc.y,ploc.z, loc.x, loc.y, loc.z); 
noStroke();

 }
  
}
