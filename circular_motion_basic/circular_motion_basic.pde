import ddf.minim.*;
AudioPlayer DuelofFates;
Minim minim;
ArrayList <Laser> lasers= new ArrayList<Laser>();
ArrayList <Eship> eships= new ArrayList<Eship>();
ArrayList <Missile> missiles = new ArrayList<Missile>();
int missilecount=0;
int fc=0;
float fc1=-20;
float fc2=-50;
int score=0;
boolean shipoff=false;
int movex=0;
int movey=0;
int movez=0;
int rotatex;
int rotatey;
boolean keys[]= new boolean[255];
Crosshairs ch= new Crosshairs();
boolean addmiss=true;
void setup() {
  size(displayWidth, displayHeight, P3D);  
  noStroke();
  minim= new Minim(this);
  DuelofFates=minim.loadFile("Duel of Fates.mp3", 5048);
  
  
}
void draw() {
  frameRate(60);
  background(0);
  DuelofFates.play();
  fill(0, 255, 0);
  noStroke();
  textSize(30);
  text(score, 100, 100);
  text(missilecount,width-300, 100);
  
  if (score%5==0 && score!=0 && addmiss==false) {
    missilecount+=score/5;
    addmiss=true;
  }
  update();
  translate(movex, movey, movez);
  rotateX(rotatey);
  rotateY(rotatex);

  if ((frameCount-fc>20 || shipoff) && eships.size()<=30) {
    eships.add(new Eship());
    fc=frameCount;
    shipoff=false;
  }
  //ship-laser detection loop
  for (int i=eships.size ()-1; i>1; i--) {
    Eship myship=eships.get(i);
    for (int j=lasers.size ()-1; j>1; j--) {
      Laser mylase=lasers.get(j);
      if (dist(myship.loc.x, myship.loc.y, myship.loc.z, mylase.loc.x, mylase.loc.y, mylase.loc.z)<=myship.sz) {
        mylase.hits(myship);
      }
    }
    for (int k= missiles.size ()-1; k>1; k--) {
      Missile mymiss = missiles.get(k);
      if (dist(mymiss.loc.x, mymiss.loc.y, mymiss.loc.z, myship.loc.x, myship.loc.y, myship.loc.z)<=myship.sz + mymiss.sz) {
        mymiss.hits(myship);
      }
    }
  }

    for (int i=eships.size ()-1; i>1; i--) {
      Eship myship=eships.get(i);
      myship.make();
      if ( myship.dead) {
        eships.remove(myship);
      }
      if (myship.loc.z>=6*height/(2*tan(PI/6)) ) {
        myship.vel.z=-abs(myship.vel.z);
      }
      if (myship.loc.z<=-6*height/(2*tan(PI/6))) {
        myship.vel.z=abs(myship.vel.z);
      }
    }
    for ( int j=lasers.size ()-1; j>1; j--) {
      Laser mylase=lasers.get(j);
      mylase.make();


      if (frameCount-mylase.create>60 || mylase.death) {
        lasers.remove(mylase);
      }

      ch.make();
    }
    for (int k=missiles.size ()-1; k>1; k--) {
      Missile mymiss=missiles.get(k);
      mymiss.make();
      if (frameCount-mymiss.fc>120) {
        mymiss.exploding();
        if(frameCount-mymiss.fc>700){
        missiles.remove(mymiss);}
      }
    }
  
}



void keyPressed() {

  if (keyPressed) {
    if ((key=='O' || key=='o') && frameCount-fc1>=10) {
      lasers.add(new Laser(1));
      lasers.add(new Laser(2));
      lasers.add(new Laser(3));
      lasers.add(new Laser(4));
      fc1=frameCount;
    }
    if ((key=='I' || key=='i') && frameCount-fc2>=50 && missilecount>=1) {
      missiles.add(new Missile());
      fc2=frameCount;
      if(missilecount>0){
      missilecount--;}
    }
    if (key!=CODED) {
      keys[key]=true;
    }
    if (key==CODED) {
      keys[keyCode]=true;
    }
  }
}
void keyReleased() {
  if (key!=CODED) {
    keys[key]=false;
  }
  if (key == CODED) {
    keys[keyCode]=false;
  }
}

void update() {


  if (keys['w'] || keys['W']) {
    movey+=10;
  }
  if (keys['s'] || keys['S']) {
    movey-=10;
  }
  if (keys['d'] || keys['D']) {
    movex-=10;
  }
  if (keys['a'] || keys['A']) {
    movex+=10;
  }
  if (keys['z'] || keys['Z']) {
    movez+=10;
  }
  if (keys['x'] || keys['X']) {
    movez-=10;
  }
  if (keys[UP]) {
    rotatey+=PI*50/180;
  }
  if (keys[DOWN]) {
    rotatey-=PI*50/180;
  }
  if (keys[LEFT]) {
    rotatex-=PI*50/180;
  }
  if (keys[RIGHT]) {
    rotatex+=PI*50/180;
  }
}

