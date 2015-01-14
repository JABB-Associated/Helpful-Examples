ArrayList<Start> START = new ArrayList<Start>();
ArrayList<MouseEffect> Shimmer = new ArrayList<MouseEffect>();

void setup () {
  size (displayWidth, displayHeight);
}

void draw () {
  background (0);
  START.add (new Start ());

  for (int i = 0; i < START.size (); i++) { 
    Start alpha = START.get(i); 
    alpha.display();
    alpha.button();
    alpha.title();



    if (START.size ()> 50) {
      START.remove(i);
    }
  }
  for (int i = 0; i < 15; i++) {
    Shimmer.add (new MouseEffect ());
  }
  for (int i = 0; i < Shimmer.size (); i++) {
    MouseEffect sparkles = Shimmer.get(i);
    sparkles.display();
    sparkles.move();

    if (sparkles.disappear()) {
      Shimmer.remove(i);
    }
  }
}

