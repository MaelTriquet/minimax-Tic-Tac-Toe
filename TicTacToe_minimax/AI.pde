class AI {
  AI() {
  }

  int[] minimax(int[][] gameState, int depth, int player) {
    if (checkWin(gameState) == ai_player) {
      int[] result = {-1, -1, 10 - depth};
      return result;
    } else if (checkWin(gameState) == 3 - ai_player) {
      int[] result = {-1, -1, -10 + depth};
      return result;
    } else if (checkWin(gameState) != 0) {
      int[] result = {-1, -1, 0};
      return result;
    }

    int[] best = new int[3];
    best[2] = (player == ai_player) ? -1000 : 1000;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (gameState[i][j] == 0) {
          gameState[i][j] = player;

          int[] result = minimax(gameState, depth+1, 3-player);

          gameState[i][j] = 0;

          if (player == ai_player && result[2] > best[2]) {
            best[0] = i;
            best[1] = j;
            best[2] = result[2];
          }
          if (player == 3-ai_player && result[2] < best[2]) {
            best[0] = i;
            best[1] = j;
            best[2] = result[2];
          }
        }
      }
    }
    return best;
  }

  boolean isFull(int[][] grid) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i][j] == 0) {
          return false;
        }
      }
    }
    return true;
  }

  void move() {
    int[] minimax = minimax(grid.grid, 0, ai_player);
    if (minimax[0] != -1) {
      grid.grid[minimax[0]][minimax[1]] = ai_player;
    }
    player = 3 - player;
  }
}
