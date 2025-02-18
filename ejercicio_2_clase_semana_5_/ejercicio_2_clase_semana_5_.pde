int size = 50;
int posY = 80;
int posX = 20;

void setup() {
  size(500, 500);
}

void draw() {
  background (150, 150, 200);
  noStroke();
  
  //bordes verticales
  if((mouseX > size && mouseX < 100)&&
  
  //bordes horizontales
  (mouseY > size && mouseY < 100)) {
  
      fill(45, 60, 80);
  } else {
    fill(255);
  }
  
  rect(50, 50, size, size);
}
