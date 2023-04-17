class Grid {
  int[][] grid = new int[3][3];
  Grid() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        grid[i][j] = 0;
      }
    }
  }

  void show() {
    drawBoard();
    drawGrid();
  }

  void drawBoard() {
    stroke(255);
    strokeWeight(4);
    line(width/3, 0, width/3, height);
    line(2*width/3, 0, 2 * width/3, height);
    line(0, height/3, width, height/3);
    line(0, 2 * height/3, width, 2 * height/3);
  }

  void drawGrid() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        drawStuff(i, j, grid[i][j]);
      }
    }
  }

  void drawStuff(int i, int j, int value) {
    float w = width/3;
    if (value == 1) {
      line(i * w, j * w, (i+1) * w, (j+1) * w);
      line(i * w, (j+1) * w, (i+1) * w, j * w);
    } else if (value == 2) {
      noFill();
      ellipse(i*w + w/2, j*w + w/2, w, w);
    }
  }
}


int checkWin(int[][] grid) {
  int check;
  int checkTie = 1;
  check = grid[0][0] * grid[1][1] * grid[2][2];
  if (check == 1 || check == 8) {
    return (check-1)/7 + 1;
  }
  checkTie *= check;

  check = grid[2][0] * grid[1][1] * grid[0][2];
  if (check == 1 || check == 8) {
    return (check-1)/7 + 1;
  }
  checkTie *= check;

  check = grid[0][0] * grid[0][1] * grid[0][2];
  if (check == 1 || check == 8) {
    return (check-1)/7 + 1;
  }
  checkTie *= check;

  check = grid[1][0] * grid[1][1] * grid[1][2];
  if (check == 1 || check == 8) {
    return (check-1)/7 + 1;
  }
  checkTie *= check;

  check = grid[2][0] * grid[2][1] * grid[2][2];
  if (check == 1 || check == 8) {
    return (check-1)/7 + 1;
  }
  checkTie *= check;

  check = grid[0][0] * grid[1][0] * grid[2][0];
  if (check == 1 || check == 8) {
    return (check-1)/7 + 1;
  }
  checkTie *= check;

  check = grid[0][1] * grid[1][1] * grid[2][1];
  if (check == 1 || check == 8) {
    return (check-1)/7 + 1;
  }
  checkTie *= check;

  check = grid[0][2] * grid[1][2] * grid[2][2];
  if (check == 1 || check == 8) {
    return (check-1)/7 + 1;
  }
  checkTie *= check;

  return checkTie;
}
