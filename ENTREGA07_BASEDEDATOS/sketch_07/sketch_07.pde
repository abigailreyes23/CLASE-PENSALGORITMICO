Table table;
int nSamples;
String[] countries;
float[] latitudes;
float[] longitudes;

void setup() {
  size(1200, 800);
  table = loadTable("countries_coordinates.csv", "header");
  nSamples = table.getRowCount();
  
  countries = new String[nSamples];
  latitudes = new float[nSamples];
  longitudes = new float[nSamples];
  
  for (int i = 0; i < nSamples; i++) {
    countries[i] = table.getString(i, "entity");
    latitudes[i] = table.getFloat(i, "latitude");
    longitudes[i] = table.getFloat(i, "longitude");
  }
}

void draw() {
  background(255);
  fill(0);
  textSize(16);
  text("Country Coordinates", 20, 30);

  for (int i = 0; i < nSamples; i++) {
    float x1 = map(longitudes[i], -180, 180, 50, width - 50);
    float y1 = map(latitudes[i], -90, 90, height - 50, 50);
    
    // conexiones
    if (i == 0) {
      for (int j = 1; j < nSamples; j++) {
        float x2 = map(longitudes[j], -180, 180, 50, width - 50);
        float y2 = map(latitudes[j], -90, 90, height - 50, 50);
        stroke(200, 0, 0, 100);
        line(x1, y1, x2, y2);
      }
    }
    
    fill(100, 150, 200, 180);
    noStroke();
    ellipse(x1, y1, 8, 8);
  }
}
