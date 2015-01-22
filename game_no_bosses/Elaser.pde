<<<<<<< HEAD
class Elaser {

=======
//initialize Elaser class (enemy lasers)
class Elaser {
  //initialize variables to control the enemy laserss
>>>>>>> origin/master
  PVector loc, vel, ploc;
  boolean dead;
  float created;
  //initialize variables to create a chance that enemy lasers miss
  float aimx;
  float aimy;
<<<<<<< HEAD
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
   
=======
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
>>>>>>> origin/master
    vel = new PVector(0, 0, 0);
    vel = loc.get();
    vel.sub(width/2, height/2, height/( 2*tan(PI/6)));
    vel.add(movex, movey, movez);
    vel.add((round(aimx))*random(-500, 500), (round(aimy))*random(-500, 500), (round(aimz))*random(-500, 500)); 
    vel.mult(-1/frameRate);
<<<<<<< HEAD
   
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
=======
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
>>>>>>> origin/master
    health-=5;
  }
}

