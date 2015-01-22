//initialize Elaser class (enemy lasers)
class Elaser {
  //initialize variables to control the enemy laserss
  PVector loc, vel, ploc;
  boolean dead;
  float created;
  //initialize variables to create a chance that enemy lasers miss
  float aimx;
  float aimy;
  float aimz;
  
  Elaser(Eship shipy) {
    //assign values to variables to create a chance that the enemy lasers miss
    aimx = (random(-500, 500))/500;
    aimy = (random(-500, 500))/500;
    aimz = (random(-500, 500))/500;
    //assign value to help remove enemy lasers after a time
    created = frameCount;
    //assign values to determine location and movement of enemy lasers
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
      
    //move the enemy laser
    loc.add(vel);
    ploc.add(vel);
    //make the enemy lasers green and display them
    fill(0, 255, 0);
    stroke(0, 255, 0);
    strokeWeight(5);
    line(ploc.x, ploc.y, ploc.z, loc.x, loc.y, loc.z);
    noStroke();
    strokeWeight(1);
  }
  void hits() {
    //subtract from your health when the enemy lasers hit you
    health-=5;
  }
}

