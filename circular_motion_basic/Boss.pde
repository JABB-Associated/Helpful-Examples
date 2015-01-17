public class Boss {

  
  PVector loc, vel;
  int sz=90;
  boolean shooting;
  int shield=2;
  boolean dead=false;
  float ypos;
  float xfactor;
  int amplitude=1000;

  Boss() {
    //xfactor=random(-TAU*500, TAU*500); //for circular
    xfactor = random(1,100);
    ypos= random(-200, height);
    int sz=90;
    loc=new PVector(random(-200, width), ypos, -9000);
    vel=new PVector(0, 0, 25);
  }

  void make() {
    float t=(frameCount+xfactor)/150;
    //loc.set(width/2+width/2*sin((frameCount+xfactor)*TAU/360), ypos, -300*height/(120*tan(PI/6))*cos((frameCount+xfactor)*TAU/360)); //circular path
    // loc.set(500*sin(t), ypos, -2300);    //for testing
   loc.add(vel);

    translate(loc.x, loc.y, loc.z);
    fill(255, 255, 0, 200);
    scale(10,10,10);
       if(level == 1 && bosstime){
    shape(Boss1);
  vel.set(loc.x, loc.y, loc.z);
  vel.sub(movex, movey, movez);
}
    scale(.1,.1,.1);
    if (shield==2) {
      fill(0, 255, 255, 65);
    }
    if (shield==1) {
      fill(255, 0, 0, 65);
    }
    sphere(sz);
    fill(255, 255, 0, 200);

    translate(-1*loc.x, -1*loc.y, -1*loc.z);

    fill(0);
    if (shield<=0) {
      dead=true;
      score+=50;
      pscore= score;
      addmiss=false;
      level++;
      wavetime= true;
      bosstime= false;
      bossadded= false; 
    }
  }
}

