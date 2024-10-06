class DynamicPoint extends Point
{
  DynamicPoint(float x, float y)
  {
   super(x,y); 
  }
  
  void change()
  {
    int size = initials.size();
    int index = floor(random(size));
    
    x = (x + initials.get(index).x) / 2;
    y = (y + initials.get(index).y) / 2;
  }
}
