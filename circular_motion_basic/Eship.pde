public class Eship {


  PVector loc, vel;
  int sz;
  boolean shooting = false;
  int shield=2;
  boolean dead=false;
  float ypos;
  float xfactor;
  int amplitude=1000;
  float tbcompx=-50;
  float tbcompy=50; 
 float tbcompz=-10;
 float firingtimer=0 ;

  Eship() {
    //xfactor=random(-TAU*500, TAU*500); //for circular
    xfactor = random(1, 100);
    ypos= random(-200, height);
    int sz=0;
    loc=new PVector(random(-200, width), ypos, -9000);
    vel=new PVector(0, 0, 0);
    if( level == 1){
     shield = 2;}
      if( level == 2){
     shield = 2;}
      if( level == 3){
     shield = 3;}
  }

  void make() {
    float t=(frameCount+xfactor)/150;
    //loc.set(width/2+width/2*sin((frameCount+xfactor)*TAU/360), ypos, -300*height/(120*tan(PI/6))*cos((frameCount+xfactor)*TAU/360)); //circular path
    // loc.set(500*sin(t), ypos, -2300);    //for testing
   loc.set(width/2+(amplitude*sin(t))* (exp(cos(t))-2*cos(4*t)-sin(pow((t/12), 5))), ypos, (amplitude*cos(t))* ((exp(cos(t)))-2*cos(4*t)-sin(pow((t/12), 5)))); //random butterfly-like path
    translate(loc.x, loc.y, loc.z);
    fill(255, 255, 0, 200);

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
       translate(tbcompx, tbcompy,tbcompz);
       
    }
    if (level==3) {
      
      amplitude=5000;
      scale(5, 5, 5);
      shape(Destroyer);
      sz=450;
      scale(.2, .2, .2);
    }
 if (shield == 3){
 fill(0,255,0,75);}
    if (shield==2) {
      fill(0, 255, 255, 65);
    }
    if (shield==1) {
      fill(255, 0, 0, 65);
    }
    sphere(sz);
    fill(255, 255, 0, 200);
    if (level==2) {
      translate(-tbcompx, -tbcompy, -tbcompz);
    }
    translate(-1*loc.x, -1*loc.y, -1*loc.z);

    fill(0);
    if (shield<=0) {
      dead=true;
      score++;
      addmiss=false;
    }
  }
}

