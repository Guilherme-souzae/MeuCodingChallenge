class Cell
{
  int i, j;
  color cor;
  float density;

  Cell(int i, int j)
  {
    this.i = i;
    this.j = j;
  }

  void render()
  {
    float x = j*w;
    float y = i*w;

    noStroke();
    fill(cor);
    rect(x, y, w, w);
  }

  void update()
  {
    if (!verify[i][j]) act();
  }
  
  void act()
  {
  }

  protected boolean isempty(String direction)
  {
    switch (direction)
    {
    case "top":
      if (i > 0)
      {
        if (!(grid[i-1][j] instanceof ElementCell) && !verify[i-1][j]) return true;
        else return false;
      } else return false;
      
    case "tright":
      if (i > 0 && j < cols - 1)
      {
        if (!(grid[i-1][j+1] instanceof ElementCell) && !verify[i-1][j+1]) return true;
        else return false;
      } else return false;
      
    case "right":
      if (j < cols - 1)
      {
        if (!(grid[i][j+1] instanceof ElementCell) && !verify[i][j+1]) return true;
        else return false;
      } else return false;

    case "bright":
      if (i < rows - 1 && j < cols - 1)
      {
        if (!(grid[i+1][j+1] instanceof ElementCell) && !verify[i+1][j+1]) return true;
        else return false;
      } else return false;

    case "bottom":
      if (i < rows - 1)
      {
        if (!(grid[i+1][j] instanceof ElementCell) && !verify[i+1][j]) return true;
        else return false;
      } else return false;

    case "bleft":
      if (i < rows - 1 && j > 0)
      {
        if (!(grid[i+1][j-1] instanceof ElementCell) && !verify[i+1][j-1]) return true;
        else return false;
      } else return false;

    case "left":
      if (j > 0)
      {
        if (!(grid[i][j-1] instanceof ElementCell) && !verify[i][j-1]) return true;
        else return false;
      } else return false;
      
    case "tleft":
      if (i > 0 && j > 0)
      {
        if (!(grid[i-1][j-1] instanceof ElementCell) && !verify[i-1][j-1]) return true;
        else return false;
      } else return false;

    default:
      return false;
    }
  }

  protected void swap(String direction)
  {
    verify[i][j] = true;
    switch (direction)
    {
    case "top":
      if (i > 0)
      {
        verify[i-1][j] = true;
        next[i][j] = grid[i-1][j].factory(i,j);
        next[i-1][j] = this.factory(i-1,j);
      }
      break;
      
    case "tright":
      if (i > 0 && j < cols - 1)
      {
        verify[i-1][j+1] = true;
        next[i][j] = grid[i-1][j+1].factory(i,j);
        next[i-1][j+1] = this.factory(i-1,j+1);
      }
      break;
     
    case "right":
      if (j < cols - 1)
      {
        verify[i][j+1] = true;
        next[i][j] = grid[i][j+1].factory(i,j);
        next[i][j+1] = this.factory(i, j+1);
      }
      break;

    case "bright":
      if (i < rows - 1 && j < cols - 1)
      {
        verify[i+1][j+1] = true;
        next[i][j] = grid[i+1][j+1].factory(i,j);
        next[i+1][j+1] = this.factory(i+1, j+1);
      }
      break;

    case "bottom":
      if (i < rows - 1)
      {
        verify[i+1][j] = true;
        next[i][j] = grid[i+1][j].factory(i,j);
        next[i+1][j] = this.factory(i+1, j);
      }
      break;

    case "bleft":
      if (i < rows - 1 && j > 0)
      {
        verify[i+1][j-1] = true;
        next[i][j] = grid[i+1][j-1].factory(i,j);
        next[i+1][j-1] = this.factory(i+1, j-1);
      }
      break;

    case "left":
      if (j > 0)
      {
        verify[i][j-1] = true;
        next[i][j] = grid[i][j-1].factory(i,j);
        next[i][j-1] = this.factory(i, j-1);
      }
      break;
      
    case "tleft":
      if (i > 0 && j > 0)
      {
        verify[i-1][j-1] = true;
        next[i][j] = grid[i-1][j-1].factory(i,j);
        next[i-1][j-1] = this.factory(i-1,j-1);
      }
      break;
    }
  }

  protected Cell factory(int i, int j)
  {
    return new Cell(i, j);
  }
}
