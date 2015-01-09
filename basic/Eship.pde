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
    fill(255,255,0,200);
box(sz*2/sqrt(3));
 fill(0,255,255,65);
 sphere(sz);
 fill(255,255,0,200);
box(sz*2/sqrt(3));
translate(-1*loc.x, -1*loc.y, -1*loc.z);

fill(0);
}

}
