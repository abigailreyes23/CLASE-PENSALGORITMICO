void setup(){
  size(800, 800);
}
  
//fondo

void draw (){
  rectMode(CENTER);
  noStroke();
fill(89, 133, 44);
rect(50, 400, 100, 800);

fill(134, 195, 216);
rect(150, 400, 100, 800);

fill(89, 133, 44);
rect(250, 400, 100, 800);

fill(134, 195, 216);
rect(350, 400, 100, 800);

fill(89, 133, 44);
rect(450, 400, 100, 800);

fill(134, 195, 216);
rect(550, 400, 100, 800);

fill(89, 133, 44);
rect(649, 400, 100, 800);

fill(134, 195, 216);
rect(749, 400, 100, 800);


//centro del cuerpo
fill(115, 51, 24);
rect(397, 413, 533, 82);

//patas
fill(129, 85, 50);
triangle(130, 454, 210, 454, 184, 556);
triangle(495, 454, 576, 454, 549, 556);
rect(167, 543, 31, 26);
rect(532, 543, 31, 26);

fill(124, 57, 28);
triangle(197, 453, 298, 453, 264, 582);
triangle(562, 454, 664, 454, 630, 583);
rect(244, 565, 40, 32);
rect(609, 566, 40, 32);

//cola
fill(71, 53, 39);
rect(703, 378, 79, 12);
triangle(736, 375, 762, 364, 743, 385);

//cuello

fill(115, 51, 24);
rect(161, 341, 61, 82);

//cara
triangle(28, 290, 197, 229, 189, 305);
//nariz
fill(54, 31, 17);
triangle(29, 291, 51, 280, 64, 294);
//oreja
ellipse(191, 270, 35, 88);

}
