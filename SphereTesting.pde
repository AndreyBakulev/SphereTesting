import peasy.*;
PeasyCam cam;
Sphere sphere;
NormalizedCube nCube;
Vector3D[][] globe;

void setup(){
    size(800,800,P3D);
    Vector3D[] direction = {Vector3D.Up(),Vector3D.Down(),Vector3D.Left(),Vector3D.Right(),Vector3D.Forward(),Vector3D.Backward()};
    cam = new PeasyCam(this,500);
    sphere = new Sphere(0,0,0,30,30,200,globe);
    for(int i = 0; i < direction.length; i++){
        nCube = new NormalizedCube(20,direction[i],150);
        nCube.constructCube();
    } 
}
void draw(){
    background(0);
    //sphere.drawSphere();
    nCube.drawCube();
}