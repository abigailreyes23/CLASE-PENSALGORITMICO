class Nube {
  float x, y;
  float velocidad;
  PImage img;

  Nube(float x, float y, PImage img) {
    this.x = x;
    this.y = y;
    this.img = img;
    this.velocidad = random(0.5, 1.5) * (random(1) < 0.5 ? 1 : -1); 
  }

  void mover() {
    x += velocidad;

    // Rebote en bordes
    if (x < 0 || x + img.width > width) {
      velocidad *= -1;
    }
  }

  void mostrar() {
    image(img, x, y);
  }
}
