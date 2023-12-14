class Vector2D{
  public double x;
  public double y;

  public Vector2D(double x, double y){
    this.x = x;
    this.y = y;
    
  }
  public double getX(){
    return x;
  }
  public double getY(){
    return y;
  }
  public void applyForce(Vector2D force){
    x = x + force.getX();
    y = y + force.getY();
  }
  public Vector2D scale(double scalar){
    return new Vector2D(x*scalar,y*scalar);
  }
  public Vector2D add(Vector2D v){
    return new Vector2D(x+v.getX(),y+v.getY());
  }
  public Vector2D subtract(Vector2D v){
    return new Vector2D(x-v.getX(),y-v.getY());
  }
  public double dot(Vector2D v){
    return (x*v.getX() + y*v.getY());
  }
  public double length(){
    return Math.sqrt(this.dot(this));
  }
  public Vector2D normalize(){
    return this.scale(1/this.length());
  }
   public String toString(){
    return "(" + x + ", " + y + ")";
  }
}
