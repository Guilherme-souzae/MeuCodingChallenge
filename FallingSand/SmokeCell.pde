class SmokeCell extends GasCell
{
  SmokeCell(int i, int j)
  {
    super(i,j);
    this.cor = color(200);
  }
  
  @Override
  void update()
  {
   dissipate(); 
  }
  
  @Override
  Cell factory(int i, int j)
  {
    return new SmokeCell(i,j);
  }
}
