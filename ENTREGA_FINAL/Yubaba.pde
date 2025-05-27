class Yubaba {
  float x, y, vel;

  Yubaba() {
    reiniciar();
  }

  void actualizar() {
    y += vel;

    // Detección de colisión con chihiro 
    if ((y + 80 > posY) && (y < posY + 80) &&
        (x + 80 > posX) && (x < posX + 80)) {
      juegoActivo = false;
      perdiste = true;
    }

    if (y > height) {
      reiniciar();
    }
  }

  void dibujar() {
    image(imgYubaba, x, y, 90, 90); // img yubaba
  }

  void reiniciar() {
    x = random(width - 40);
    y = random(-300, -40);
    vel = random(2, 4);
  }
}
