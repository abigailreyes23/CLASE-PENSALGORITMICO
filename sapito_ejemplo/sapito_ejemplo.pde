
void setup(){
  size(500,500);
}

void draw(){
  background(50, 250, 100);
  translate(250,270);
  fill(#14D839);
  ellipse(0,50,150,40);
  
  //centro del cuerpo
  ellipse(0, 0, 100, 100);
  
  //manos
  ellipse(-50,25,30,50);
  ellipse(50,25, 30, 50);
  
  //ojos
  fill(255);
  ellipse(-30, -40, 50, 50);
  ellipse(30, -40, 50, 50);
  
  //pupilas
  fill(0);
  ellipse(-30, -40, 30, 30);
  ellipse(30, -40, 30, 30);
  
  //boca
  rectMode(CENTER);
  fill(255, 0, 0);
  rect(0, 10, 60, 10);
  
  //contenedor
  fill(#72CAF5, 100);
  ellipse(0, -10, 195, 195);
  
  //gotas en la frente
  noStroke();
  triangle(50, -80, 65, -65, 45 , -75);
  triangle(50, -70, 65, -55, 45 , -65);
}
  
  
