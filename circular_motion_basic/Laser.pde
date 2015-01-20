class Laser {
  PVector loc, vel, ploc;
  float create;
  boolean death=false;
  boolean moved=false;
  float framerater;

  Laser(int lasernum) {
framerater=frameRate; //lag compensator
    if (lasernum==1) {
      loc = new PVector(width-movex, height-movey, height/(2* zfire)-movez);
      vel = new PVector(-1*width/(2*framerater), -1*height/(2*framerater), -3*height/((2*framerater)*zfire));  
      ploc= new PVector(loc.x+width/(2*framerater), loc.y+height/(2*framerater), loc.z+ 3*height/((2*framerater)*zfire));
    }
    if (lasernum==2) {
      loc = new PVector(0-movex, height-movey, height/(2* zfire)-movez);
      vel = new PVector(width/(2*framerater), -1*height/(2*framerater), -3*height/((2*framerater)*zfire));
      ploc= new PVector(loc.x- width/(2*framerater), loc.y+ height/(2*framerater), loc.z+ 3*height/((2*framerater)*zfire));
    }
    if (lasernum==3) {
      loc = new PVector(0-movex, 0-movey, height/(2* zfire)-movez);
      vel = new PVector(width/(2*framerater), height/(2*framerater), -3*height/((2*framerater)*zfire)); 
      ploc= new PVector(loc.x- width/(2*framerater), loc.y- height/(2*framerater), loc.z+ 3*height/((2*framerater)*zfire));
    }
    if (lasernum==4) {
      loc = new PVector(width-movex, 0-movey, height/(2* zfire)-movez);
      vel = new PVector(-1*width/(2*framerater), height/(2*framerater), -3*height/((2*framerater)*zfire));
      ploc= new PVector(loc.x+ width/(2*framerater), loc.y- height/(2*framerater), loc.z+ 3*height/((2*framerater)*zfire));
    }

    create=frameCount;
  }
  void make() {
    
    strokeWeight(4);
    loc.add(vel);
    ploc.add(vel);
    fill(255, 0, 0);
    stroke(255, 0, 0);
    line(ploc.x, ploc.y, ploc.z, loc.x, loc.y, loc.z); 
    strokeWeight(1);
    noStroke();
  }

  void hits(Eship tship) {
    tship.shield--;
    death=true;
  }
  void hits(Boss tboss){
  tboss.shield--;
death = true;}
}

