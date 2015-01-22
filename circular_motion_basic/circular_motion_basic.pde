import ddf.minim.*;
AudioPlayer DuelofFates;
//AudioPlayer Blaster;
Minim minim;

float fc7=0;
boolean fren = false;


int health = 1000;
PShape deathstar; 
PShape Boss1;
PShape Destroyer;
PShape Tiebomber;
PShape Tiefighter;
//PImage cockpit;

//Initialize for start button
ArrayList<Start> START = new ArrayList<Start>();
//Initialize for mouse effect
ArrayList<MouseEffect> Shimmer = new ArrayList<MouseEffect>();
ArrayList<Elaser> elasers = new ArrayList<Elaser>();
ArrayList <Boss> bosses= new ArrayList<Boss>();
ArrayList <Bweapon> bweapons = new ArrayList<Bweapon>();
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
// boolean reset = false; //tells to reset matrix in instruction screen
float instructionscreen = 0; //times between instruction screen and scrolling text
int x;
int y [] = new int [7];
int z [] = new int [7];
StringList starwarstext;

void setup() { 
  noCursor();
  noStroke();
  minim = new Minim(this);
  DuelofFates = minim.loadFile("Duel of Fates.mp3", 512);
  //Blaster = minim.loadFile("X Wing Sound.mp3", 5048);
  Tiefighter = loadShape("Tiefighter.obj");
  Tiebomber = loadShape("Tie Super.obj");
  Destroyer = loadShape("Imperial Class Destroyer.obj");
  Boss1 = loadShape("tiefighterboss.obj");
  deathstar = loadShape("deathstar.obj");
  //cockpit = loadImage("maxresdefault.png");
  size(displayWidth, displayHeight, P3D);
  START.add(new Start());
  x = width/2;
  for (int i=0; i<y.length; i++) {
    y[i] = 3*height/2 + 140*i;
    z[i] = -10*i;
  }
}

