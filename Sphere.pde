class Sphere{
float x, y, z, r;
    int w, h;
    PVector[][] globe;
    int[][] greyScale;
    int groundLevel = 30;
    int altitude;
    
    Sphere(float x, float y, float z, int w, int h, float r, PVector[][] globe) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
        this.h = h;
        this.r = r;
        this.globe = globe;
    }

    void drawSphere(String sphereType){
        if(sphereType.equals("standard")){
            sphere(r);
            sphereDetail(w);
        }
        if(sphereType.equals("normalized cube")){
            //make a cube and iterate thru and get the vectors
            //then normalize them and multiply by radius
            
            /* MAKING CUBE
            make 6 edges (each one having a local up dir, and an axis A and B based off that)

            */
        }
    }
}