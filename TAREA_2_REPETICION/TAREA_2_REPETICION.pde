void setup() {
  size(800, 800);
  background(255);
}

void draw() {
  for (int x = 0; x < width; x=x+20) {
    for (int y = 0; y < height; y=y+20) {
      Dibujo(x, y);
    }
  }
}

void Dibujo(int x, int y) {
  rectMode(CENTER);
 

  // fondo
  for (int i = 0; i < 8; i=200) {
    rect(x + 50 + i * 25, y + 100, 25, 200);
  }
  
  // Cara perro
  triangle(x + 5, y + 60, x + 50, y + 40, x + 48, y + 70);
  
  // Nariz 
  triangle(x + 5, y + 60, x + 12, y + 56, x + 16, y + 62);
}
