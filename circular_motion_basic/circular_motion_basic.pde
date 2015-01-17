import ddf.minim.*;
AudioPlayer DuelofFates;
//AudioPlayer Blaster;
Minim minim;

int health = 1000;
PShape Boss1;
PShape Destroyer;
PShape Tiebomber;
PShape Tiefighter;
//PImage cockpit;
ArrayList<Elaser> elasers = new ArrayList<Elaser>();
ArrayList <Boss> bosses= new ArrayList<Boss>();
ArrayList <Laser> lasers= new ArrayList<Laser>();
ArrayList <Eship> eships= new ArrayList<Eship>();
ArrayList <Missile> missiles = new ArrayList<Missile>();
int missilecount=0;
//float fc=0;
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
boolean addmiss=true; //checks for duplicate missile addition
float zfire = ( tan(PI/6)) ;
int level=-1;
boolean bosstime= false; 
boolean bossadded = false;
boolean wavetime= false;
int pscore=0;

void setup() { 
  noStroke();
  minim = new Minim(this);
  DuelofFates = minim.loadFile("Duel of Fates.mp3", 512);
  //Blaster = minim.loadFile("X Wing Sound.mp3", 5048);
  Tiefighter = loadShape("Tiefighter.obj");
  Tiebomber = loadShape("Tie Super.obj");
  Destroyer = loadShape("Imperial Class Destroyer.obj");
  Boss1 = loadShape("tiefighterboss.obj");
  //cockpit = loadImage("maxresdefault.png");
  size(displayWidth, displayHeight, P3D);
}

void draw() {
  if (mousePressed ) {
    if (level<3) {
      level++;
    } else {
      level=1;
    }
  }
  frameRate(60);
  background(0);
  DuelofFates.play();
  fill(0, 0, 255);
  rect(50, 120, 20, -health/10); //health bar
  fill(0, 255, 0);
  rect(width-120, 120, 20, -20*(score%5)); //shows how close to getting missiles you are
  if (bosstime) {
    bosses.add( new Boss());
    bossadded= true;
  }
  noStroke();
  textSize(30);
  text(score, 150, 100); //display score
  text("M" + " " + missilecount, width-300, 100); // display number of missiles
  textSize(20);
  text("Range:" + -1*round(-3*height/((2*frameRate)*zfire)*frameRate) + "meters", width-225, height/2);
  textSize(30);
  //image(cockpit, 0,0);
  if (score%5==0 && score!=0 && addmiss==false) { //awards you with a missile if this is your first time reaching that multiple of 5 (score)
    missilecount+=2;
    addmiss=true;
  }

  update();

  translate(movex, movey, movez);
  rotateX(rotatey);
  rotateY(rotatex);

  if (level>0 && !bosstime) {
    wavetime=true;
  }
  if (// (frameCount-fc>20 || shipoff) && eships.size()<=15) {
  eships.size()+score-pscore <= 15) {
    eships.add(new Eship());
    // fc=frameCount;
    //shipoff=false;
  }
  if (score-pscore >=15 && wavetime) {
    bosstime=true;
    wavetime = false;
  }

  for (int i= bosses.size ()-1; i>=0; i--) {
    Boss thisboss = bosses.get(i);
    thisboss.make();
  }
  //ship-laser detection loop
  for (int i=eships.size ()-1; i>=0; i--) {
    Eship myship=eships.get(i);

    for (int j=lasers.size ()-1; j>=0; j--) {
      Laser mylase=lasers.get(j);

      if (dist(myship.loc.x, myship.loc.y, myship.loc.z, mylase.loc.x, mylase.loc.y, mylase.loc.z)<=myship.sz) {
        mylase.hits(myship);
      }
    }

    for (int k= missiles.size ()-1; k>=0; k--) {
      Missile mymiss = missiles.get(k);
      fill(0, 255, 0);

      if (dist(mymiss.loc.x, mymiss.loc.y, mymiss.loc.z, myship.loc.x, myship.loc.y, myship.loc.z)<=myship.sz + mymiss.sz) {
        mymiss.hits(myship);
        mymiss.exploding=true;
      }
    }
  }

  for (int i=eships.size ()-1; i>=0; i--) {
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
    if (frameCount-myship.firingtimer > 20) {
      elasers.add( new Elaser(myship));
      myship.firingtimer = frameCount;
    }
  }

  for ( int j=lasers.size ()-1; j>1; j--) {
    Laser mylase=lasers.get(j);
    mylase.make();

    if (frameCount-mylase.create>(mylase.framerater) || mylase.death) {
      lasers.remove(mylase);
    }
    ch.make();
  }

  for (int k=missiles.size ()-1; k>=0; k--) {
    Missile mymiss=missiles.get(k);
    mymiss.make();

    if (frameCount-mymiss.fc>80 || mymiss.exploding==true) {
      mymiss.exploding();

      if (frameCount-mymiss.fc>120) {
        missiles.remove(mymiss);
      }
    }
  }
  for ( int i= elasers.size () - 1; i>=0; i--) {
    Elaser elase = elasers.get(i);
    elase.make();
    if (dist(elase.loc.x, elase.loc.y, elase.loc.z, movex, movey, -movez) < 100) {
      elase.hits();
    }
  }
  ch.make();
}

void keyPressed() {
  if (keyPressed) {
    if ((key=='O' || key=='o') && frameCount-fc1>=10) {
      //Blaster.rewind();
      //Blaster.play();
      lasers.add(new Laser(1));
      lasers.add(new Laser(2));
      lasers.add(new Laser(3));
      lasers.add(new Laser(4));
      fc1=frameCount;
    }

    if ((key=='I' || key=='i') && frameCount-fc2>=50 && missilecount>=1) {
      missiles.add(new Missile());
      fc2=frameCount;
      if (missilecount>0) {
        missilecount--;
      }
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
  if ((keys['k'] || keys['K']) && zfire-tan(PI/6)<= 250) {
    if (3*height/((2*frameRate)*zfire)*frameRate>500) {
      zfire*=1.0157;
    } else {
      zfire*=1.09;
    }
  }
  if ((keys['P'] || keys['p']) && zfire-tan(PI/6) >=.004) {
    if (3*height/((2*frameRate)*zfire)*frameRate>500) {
      zfire/=1.0157;
    } else {
      zfire/=1.09;
    }
  }

  if (keys['l'] || keys['L']) {
    zfire=tan(PI/6) ;
  }


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
    rotatey+=PI/6;
  }

  if (keys[DOWN]) {
    rotatey-=PI/6;
  }

  if (keys[LEFT]) {
    rotatex-=PI/6;
  }

  if (keys[RIGHT]) {
    rotatex+=PI/6;
  }
}

