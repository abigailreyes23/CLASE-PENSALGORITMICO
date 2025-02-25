//Abigail Reyes - 202312353
//ENTREGA RELOJ 

void setup() {
size(800, 800);         
background(0);           
}

void draw() {
background(0);
fill(255);
noStroke();

// Variables de configuración
int cantidadHoras = 12;
int cantidadMinSeg = 60;
int margenHoras = 100;
int margenMinSeg = 75;
int tamañoHora = 40;
int tamañoMinuto = 30;
int tamañoSegundo = 20;
int alturaHoras = height / 4;
int alturaMinutos = height / 2;
int alturaSegundos = 3 * height / 4;

// Variables de tiempo
int hora = hour();
int minuto = minute();
int segundo = second();

//Círculo de horas
for (int i = 0; i < cantidadHoras; i++) {
  float x = map(i, 0, cantidadHoras - 1, margenHoras, width - margenHoras); 
  float y = alturaHoras;
  if (i < hora % cantidadHoras) {
    fill(0, 0, 255);       
  } else {
    fill(50);              
  }
  ellipse(x, y, tamañoHora, tamañoHora);   
}

//Círculo de minutos
for (int i = 0; i < cantidadMinSeg; i++) {
  float x = map(i, 0, cantidadMinSeg - 1, margenMinSeg, width - margenMinSeg);    
  float y = alturaMinutos;
  if (i < minuto) {
    fill(0, 255, 0);       
  } else {
    fill(50);
  }
  ellipse(x, y, tamañoMinuto, tamañoMinuto);  
}

// Círculo de segundos
for (int i = 0; i < cantidadMinSeg; i++) {
  float x = map(i, 0, cantidadMinSeg - 1, margenMinSeg, width - margenMinSeg);    
  float y = alturaSegundos;
  if (i < segundo) {
    fill(255, 0, 0);       //Rojo puntos
  } else {
    fill(50);
  }
  ellipse(x, y, tamañoSegundo, tamañoSegundo);   
}
}
