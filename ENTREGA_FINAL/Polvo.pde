class Polvo {
  float x, y, vel;
  boolean contada;

  Polvo() {
    reiniciar();
    contada = false;
  }

void actualizar() {
  // Calcula cuánto tiempo ha pasado en segundos
  float tiempoTranscurrido = (millis() - tiempoInicio) / 1000.0;

  // Aumenta la velocidad miesntras pasa el tiempo
  float incremento = tiempoTranscurrido * 0.1; //el 0.1 es para que vaya subiendo la velocidad, se puede cambiar entre mas grande el numerito mas velociad incrementa
  y += vel + incremento;

  if ((y + 80 > posY) && (y < posY + 80) &&
      (x + 80 > posX) && (x < posX + 80) &&
      !contada) {
    puntos++;
    contada = true;
    y = height + 1;
  }

  if (y > height) {
    reiniciar();
    contada = false;
  }
}


  void dibujar() {
    image(imgPolvo, x, y, 90, 90); // Usa la imagen con tamaño adecuado
  }

  void reiniciar() {
    x = random(width - 40);
    y = random(-200, -40);
    vel = random(1, 3);
  }
}
