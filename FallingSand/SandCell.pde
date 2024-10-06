class SandCell extends FallingCell
{
  SandCell(int i, int j)
  {
    super(i, j);
    this.cor = color(255, 255, 0);
    this.density = 1.5;
  }

  @Override
    Cell factory(int i, int j)
  {
    return new SandCell(i, j);
  }
}
