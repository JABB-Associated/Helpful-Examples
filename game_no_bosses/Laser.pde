//initialize Laser class
class Laser {
  //initialize variables to control the position and movement of the lasers
  PVector loc, vel, ploc;
  float create;
  
  //initialize variables to control the disappearance of the lasers and the destruction of enemies
  boolean death=false;
  boolean moved=false;
  
  //initialize variable to compensate for lag
  float framerater;

  Laser(int lasernum) {
    //assign value to variable to compensate for lag
    framerater=frameRate;
    
    //create and move lasers based on which corner of your ship they are fired from
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
    
    //assign value to help with removal of lasers
    create=frameCount;
  }

  void make() {
    //adjust the appearance of the lasers' thickness
    strokeWeight(4);
    
    //control the movement of the lasers
    loc.add(vel);
    ploc.add(vel);
   
    //make the lasers red
    fill(255, 0, 0);
    stroke(255, 0, 0);
   
    //draw the lasers
    line(ploc.x, ploc.y, ploc.z, loc.x, loc.y, loc.z); 
    
    strokeWeight(1);
    noStroke();
  }

  void hits(Eship tship) {
    //if the laser hits an enemy ship, subtract from the enemy shields and remove the laser
    tship.shield--;
    death=true;
  }
}

