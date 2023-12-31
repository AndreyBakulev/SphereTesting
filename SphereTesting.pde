import peasy.*;
PeasyCam cam;
int detail = Controller.DETAIL;
int radius = Controller.RADIUS;
int sphereMode = Controller.SPHERE_MODE;
int icoRecursive = Controller.ICO_RECURSIVE;
Sphere sphere;
Vector3D[][] globe;
NormalizedCube[] cubeFaces = new NormalizedCube[6];
SpherifiedCube[] sCubeFaces = new SpherifiedCube[6];
Icosahedron ico = new Icosahedron(icoRecursive,radius);
Vector3D[] direction = {new Vector3D(0,-1,0), new Vector3D(0,1,0),new Vector3D(1,0,0),new Vector3D(-1,0,0),new Vector3D(0,0,1),new Vector3D(0,0,-1)};
String currentShape = "Icosahedron";
void setup(){
    size(800,800,P3D);
    cam = new PeasyCam(this,500);
    sphere = new Sphere(0,0,0,30,30,200,globe);
    ico.createMesh();
    for(int i = 0; i < 6; i++){
        sCubeFaces[i] = new SpherifiedCube(detail,direction[i],radius);
        sCubeFaces[i].constructCube();
        cubeFaces[i] = new NormalizedCube(detail,direction[i],radius);
        cubeFaces[i].constructCube();
    }
    
}
void draw(){
    background(0);
    switch(sphereMode){
        case 0: 
            ico.draw();
            currentShape = "Icosahedron";
        break;
        case 1:
        for(int i = 0; i < 6; i++){
            cubeFaces[i].drawCube();
        }
        currentShape = "Normalized Cube";
        break;
        case 2:
        for(int i = 0; i < 6; i++){
            sCubeFaces[i].drawCube();
        }
        currentShape = "Spherified Cube";
        break;
        case 3:
        sphere(radius);
        currentShape = "UV Sphere";
        break;
    } 
    textAlign(CENTER);
    textSize(75);
    fill(0,408,612);
    text(currentShape,0,-200);
    fill(255);
}
void keyPressed(){
    if (key == CODED) {
        if (keyCode == RIGHT && sphereMode != 3) {
            sphereMode ++;
        }
        if (keyCode == LEFT && sphereMode != 0) {
            sphereMode--; 
        }
        // if (keyCode == UP) {
        //     icoRecursive++;
        //     ico.createMesh();
        // }
        // if (keyCode == DOWN && icoRecursive > 0) {
        //     icoRecursive--;
        //     ico.createMesh();
        // }
    }
}