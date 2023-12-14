class Sphere{
float x, y, z, r;
    int w, h;
    Vector3D[][] globe;
    int[][] greyScale;
    int groundLevel = 30;
    int altitude;
    
    Sphere(float x, float y, float z, int w, int h, float r, Vector3D[][] globe) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
        this.h = h;
        this.r = r;
        this.globe = globe;
    }

    void drawSphere(){
         sphere(r);
        sphereDetail(w);
        
    }
    
}