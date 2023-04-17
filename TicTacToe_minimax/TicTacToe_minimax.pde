Grid grid = new Grid();
int player = 1;
int ai_player = (int) random(2)+1;
AI ai = new AI();
void setup() {
  size(800, 800);
  rectMode(CORNER);
}

void draw() {
  background(0);
  if (checkWin(grid.grid) != 0) {
    if (checkWin(grid.grid) < 3) {
      background(0, 255, 0);
    } else {
      background(255, 120, 0);
    }
  }
  grid.show();
  if (player == ai_player) {
    ai.move();
  }
}

void mouseClicked() {
  int i = (int) ((float)mouseX/(float)width * 3);
  int j = (int) ((float)mouseY/(float)height * 3);

  if (grid.grid[i][j] == 0) {
    grid.grid[i][j] = player;
    player = 3-player;
  }
}
