 //importar música
import processing.sound.*;
SoundFile audio;


// Variables del juego
int posX = 0;
int posY = 0;
int puntos = 0;
int totalYubabas = 20;
int tiempoLimite = 60; // segundos
boolean derechaPresionada = false;
boolean izquierdaPresionada = false;
boolean juegoActivo = false;
boolean perdiste = false;
long tiempoInicio;

// Sistema de pantallas
int estadoPantalla = 0; // 0:inicio, 1:intro, 2:advertencia, 3:pre-juego, 4:juego
PImage imgInicio, imgIntro, imgClickContinuar, imgAdvertencia, imgClickEmpezar, imgFondoJuego, imgNube, imgYubaba, imgPolvo, imgChihiro, imgGanaste, imgPerdiste;

Nube[] nubes = new Nube[4];
Polvo[] polvos;
Yubaba[] yubabas;
Chihiro chihiro;
Escenario escenario;

void setup() {
  size(630, 980);
  posY = height - 72;
  cargarImagenes();
  inicializarObjetosJuego();
  
  //para hacer que se reproduzca el audio
  audio = new SoundFile(this, "audio.mp3");
  audio.play();
  audio.loop();//para que la musiquita empiece otra vez
  
}

void draw() {
  switch(estadoPantalla) {
    case 0: mostrarPantallaInicio(); break;
    case 1: mostrarPantallaIntro(); break;
    case 2: mostrarPantallaAdvertencia(); break;
    case 3: mostrarPantallaPreJuego(); break;
    case 4: ejecutarJuegoPrincipal(); break;
  }
}

void mousePressed() {
  if (estadoPantalla == 0 || estadoPantalla == 1 || estadoPantalla == 2) {
    estadoPantalla++;
  } else if (estadoPantalla == 3) {
    comenzarJuego();
  } else if (estadoPantalla == 4 && !juegoActivo) {
    comenzarJuego(); 
  }
}

// ------ Sistema de pantallas ------
void cargarImagenes() {
  imgInicio = loadImage("inicio.png");
  imgIntro = loadImage("intro.png");
  imgClickContinuar = loadImage("Click-para-empezar.png");
  imgAdvertencia = loadImage("advertencias CORREGIDA.png");
  imgClickEmpezar = loadImage("despues de advertencia.png");
  imgFondoJuego = loadImage("fondo granja sin cielo.png");
  imgNube = loadImage("nube.png");  
  imgYubaba = loadImage("Yubaba.png");
  imgPolvo = loadImage("polvo.png");
  imgChihiro = loadImage("chihiro.png");
  imgGanaste = loadImage("ganaste  con la granja.png");
  imgPerdiste = loadImage("perdiste  con click para volver a empezar.png");
  
  imgNube.resize(100, 60);
  imgInicio.resize(width, height);
  imgIntro.resize(width, height);
  imgAdvertencia.resize(width, height);
  imgClickEmpezar.resize(width, height);
  imgFondoJuego.resize(width, height);
}

void mostrarPantallaInicio() {
  image(imgInicio, 0, 0);
}

void mostrarPantallaIntro() {
  image(imgIntro, 0, 0);
  image(imgClickContinuar, width/2-100, height-100, 200, 50);
}

void mostrarPantallaAdvertencia() {
  image(imgAdvertencia, 0, 0);
  image(imgClickContinuar, width/2-100, height-100, 200, 50);
}

void mostrarPantallaPreJuego() {
  image(imgClickEmpezar, 0, 0);
}

// ------ Juego principal ------
void comenzarJuego() {
  estadoPantalla = 4;
  juegoActivo = true;
  tiempoInicio = millis();
  reiniciarJuego();
}

void ejecutarJuegoPrincipal() {
  escenario.dibujar();
  
  if (juegoActivo) {
    actualizarJuego();
    dibujarElementos();
    verificarEstadoJuego();
  } else {
    mostrarResultado();
  }
}

void reiniciarJuego() {
  puntos = 0;
  perdiste = false;
  posX = width/2;
  
  for (int i = 0; i < polvos.length; i++) {
    polvos[i] = new Polvo();
  }
  
  for (int i = 0; i < yubabas.length; i++) {
    yubabas[i] = new Yubaba();
  }
}

void inicializarObjetosJuego() {
  for (int i = 0; i < nubes.length; i++) {
  float x = random(width);
  float y = random(50, 200);  
  nubes[i] = new Nube(x, y, imgNube);
}
  polvos = new Polvo[5];
  yubabas = new Yubaba[3];
  chihiro = new Chihiro();
  escenario = new Escenario();
  
  reiniciarJuego();
}


void actualizarJuego() {
  if (derechaPresionada) posX += 6;
  if (izquierdaPresionada) posX -= 6;
  posX = constrain(posX, 0, width - 40);
  
  for (Polvo z : polvos) {
    z.actualizar();
  }
  
  for (Yubaba t : yubabas) {
    t.actualizar();
  }
}

void dibujarElementos() {
  for (Polvo z : polvos) {
    z.dibujar();
  }
  
  for (Yubaba t : yubabas) {
    t.dibujar();
  }
  
 chihiro.dibujar(posX, posY);
  
  // HUD
  fill(0);
  textSize(16);
  text("Puntos: " + puntos, 30, 20);
  text("Tiempo: " + int(tiempoLimite - (millis() - tiempoInicio)/1000.0), width - 110, 20);
}

void verificarEstadoJuego() {
  float tiempoTrans = (millis() - tiempoInicio) / 1000.0;
  if (puntos >= totalYubabas) juegoActivo = false;
  if (tiempoTrans >= tiempoLimite) {
    juegoActivo = false;
    perdiste = puntos < totalYubabas;
  }
}


void mostrarResultado() {
  if (perdiste) {
    image(imgPerdiste, 0, 0, width, height);
  } else {
    image(imgGanaste, 0, 0, width, height);
  }
}


void keyPressed() {
  if (juegoActivo) {
    if (keyCode == RIGHT) derechaPresionada = true;
    if (keyCode == LEFT) izquierdaPresionada = true;
  }
}

void keyReleased() {
  if (keyCode == RIGHT) derechaPresionada = false;
  if (keyCode == LEFT) izquierdaPresionada = false;
}
