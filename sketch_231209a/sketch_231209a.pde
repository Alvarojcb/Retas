int numCells = 10;
int sizeOfCell;
int initialX = -1, initialY = -1;
int finalX = -1, finalY = -1;
boolean drawingActive = false;

void setup() {
  size(400, 400);
  sizeOfCell = width / numCells;
  background(255);
  inicializarGrade();
}

void draw() {
  if (drawingActive) {
    background(255);
    inicializarGrade();
    renderizarLinha(initialX, initialY, mouseX/sizeOfCell, mouseY/sizeOfCell);
  }
}

void inicializarGrade() {
  for (int i = 0; i < numCells; i++) {
    for (int j = 0; j < numCells; j++) {
      stroke(0);
      fill(255);
      desenharCelula(i, j);
    }
  }
}

void renderizarLinha(int x1, int y1, int x2, int y2) {
  float deltaX = x2 - x1;
  float deltaY = y2 - y1;
  float stepCount = max(abs(deltaX), abs(deltaY));
  float xStep = deltaX / stepCount;
  float yStep = deltaY / stepCount;

  float x = x1;
  float y = y1;
  for (int i = 0; i <= stepCount; i++) {
    marcarPixel(round(x), round(y));
    x += xStep;
    y += yStep;
  }
}

void desenharCelula(int x, int y) {
  rect(x * sizeOfCell, y * sizeOfCell, sizeOfCell, sizeOfCell);
}

void marcarPixel(int x, int y) {
  fill(0);
  desenharCelula(x, y);
}

void mousePressed() {
  if (!drawingActive) {
    initialX = mouseX / sizeOfCell;
    initialY = mouseY / sizeOfCell;
    drawingActive = true;
  } else {
    finalX = mouseX / sizeOfCell;
    finalY = mouseY / sizeOfCell;
    drawingActive = false;
  }
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    resetarDesenho();
  }
}

void resetarDesenho() {
  initialX = initialY = finalX = finalY = -1;
  drawingActive = false;
  background(255);
  inicializarGrade();
}
