ArrayList<Start> START = new ArrayList<Start>();

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
}

