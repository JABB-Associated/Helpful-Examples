class Laser{
 PVector loc, vel, ploc;
float create;


 Laser(int lasernum){

if(lasernum==1){
PVector loc = new PVector(width, height, height/(2*tan(PI/6)));
PVector vel = new PVector(-1*width/720, -1*height/720,-400/360); }
if(lasernum==2){
PVector loc = new PVector(0, height, height/(2*tan(PI/6)));
PVector vel = new PVector(width/720, -1*height/720,-400/360); }
if(lasernum==3){
PVector loc = new PVector(0, 0, height/(2*tan(PI/6)));
PVector vel = new PVector(width/720, height/720,-400/360); }
if(lasernum==4){
PVector loc = new PVector(width, 0, height/(2*tan(PI/6)));
PVector vel = new PVector(-1*width/720, height/720,-400/360); }
PVector ploc= new PVector(loc.x-12, loc.y-12, loc.z-12);
create=frameCount;

 }
 void make(){
   loc.add(vel);
   ploc.add(vel);
   fill(255,0,0);
   stroke(255,0,0);
line(ploc.x, ploc.y,ploc.z, loc.x, loc.y, loc.z); 
 }
  
}