void draw() {

  frameRate(60);
  background(0);
  textAlign(LEFT, LEFT);
  // for testing

  if (mousePressed ) {
    if (level<3) {
      level++;
    } else {
      level=1;
    }
  }
  //more testing
  if (wavetime && key=='t') {
    bosstime=true;
    wavetime=false;
  }
  if (level == -1) { //start screen
    //add start button


    //create start button, title, and background stars
    for (int i = 0; i < START.size (); i++) { 
      Start alpha = START.get(i); 
      alpha.display();
      alpha.button();
      alpha.title();


      //remove stars (this causes the blinking)
      if (START.size ()> 50) {
        START.remove(i);
      }
    }  
    //create the mouse effect
    for (int i = 0; i < 15; i++) {
      Shimmer.add (new MouseEffect ());
    }
    for (int i = 0; i < Shimmer.size (); i++) {
      MouseEffect sparkles = Shimmer.get(i);
      sparkles.display();
      sparkles.move();
      //remove older mouse effects
      if (sparkles.disappear()) {
        Shimmer.remove(i);
      }
    }
  }

  while (START.size () > 0 && level > -1) {
    START.remove(0);
  }
  while (Shimmer.size () > 0 && level >-1) {
    Shimmer.remove(0);
  }
  if (level == 0 ) {
    if (frameCount-instructionscreen < 1200) {

      textSize(60);
      textAlign (CENTER, CENTER);




      starwarstext= new StringList();

      starwarstext.append("The empire had seized control of the galaxy. As");
      starwarstext.append("systems fell, one after the other, the only hope was");
      starwarstext.append("for a hero. You are this hero, not a human, but a Wookiee.");
      starwarstext.append("You must fight back against Darth Bruno and the Empire of"); 
      starwarstext.append("Bruyesia. As you fly your ship through the galaxy, you must defeat ");
      starwarstext.append("your enemies as you close ever nearer to your ultimate objective.");
      starwarstext.append("Good luck, young Wookiee, and May the Force be with you!");
      background(0);

      if (!fren) {
        fc7 = frameCount; 
        fren = true;
      }
      fill (0, 255, 255);
      if (frameCount-fc7 < 2*frameRate) {
        text ("A long time ago in a galaxy far, far away....", x, height/6, -50);
      }

      rotateX (PI/3);
      //pushMatrix();

      fill (255, 255, 0);
      for (int i = starwarstext.size ()-1; i >=0; i--) {
        String mytext=starwarstext.get(i);
        text(mytext, width/2, y[i], z[i]);
        if (y[0]>-2500) {
          y[i] -= 3;
          z[i] -= 1.5;
        } else {
          y[i]-=30;
          z[i]-=15;
        }
      }

      //popMatrix();
    } else {
      //
      //      if (!reset) {
      //        resetMatrix();
      //        reset= true;
      //      }
      textSize (24); 
      fill (255, 255, 0);
      textAlign (CENTER, CENTER);
      text ("Destroy all enemies in a wave to advance to the boss. \nDefeat the boss to advance to the next level.\n Enemies will fire at you, lowering your blue health bar at the top left. \nThe top right represents the number of missiles available.\n \nMove in 3-D with 'WASD' and 'ZX' \nPress 'O' to fire lasers \nPress 'I' to fire missiles \nPress 'K' to scope in \nPress 'P' to scope out \nPress 'L' to go back to default scope. \n \nClick anywhere to continue.", width/2, height/2);
      if (mousePressed && frameCount-instructionscreen>1200) {
        level=1;
      }
    }
  }


  if (level >0) {
    if (level == 2) {
      DuelofFates.play();
    }
    if (health > 150) {
      fill(0, 0, 255);
    } else {
      fill(255, 0, 0);
    }
    rect(50, 120, 20, -health/10); //health bar
    fill(0, 255, 0);
    rect(width-120, 120, 20, -20*(score%5)); //shows how close to getting missiles you are
    if (bosstime && !bossadded) {
      bosses.add( new Boss());
      bossadded= true;
    }
    noStroke();
    textSize(30);
    text(score, 150, 100); //display score
    text("M" + " " + missilecount, width-300, 100); // display number of missiles
    textSize(15);
    text(health, 40, 15);
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
    } else {
      wavetime = true;
    }

    for (int i= bosses.size ()-1; i>=0; i--) {
      Boss thisboss = bosses.get(i);

      if (thisboss.dead) {
        bosses.remove(thisboss);
      }
      thisboss.make();
      if (frameCount-thisboss.firingtimer > 10/level) {
        bweapons.add( new Bweapon(thisboss));
        thisboss.firingtimer = frameCount;
      }
      for (int m=lasers.size ()-1; m>=0; m--) {
        Laser mylase=lasers.get(m);

        if (dist(thisboss.loc.x, thisboss.loc.y, thisboss.loc.z, mylase.loc.x, mylase.loc.y, mylase.loc.z)<=thisboss.sz) {
          mylase.hits(thisboss);
        }
      }
      for (int j = bweapons.size ()-1; j>=0; j--) {
        Bweapon bweap = bweapons.get(j);
        bweap.make();


        if (dist(bweap.loc.x, bweap.loc.y, bweap.loc.z, width/2-movex, height/2-movey, height/(2*tan(PI/6))-movez) < 50) {
          bweap.hits();
        }
        if (frameCount-bweap.created>5*frameRate) {
          bweapons.remove(bweap);
        }
      }
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
      if (frameCount-myship.firingtimer > 60) {
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
      //      stroke(255,0,0);
      //      strokeWeight(1);
      //      ch.make();
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
      if (dist(elase.loc.x, elase.loc.y, elase.loc.z, width/2-movex, height/2-movey, height/(2*tan(PI/6))-movez) < 50) {
        elase.hits();
      }
      if (frameCount-elase.created>5*frameRate) {
        elasers.remove(elase);
      }
    }
    fill(255, 0, 0);
    stroke(255, 0, 0);
    strokeWeight(1);
    ch.make();
  }
}


void keyPressed() {
  if (level>0) {
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
}

void keyReleased() {
  if (level>0) {
    if (key!=CODED) {
      keys[key]=false;
    }

    if (key == CODED) {
      keys[keyCode]=false;
    }
  }
}

void update() {
  if (level > 0) {
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
}

