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
            find axis a by swapping localup x,y,z 
            find axis b by doing cross product of axis a and local up

            CONSTRUCTCUBE(){
            verticeArray(make a vector array of resolution*resoluiton)
            triangleArray(make an int array for amt of triangles ((resolution-1*resolution-1)*2(2 triangles per area) * 3(amt of vertexes per triangle))

            DOUBLE FOR LOOP
            make a 2D percentDone vector (new vector (i,j) / resolution-1)

            make 3D vector pointoncube (add one of localUp variable)
            localup + ((percent.x - .5)*2)(we start in middle of side, so subtract .5 to get to edge and *2 to compensate)

            }
            */
        }
    }
    void constructCube(){
        PVector[] verticesArray = new PVector[radius*radius];
        int[] triangleArray = new int[((radius-1)*(radius-1))*6];
        for(int y = 0; y < radius; y++){
            for(int x = 0; x < radius; x++){
                int i = x+y*radius;
                PVector percentDone = new PVector(x/(radius-1),y/(radius-1));
                PVector pointOnUnitCube = localUp + (percentDone.x -.5)*2 * axisA + (percentDone.-5)*2 * axisB;
                verticesArray[i] = pointOnUnitCube;
            }
        }
    }
}