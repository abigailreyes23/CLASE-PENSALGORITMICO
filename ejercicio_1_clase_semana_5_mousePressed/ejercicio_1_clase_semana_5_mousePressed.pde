void setup() {
  size(500, 500);
}

void draw() {
  if(mousePressed){
    fill(150);
  } else {
    //blanco
    fill(255);
  }
  
  background(0);
  rect(mouseX, mouseY, 50, 50);
}
