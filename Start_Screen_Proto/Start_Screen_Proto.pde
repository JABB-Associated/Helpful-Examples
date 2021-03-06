//Initialize for start button
ArrayList<Start> START = new ArrayList<Start>();
//Initialize for mouse effect
ArrayList<MouseEffect> Shimmer = new ArrayList<MouseEffect>();

void setup () {
  //set to fullscreen
  size (displayWidth, displayHeight);
  START.add (new Start ());
}

void draw () {
  //create black background
  background (0); 
  //add start button
  

//create start button, title, and background stars
  for (int i = 0; i < START.size (); i++) { 
    Start alpha = START.get(i); 
    alpha.display();
    alpha.button();
    alpha.title();
  if (mousePressed == true) {
    alpha.death ();
    }

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

