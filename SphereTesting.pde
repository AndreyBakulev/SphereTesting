import peasy.*;
PeasyCam cam;
Sphere sphere;
NormalizedCube nCube;
Vector3D[][] globe;
NormalizedCube[] cubeFaces = new NormalizedCube[6];
Vector3D[] direction = {new Vector3D(0,-1,0), new Vector3D(0,1,0),new Vector3D(1,0,0),new Vector3D(-1,0,0),new Vector3D(0,0,1),new Vector3D(0,0,-1)};
void setup(){
    size(800,800,P3D);
    cam = new PeasyCam(this,500);
    sphere = new Sphere(0,0,0,30,30,200,globe);

    for(int i = 0; i < 6; i++){
        cubeFaces[i] = new NormalizedCube(20,direction[i],150);
        cubeFaces[i].constructCube();
    }
    
}
void draw(){
    background(0);
    for(int i = 0; i < 6; i++){
        cubeFaces[i].drawCube();
    }
}