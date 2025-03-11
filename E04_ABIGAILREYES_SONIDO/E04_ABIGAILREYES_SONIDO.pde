// Abigail Reyes Alvarez
// Visualización dinámica de "Time" - Pink Floyd
// El diseño responde a la intensidad del sonido con círculos en expansión

import ddf.minim.*;  // Librería para manejar audio
Minim minim;
AudioPlayer song;
AudioInput in;
AudioBuffer abuff;

void setup() {
  size(800, 800);  
  minim = new Minim(this);
  
  // Cargar la canción
  song = minim.loadFile("time_pinkfloyd.mp3"); 
  song.play();
  
  abuff = song.mix;  // Captura el audio mezclado (izquierda + derecha)
  background(0);
}

void draw() {
  background(0, 20);  // Fondo negro con leve transparencia para efecto de rastro
  
  float sum = 0;  // Variable para almacenar el nivel de audio
  
  // Analiza el sonido en cada cuadro
  for (int i = 0; i < abuff.size(); i++) {
    sum += abs(abuff.get(i));  // Acumula valores absolutos del audio
  }
  
  float level = sum / abuff.size(); // Promedio del sonido
  
  // Dibujar círculos concéntricos que reaccionan a la música
  float radius = map(level, 0, 0.5, 50, 400);  // Mapea el nivel de audio a tamaños de círculo
  
  noFill();
  strokeWeight(2);
  
  // Cambio de color dinámico basado en frecuencia
  stroke(map(level, 0, 0.5, 100, 255), 50, 255);
  
  // Dibuja múltiples círculos concéntricos
  for (int i = 1; i <= 5; i++) {
    ellipse(width / 2, height / 2, radius * i, radius * i);
  }
  
  // Círculos aleatorios que simulan el "tic-tac" del reloj
  float randomX = random(width);
  float randomY = random(height);
  float size = map(level, 0, 0.5, 5, 30);
  
  fill(255, 255, 0, 100);
  noStroke();
  ellipse(randomX, randomY, size, size);
}

// Cierra el reproductor cuando se detiene el sketch
void stop() {
  song.close();
  minim.stop();
  super.stop();
}
