class Elaser{
  PVector loc, vel, ploc;
  boolean dead;
 Elaser(Eship shipy){
  loc = new PVector(0,0,0);
  loc = shipy.loc.get();
  vel = new PVector(0,0,0);
  vel = loc.get();
  vel.sub( movex, movey, movez);
  vel.mult(1/(2*frameRate));
  ploc = new PVector(0,0,0);
  ploc = loc.get();
  ploc.sub(vel);
 } 
 void make(){
   loc.add(vel);
   ploc.add(vel);
   fill(0,0,255);
   line(ploc.x, ploc.y, ploc.z, loc.x, loc.y, loc.z);
 }
 void hits(){
   health-=5;
   
 }
}
