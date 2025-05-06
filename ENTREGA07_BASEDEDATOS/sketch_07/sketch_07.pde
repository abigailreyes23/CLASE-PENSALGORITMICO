Table table;
int nSamples;

String[] countries;
float[] latitudes;
float[] longitudes;

void setup() {
  size(1200, 800);
  background(255);
  smooth();

  // Cargar los datos
  table = loadTable("countries_coordinates.csv", "header");
  nSamples = table.getRowCount();

  // Inicializar los arrays
  countries = new String[nSamples];
  latitudes = new float[nSamples];
  longitudes = new float[nSamples];

  // Asignar los datos
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
    float x = map(longitudes[i], -180, 180, 50, width - 50);
    float y = map(latitudes[i], -90, 90, height - 50, 50);

    fill(100, 150, 200, 180);
    noStroke();
    ellipse(x, y, 8, 8);

    // Mostrar el nombre del país al pasar el mouse
    if (dist(mouseX, mouseY, x, y) < 5) {
      fill(0);
      textSize(12);
      text(countries[i], x + 10, y);
    }
  }
}
