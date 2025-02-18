int perritoX = 0;
int direccion = 2;
boolean cambiarColor = false;
int columnas = 8;
int rectAncho = 100;
int rectAlto = 800;
int colorVerde, colorAzul;
int tiempoCambio = 0; 

void setup() {
  size(800, 800);
  colorVerde = color(89, 133, 44);
  colorAzul = color(134, 195, 216);
}

void draw() {
  background(255);
  rectMode(CENTER);
  noStroke();

  tiempoCambio += 1;
  if (tiempoCambio >= 60) { 
    cambiarColor = !cambiarColor;
    tiempoCambio = 0;
  }

  for (int i = 0; i < columnas; i++) {
    int colorSeleccionado = colorAzul; 
    if ((i % 2 == 0) == cambiarColor) {
      colorSeleccionado = colorVerde;
    }
    
    fill(colorSeleccionado);
    rect(i * rectAncho + 50, 400, rectAncho, rectAlto);
  }

  perritoX += direccion;
  if (perritoX > width || perritoX < 0) {
    direccion = -direccion;
  }

  fill(115, 51, 24);
  rect(397 + perritoX, 413, 533, 82);

  fill(129, 85, 50);
  triangle(130 + perritoX, 454, 210 + perritoX, 454, 184 + perritoX, 556);
  triangle(495 + perritoX, 454, 576 + perritoX, 454, 549 + perritoX, 556);
  rect(167 + perritoX, 543, 31, 26);
  rect(532 + perritoX, 543, 31, 26);

  fill(124, 57, 28);
  triangle(197 + perritoX, 453, 298 + perritoX, 453, 264 + perritoX, 582);
  triangle(562 + perritoX, 454, 664 + perritoX, 454, 630 + perritoX, 583);
  rect(244 + perritoX, 565, 40, 32);
  rect(609 + perritoX, 566, 40, 32);

  fill(71, 53, 39);
  rect(703 + perritoX, 378, 79, 12);
  triangle(736 + perritoX, 375, 762 + perritoX, 364, 743 + perritoX, 385);

  fill(115, 51, 24);
  rect(161 + perritoX, 341, 61, 82);

  triangle(28 + perritoX, 290, 197 + perritoX, 229, 189 + perritoX, 305);
  
  fill(54, 31, 17);
  triangle(29 + perritoX, 291, 51 + perritoX, 280, 64 + perritoX, 294);

  ellipse(191 + perritoX, 270, 35, 88);
}
