int w = 10;
int maxstates = 6;
int rows, cols;
int state;

int updateorder = 0;

Cell grid[][];
Cell next[][];
boolean verify[][];

void setup()
{
  size(600, 600);
  frameRate(60);
  rows = floor(height/w);
  cols = floor(width/w);

  grid = new Cell[rows][cols];

  state = 0;

  for (int i = 0; i < rows; i++)
  {
    for (int j = 0; j < cols; j++)
    {
      grid[i][j] = new Cell(i, j);
    }
  }
}

void draw()
{
  background(0);

  for (int i = 0; i < rows; i++)
  {
    for (int j = 0; j < cols; j++)
    {
      grid[i][j].render();
      renderCue();
    }
  }

  verify = new boolean[rows][cols];
  next = new Cell[rows][cols];
  for (int i = rows - 1; i >= 0; --i)
  {
    for (int j = 0; j < cols; j++)
    {
      next[i][j] = grid[i][j];
    }
  }

  shuffleUpdate();

  grid = next;
}

void shuffleUpdate()
{
  if (updateorder == 4) updateorder = 0;
  else updateorder += 1;
  
  switch (updateorder)
  {
  case 0:
    for (int i = 0; i < rows; i++)
      for (int j = 0; j < cols; j++)
        grid[i][j].update();

    break;

  case 1:
    for (int i = 0; i < rows; i++)
      for (int j = cols - 1; j > 0; --j)
        grid[i][j].update();

    break;

  case 2:
    for (int i = rows - 1; i > 0; --i)
      for (int j = 0; j < cols; j++)
        grid[i][j].update();
    break;

  case 3:
    for (int i = rows - 1; i > 0; --i)
      for (int j = cols - 1; j > 0; --j)
        grid[i][j].update();
    break;
  }
}

void mouseDragged()
{
  if (mouseButton == LEFT)
  {
    int mouseRow = floor(mouseY / w);
    int mouseCol = floor(mouseX / w);

    if (mouseRow >= 0 && mouseRow < rows && mouseCol >= 0 && mouseCol < cols)
    {
      if (state == 0)
      {
        summon(mouseRow, mouseCol);
      } else if (!(grid[mouseRow][mouseCol] instanceof ElementCell))
      {
        summon(mouseRow, mouseCol);
      }
    }
  }
}

void mouseClicked()
{
  if (mouseButton == RIGHT)
  {
    if (state >= maxstates)
    {
      state = 0;
    } else
    {
      state += 1;
    }
  }
}

void summon(int i, int j)
{
  switch(state)
  {
  case 0:
    grid[i][j] = new Cell(i, j);
    break;

  case 1:
    grid[i][j] = new SandCell(i, j);
    break;

  case 2:
    grid[i][j] = new MetalCell(i, j);
    break;

  case 3:
    grid[i][j] = new WaterCell(i, j);
    break;

  case 4:
    grid[i][j] = new SmokeCell(i, j);
    break;
    
  case 5:
    grid[i][j] = new OilCell(i, j);
    break;
    
  case 6:
    grid[i][j] = new FoamCell(i, j);
    break;
  }
}

void renderCue()
{
  switch(state)
  {
  case 0:
    fill(0);
    break;

  case 1:
    fill(255, 255, 0);
    break;

  case 2:
    fill(150);
    break;

  case 3:
    fill(0, 0, 255);
    break;

  case 4:
    fill(200);
    break;
    
  case 5:
    fill(150, 150, 0);
    break;
    
  case 6:
    fill(255);
    break;
  }
  rect(mouseX, mouseY, w, w);
}
