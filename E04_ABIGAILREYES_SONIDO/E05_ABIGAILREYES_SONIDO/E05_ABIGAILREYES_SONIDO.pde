//Abigail Reyes Alvarez - 202312353
//Entrega 5 Sonido 
//Cancion: "Time" - Pink Floyd
//Representa la intensidad del sonido mediante círculos y destellos colocados de forma aleatoria.
//La visualización responde a la intensidad del sonido, evocando la sensación de un reloj en 
//movimiento, como el nombre de la cancion.

import processing.sound.*;  

//variables para el audio y amplitud
SoundFile song;
Amplitude amp;  

void setup() {
  size(800, 800);
  background(0); 

//Time de Pink Floyd --carpeta: data
  song = new SoundFile(this, "time_pinkfloyd.mp3");

//canción en bucle
  song.loop();  

//analisis de amplitud del sonido
  amp = new Amplitude(this);
  amp.input(song);
}

void draw() {
  background(0, 30); 

//amplitud del sonido en tiempo real
  float level = amp.analyze();
  
// amplitud a un círculo más grande
  float radius = lerp(50, 400, level);  
  
  noFill();
  strokeWeight(2);

//cambio de color con el audio
  stroke(map(level, 0, 0.5, 180, 255), 100, 255);

//circulos-tiempo
  for (int i = 1; i <= 5; i++) {
    ellipse(width / 2, height / 2, radius * i, radius * i);
  }

//destellos
  float randomX = random(width);
  float randomY = random(height);
  float size = map(level, 0, 0.5, 5, 30);

  fill(255, 255, 0, 150);
  noStroke();
  ellipse(randomX, randomY, size, size);
}
