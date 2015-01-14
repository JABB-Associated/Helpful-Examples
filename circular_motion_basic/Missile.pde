class Missile {
  PVector loc, vel;
  int sz=40;
  float fc=0;
  boolean exploding=false;
  Missile() {

    loc = new PVector(width/2-movex, 4*height/5-movey, height/( tan(PI/6))-2*movez);
    vel = new PVector(0, 0, 20);
    fc=frameCount;
  }
  void make() {
//    translate(loc.x, loc.y, loc.z);
    fill(0, 255,0 , 70);
    sphere(sz);
    fill(0, 120, 120, 100);
    sphere(sz-20);
//    translate(-1*loc.x, -1*loc.y, -1*loc.z);
  }
  void exploding() {
    if(sz<=250){
      
    sz+=5;
    }
  }
  void hits(Eship tempship) {
    tempship.shield=0;
  }
}

