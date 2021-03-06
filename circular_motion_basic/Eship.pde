//initialize Eship class
public class Eship {

  //intialize variables to control motion and size
  float velx, velz;
  PVector loc, vel;
  int amplitude=1000;
  float ypos;
  float xfactor;
  int sz;
  //initialize variables to control status of ship (shooting, having a shield, alive or dead)
  boolean shooting = false;
  int shield=2;
  boolean dead=false;
  float firingtimer=random(60, 180) ;
  //initialize variables to compensate for different center points in enemy ship files
  float tbcompx=-50;
  float tbcompy=50; 
  float tbcompz=-10;


  Eship() {

    //xfactor=random(-TAU*500, TAU*500); //for circular

    //assign values to control size, position, and motion of new ships
    xfactor = random(1, 100);
    ypos= random(-200, height);
    int sz=0;
    loc=new PVector(random(-200, width), ypos, -9000);
    vel=new PVector(0, 0, 0);
    loc.set(random(-1000, 1000), random(-1000, 1000), random(-1000, 1000));
    //control how shielded the enemy ships are based on level
    if ( level == 1) {
      shield = 2;
    }
    if ( level == 2) {
      shield = 2;
    }
    if ( level == 3) {
      shield = 3;
    }
    //initialize and assign value to variable to control movement
    float t=(frameCount+xfactor)/150;
  }

  void make() {
    //initialize and assign value to variable to control movement
    float t=(frameCount+xfactor)/150;
    //assign values for movement
    velz = amplitude*((sin(t))*(-sin(pow(t, 5))/248832 - 2*cos(4*t) + exp(cos(t)))+(cos(t))*(-5*pow(t, 4)*cos(pow(t, 5)/248832)/248832)+8*sin(4*t)-(sin(t)*exp(cos(t))))  ;
    velx = amplitude*((cos(t))*(-sin(pow(t, 5))/248832 - 2*cos(4*t) + exp(cos(t)))+(sin(t))*(-5*pow(t, 4)*cos(pow(t, 5)/248832)/248832)+8*sin(4*t)-(sin(t)*exp(cos(t))))  ;
    vel.set(velx, 0, velz);
    vel.limit(22);
    loc.add(vel);

    //loc.set(width/2+width/2*sin((frameCount+xfactor)*TAU/360), ypos, -300*height/(120*tan(PI/6))*cos((frameCount+xfactor)*TAU/360)); //circular path
    // loc.set(500*sin(t), ypos, -2300);    //for testing
    //loc.set(width/2+(amplitude*sin(t))* (exp(cos(t))-2*cos(4*t)-sin(pow((t/12), 5))), ypos, (amplitude*cos(t))* ((exp(cos(t)))-2*cos(4*t)-sin(pow((t/12), 5)))); //random butterfly-like path

    //moves the ship in three dimensions
    translate(loc.x, loc.y, loc.z);
    //assigns colors to the ships
    fill(255, 255, 0, 200);


//load and scale different ships based on the level
    if (level==1) {
      amplitude=1000;
      sz=90;
      scale(10, 10, 10);
      shape(Tiefighter);
      scale(.1, .1, .1);
    }
    if (level==2) {
      scale(.7, .7, .7);
      shape(Tiebomber);
      scale(1/.7, 1/.7, 1/.7);
      amplitude=1000;
      sz=90;
      translate(tbcompx, tbcompy, tbcompz);
    }
    if (level==3) {
      amplitude=5000;
      scale(5, 5, 5);
      shape(Destroyer);
      sz=450;
      scale(.2, .2, .2);
    }
    //color ships differently based on remaining shield health
    if (shield == 3) {
      fill(0, 255, 0, 75);
    }
    if (shield==2) {
      fill(0, 255, 255, 65);
    }
    if (shield==1) {
      fill(255, 0, 0, 65);
    }
    //create the shield around the ships
    sphere(sz);
    fill(255, 255, 0, 200);
    //compensate for different center points in different files
    if (level==2) {
      translate(-tbcompx, -tbcompy, -tbcompz);
    }
    //control motion
    translate(-1*loc.x, -1*loc.y, -1*loc.z);
    fill(0);
    //when ships shields are depleted, remove them and add score
    if (shield<=0) {
      dead=true;
      score++;
      addmiss=false;
    }
  }
}

