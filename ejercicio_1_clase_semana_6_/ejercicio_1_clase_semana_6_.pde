int x = 0;
int y = 50;

float level;
float rad;

void setup() {
 size(800, 800);
 background (255);
 noStroke();
}

void draw() {
  level = random(0, 1);
  // el tamaño de los circulos
  rad = (level * width/3);
  
 if (y < height) {
   fill(150, 50, 40, 10);
   stroke(100, 50, 50);
   ellipse(x, y, 40, 40);
   delay(100);
   x += 50;

   if (x > width) {
   x = 0;
   y += 50;
   }
 }
}
