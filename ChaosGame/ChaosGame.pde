ArrayList<Point> initials = new ArrayList<Point>();
boolean pause = true;
boolean firstTime = true;

DynamicPoint curr;

void setup()
{
  size(600, 600);
  background(0);
}

void draw()
{
  if (!pause)
  {
    curr.show();
    curr.change();
  }
}

void mouseClicked()
{
  switch (mouseButton)
  {
  case LEFT:
    Point ponto = new Point(mouseX, mouseY);
    ponto.show();
    initials.add(ponto);
    break;

  case RIGHT:
    if (initials.size() > 0)
    {
      if (firstTime)
      {
        curr = new DynamicPoint(random(width), random(height));
        curr.show();
        firstTime = false;
      }
      pause = !pause;
    }
    break;
  }
}
