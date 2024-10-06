class OilCell extends LiquidCell
{
  OilCell(int i, int j)
  {
    super(i, j);
    this.cor = color(150, 150, 0);
    this.density = 0.3;
  }
  
  @Override
    Cell factory(int i, int j)
  {
    return new OilCell(i, j);
  }
}
