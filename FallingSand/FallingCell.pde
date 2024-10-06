abstract class FallingCell extends SolidCell
{
  FallingCell(int i, int j)
  {
    super(i, j);
  }

  @Override
  void act()
  {
   fall(); 
  }
  
  void fall()
  {
    if (isempty("bottom")) // cai para baixo
    {
      swap("bottom");
    } 
    
    else if (isempty("bright") && isempty("bleft") && isempty("right") && isempty("left")) // cai para um dos dois lados
    {
      if (floor(random(2)) == 1) swap("bright");
      else swap("bleft");
    } 
    
    else if (isempty("bright") && isempty("right")) // cai para a direita
    {
      swap("bright");
    } 
    
    else if (isempty("bleft") && isempty("left")) // cai para a esquerda
    {
      swap("bleft");
    }
  }
  
  @Override
  protected boolean isempty(String direction)
  {
    
    switch (direction)
    {
      
    case "right":
      if (j < cols - 1)
      {
        if (!(grid[i][j+1] instanceof StationaryCell) && !verify[i][j+1]) return true;
        else return false;
      } else return false;

    case "bright":
      if (i < rows - 1 && j < cols - 1)
      {
        if (!(grid[i+1][j+1] instanceof StationaryCell) && !verify[i+1][j+1] && this.density > grid[i+1][j+1].density) return true;
        else return false;
      } else return false;

    case "bottom":
      if (i < rows - 1)
      {
        if (!(grid[i+1][j] instanceof StationaryCell) && !verify[i+1][j] && this.density > grid[i+1][j].density) return true;
        else return false;
      } else return false;

    case "bleft":
      if (i < rows - 1 && j > 0)
      {
        if (!(grid[i+1][j-1] instanceof StationaryCell) && !verify[i+1][j-1] && this.density > grid[i+1][j-1].density) return true;
        else return false;
      } else return false;

    case "left":
      if (j > 0)
      {
        if (!(grid[i][j-1] instanceof StationaryCell) && !verify[i][j-1]) return true;
        else return false;
      } else return false;

    default:
      return false;
    }
  }
}
