class Point
{
  float x, y;
  
  Point(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void show()
  {
    stroke(255);
    strokeWeight(3);
    point(x,y);
  }
}
