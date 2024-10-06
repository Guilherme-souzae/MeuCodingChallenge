abstract class GasCell extends ElementCell
{
  GasCell(int i, int j)
  {
    super(i, j);
  }
  
  protected void dissipate()
  {
    if (isempty("top")) // cai para baixo
    {
      swap("top");
    } 
    
    else if (isempty("tright") && isempty("tleft") && isempty("right") && isempty("left")) // cai para um dos dois lados
    {
      if (floor(random(2)) == 1) swap("tright");
      else swap("tleft");
    } 
    
    else if (isempty("tright") && isempty("right")) // cai para a direita
    {
      swap("tright");
    } 
    
    else if (isempty("tleft") && isempty("left")) // cai para a esquerda
    {
      swap("tleft");
    }
    
    else if (isempty("right") && isempty("left")) // move para esquerda ou direita
    {
      if (floor(random(2)) == 1) swap("left");
      else swap("right");
    }
    
    else if (isempty("left")) // move para a esquerda
    {
      swap("left");
    }
    
    else if (isempty("right")) // move para a direita
    {
      swap("right");
    }
  }
}
