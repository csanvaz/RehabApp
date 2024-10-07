


// Creating instance of image
PImage logo;

void menuSetup() {
 logo = loadImage("logo.png");  // image of logo
}


void menuDraw() {
  background(110,141,174);
  
  
  image(logo, 50,-220);
  
  fill(0);
  textSize(72);
  textAlign(CENTER);
  text("Welcome!", 550,650);
  textSize(36);
  text("Select a mode below to begin re-training your muscles.", 550,730);
  
}
