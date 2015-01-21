public class Boss {


  PVector loc, vel;
  int sz=90;
  boolean shooting;
  int shield=2;
  boolean dead=false;
  float ypos;
  float firingtimer=0;
    float dscompx=500;
  float dscompy=-500; 
  float dscompz=-10;
    float tacompx=-50;
  float tacompy=50; 
  float tacompz=-10;
  //float xfactor;
  //int amplitude=1000;

  Boss() {
    //xfactor=random(-TAU*500, TAU*500); //for circular
    //xfactor = random(1, 100);
    ypos= height/2;
    int sz=90;
    loc=new PVector(random(-200, width), ypos, -9000);
    vel=new PVector(0, 0, 8);
    if(level==1 && bosstime){
     shield = 15;}
     if(level==2 && bosstime){
     shield = 30;}
     if(level==3 && bosstime){
     shield = 50;}
  }

  void make() {
    float t=(frameCount//+xfactor
    )/150;
    //loc.set(width/2+width/2*sin((frameCount+xfactor)*TAU/360), ypos, -300*height/(120*tan(PI/6))*cos((frameCount+xfactor)*TAU/360)); //circular path
    // loc.set(500*sin(t), ypos, -2300);    //for testing
    loc.add(vel);

    translate(loc.x, loc.y, loc.z);
    fill(255, 255, 0, 200);

    if (level == 1 && bosstime) {
      translate(tacompx, tacompy, tacompz);
      scale(30,30,30);
      shape(Boss1);
   sz=500;
      scale(1/30,1/30,1/30);
     
      translate(-tacompx, -tacompy, -tacompz);
    }
    if ( level == 2 && bosstime) {
      scale(25, 25, 25);
      shape(Destroyer);
         vel.set(loc.x, loc.y, loc.z);
      vel.sub(movex, movey, movez);
      vel.mult(1/(10*frameRate));
      sz=150;
 
      scale(1/25,1/25,1/25);
    }
    if(level==3 && bosstime){
      translate(dscompx, dscompy, dscompz);
    scale(20,20,20);
  shape(deathstar);
loc.set(0,0,0);
vel.set(0,0,0);
sz=1200;
scale(.05, .05, .05);

  translate(-dscompx, -dscompy, -dscompz);}
    if (shield>=3) {
      fill(0, 0, 255, 90);
    }
    if ((shield==8 && level == 1) || (shield==10 && level ==2) || (shield == 25 && level == 3)) {
      fill(0, 255, 255, 65);
    }
    if ((shield==3 && level == 1) || (shield==5 && level ==2) || (shield == 10 && level == 3)) {
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

