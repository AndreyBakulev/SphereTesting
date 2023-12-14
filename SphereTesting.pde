import peasy.*;
PeasyCam cam;
Sphere sphere;
Vector3D[][] globe;
NormalizedCube[] cubeFaces = new NormalizedCube[6];
SpherifiedCube[] sCubeFaces = new SpherifiedCube[6];
Icosahedron ico = new Icosahedron(1,100);
Vector3D[] direction = {new Vector3D(0,-1,0), new Vector3D(0,1,0),new Vector3D(1,0,0),new Vector3D(-1,0,0),new Vector3D(0,0,1),new Vector3D(0,0,-1)};
int normCubeDetail = 15;
int normCubeRadius = 100;
void setup(){
    size(800,800,P3D);
    cam = new PeasyCam(this,500);
    sphere = new Sphere(0,0,0,30,30,200,globe);
    ico.createMesh();
    for(int i = 0; i < 6; i++){
        sCubeFaces[i] = new SpherifiedCube(normCubeDetail,direction[i],normCubeRadius);
        sCubeFaces[i].constructCube();
        cubeFaces[i] = new NormalizedCube(normCubeDetail,direction[i],normCubeRadius);
        cubeFaces[i].constructCube();
    }
    
}
void draw(){
    background(0);
    ico.draw();
    for(int i = 0; i < 6; i++){
        //sCubeFaces[i].drawCube();
        //cubeFaces[i].drawCube();
    }
}