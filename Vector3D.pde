class Vector3D{
  public double x;
  public double y;
  public double z;
  public Vector3D(double x, double y, double z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  public double getx(){
    return x;
  }
  public double gety(){
    return y;
  }
  public double getz(){
    return z;
  }
  public void applyForce(Vector3D force){
    x = x + force.getx();
    y = y + force.gety();
    z = z + force.getz();
  }
  public Vector3D scale(double scalar){
    return new Vector3D(x*scalar,y*scalar,z*scalar);
  }
  public Vector3D divide(double scalar){
    return new Vector3D(x/scalar,y/scalar,z/scalar);
  }
  public Vector3D add(Vector3D v){
    return new Vector3D(x+v.getx(),y+v.gety(),z+v.getz());
  }
  public Vector3D subtract(Vector3D v){
    return new Vector3D(x-v.getx(),y-v.gety(),z-v.getz());
  }
  public double dot(Vector3D v){
    return (x*v.getx() + y*v.gety() + z*v.getz());
  }
  public double length(){
    return Math.sqrt(this.dot(this));
  }
  public Vector3D normalize(){
    return this.scale(1/this.length());
  }
  public Vector3D cross(Vector3D v){
    return new Vector3D((this.y*v.z) - (this.z*v.y),(this.z*v.x)- (this.x*v.z), (this.x*v.y)-(this.y*v.x));
  }

  public String toString(){
    return "(" + x + ", " + y + ", " + z + ")";
  }
  public  Vector3D Up(){ return new Vector3D(0,1,0);}
  public  Vector3D Down(){ return new Vector3D(0,-1,0);}
  public  Vector3D Left(){ return new Vector3D(-1,0,0);}
  public  Vector3D Right(){ return new Vector3D(1,0,0);}
  public  Vector3D Forward(){ return new Vector3D(0,0,-1);}
  public  Vector3D Backward(){ return new Vector3D(0,0,1);}
}
