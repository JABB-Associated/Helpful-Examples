//initialize Crosshairs class
class Crosshairs {

  Crosshairs() {
  } 
  void make() {
    //initialize and assign value to control the size of the cursor based on distance firing
    float sz = 100/(1-((-3*height/((2*frameRate)*sq(zfire))*frameRate)/2078));
    //color the crosshair red
    stroke(255, 0, 0);
    fill(255, 0, 0);

    //make crosshair display independently of ship's motion
    translate(-movex, -movey, -movez);

    //rotateX(-rotatey);
    //rotateY(-rotatex);

    //create the crosshair in the middle of the map
    ellipse(width/2, height/2, sz/3, sz/3);
    noFill();
    ellipse(width/2, height/2, sz, sz);
    //make crosshair display independently of ship's motion
    translate(movex, movey, movez);

    //rotateX(rotatey);
    //rotateY(rotatex);

    noStroke();
  }
}
