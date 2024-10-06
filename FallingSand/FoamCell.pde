class FoamCell extends FallingCell
{
  FoamCell(int i, int j)
  {
    super(i, j);
    this.cor = color(255);
    this.density = 0.4;
  }

  @Override
    Cell factory(int i, int j)
  {
    return new FoamCell(i, j);
  }
}
