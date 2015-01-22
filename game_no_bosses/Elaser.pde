class Elaser {
  PVector loc, vel, ploc;
  boolean dead;
  float created;
  float aimx;
  float aimy;
  float aimz; //these variables create a chance that the lasers miss

  Elaser(Eship shipy) {
    aimx = (random(-500, 500))/500;  //the bias factor is set. Notice that the chance of firing accurately is .5
    aimy = (random(-500, 500))/500;
    aimz = (random(-500, 500))/500;

    created = frameCount;

    loc = new PVector(0, 0, 0);
    loc = shipy.loc.get();

    if (level==2) {
      loc.add(-50, 50, -10);
    }

    vel = new PVector(0, 0, 0);
    vel = loc.get();
    vel.sub(width/2, height/2, height/( 2*tan(PI/6)));
    vel.add(movex, movey, movez);
    vel.add((round(aimx))*random(-500, 500), (round(aimy))*random(-500, 500), (round(aimz))*random(-500, 500)); 
    vel.mult(-1/frameRate);

    ploc = new PVector(0, 0, 0);
    ploc = loc.get();
    ploc.sub(vel);
  } 

  void make() {
    //if(loc.x -width/2 <100 && loc.y- height/2<100 && loc.z-height/(2*tan(PI/6))<100){
    //println("YAYAYAYA");} //testing
    loc.add(vel);
    ploc.add(vel);

    fill(0, 255, 0);
    stroke(0, 255, 0);
    strokeWeight(5);

    line(ploc.x, ploc.y, ploc.z, loc.x, loc.y, loc.z);

    noStroke();
    strokeWeight(1);
  }

  void hits() {
    health-=5;
  }
}

