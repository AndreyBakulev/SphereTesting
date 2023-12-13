import peasy.*;
PeasyCam cam;
Sphere sphere;
PVector[][] globe;
void setup(){
    size(800,800,P3D);
    cam = new PeasyCam(this,500);
    sphere = new Sphere(0,0,0,30,30,200,globe);
    
}
void draw(){
    background(0);
    sphere.drawSphere("normalized cube");
}