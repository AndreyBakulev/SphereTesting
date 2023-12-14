class NormalizedCube{
    int resolution;
    Vector3D localUp;
    Vector3D axisA;
    Vector3D axisB;
    Vector3D[] verticesArray;
    int[] triangleArray;
    int radius;
    public NormalizedCube(int resolution, Vector3D localUp, int radius){
        this.resolution = resolution;
        this.localUp = localUp;
        axisA = new Vector3D(localUp.y, localUp.z, localUp.x);
        axisB = localUp.cross(axisA);
        this.radius = radius;
    }
    void constructCube(){
        verticesArray = new Vector3D[resolution*resolution];
        triangleArray = new int[((resolution-1)*(resolution-1))*6];
        int triIndex = 0;
        for(double y = 0; y < resolution; y++){
            for(double x = 0; x < resolution; x++){
                int i = (int) (x+(y*resolution));
                Vector2D percentDone = new Vector2D(x/(resolution-1),y/(resolution-1));
                Vector3D pointOnUnitCube = localUp.add(axisA.scale(((percentDone.x -.5)*2))).add(axisB.scale(((percentDone.y -.5)*2)));
                //println(pointOnUnitCube.x + " " + pointOnUnitCube.y + " " + pointOnUnitCube.z);
                //println(percentDone);
                verticesArray[i] = pointOnUnitCube;

                if(x != resolution-1  && y != resolution-1){
                    triangleArray[triIndex] = i;
                    triangleArray[triIndex+1] = i+resolution+1;
                    triangleArray[triIndex+2] = i+resolution;
                    triangleArray[triIndex+3] = i;
                    triangleArray[triIndex+4] = i+1;
                    triangleArray[triIndex+5] = i+resolution+1;
                    triIndex+= 6;
                }
            }
        }
    }
    void drawCube(){
        // copy mesh filters part of code into here (use beginShape and endShape)
        // for(int i = 0; i < resolution; i++){
        //     beginShape(TRIANGLES);
        //     for(int j = 0; j < resolution; j+=3){
        //         PVector p1 = verticesArray[triangleArray[j+(i*resolution)]];
        //         PVector p2 = verticesArray[triangleArray[j+(i*resolution+1)]];
        //         PVector p3 = verticesArray[triangleArray[j+(i*resolution+2)]];
        //         vertex(p1.x,p1.y,p1.z);
        //         vertex(p2.x,p2.y,p2.z);
        //         vertex(p3.x,p3.y,p3.z);
        //         println(p2.x);
        //     }
        //     endShape();
        // }

        for(int i = 0; i < triangleArray.length; i+=3){
            beginShape(TRIANGLES);
            Vector3D p1 = (verticesArray[triangleArray[i]]).normalize().scale(radius);
            Vector3D p2 = (verticesArray[triangleArray[i+1]]).normalize().scale(radius);
            Vector3D p3 = (verticesArray[triangleArray[i+2]]).normalize().scale(radius);
            vertex((float)p1.x,(float)p1.y,(float)p1.z);
            vertex((float)p2.x,(float)p2.y,(float)p2.z);
            vertex((float)p3.x,(float)p3.y,(float)p3.z);
            //println(p1.y);
            
            endShape();
        }
    }
}

/*
p1 x=0 , y= 1, z = -20
p2 x=0 , y= 1, z = -20

PROBLEMS:
percentDone rounds to int so thats fs a problem
*/