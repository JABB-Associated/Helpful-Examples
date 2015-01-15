class Missile {
  PVector loc, vel;
  int sz=25;
  float fc=0;
  boolean exploding=false;
  Missile() {

    loc = new PVector(width/2-movex, 4*height/5-movey, height/(2* tan(PI/6))-movez);
    vel = new PVector(0, 0, -20);
    fc=frameCount;
  }
  void make() {
    if (frameCount-fc<80)
    {
      loc.add(vel);
    }
    println("displaying missile");
    translate(loc.x, loc.y, loc.z);
    fill(0, 255, 0 );
    sphere(sz);

    translate(-1*loc.x, -1*loc.y, -1*loc.z);
  }
  void exploding() {
    if (sz<=250) {

      sz+=10;
    }
  }
  void hits(Eship tempship) {
    tempship.shield=0;
  }
}

