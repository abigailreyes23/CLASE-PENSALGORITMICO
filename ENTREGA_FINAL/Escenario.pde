class Escenario {
  void dibujar() {
    
    background(135, 206, 250);
    
    for (int i = 0; i < nubes.length; i++) {
      nubes[i].mover();
      nubes[i].mostrar();
    }

    // imagen de fondo 
    image(imgFondoJuego, 0, 0);


  }


  void dibujarNube(float x, float y) {
    fill(255);
    noStroke();
    ellipse(x, y, 60, 60);
    ellipse(x+30, y+10, 60, 60);
    ellipse(x-30, y+10, 60, 60);
    ellipse(x, y+20, 70, 60);
  }
}
