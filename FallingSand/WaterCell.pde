class WaterCell extends LiquidCell
{
  WaterCell(int i, int j)
  {
    super(i, j);
    this.cor = color(0, 0, 255);
    this.density = 1;
  }
  
  @Override
    Cell factory(int i, int j)
  {
    return new WaterCell(i, j);
  }
}
