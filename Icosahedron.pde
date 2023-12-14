class Icosahedron{
    int resolution;
    Vector3D localUp;
    Vector3D axisA;
    Vector3D axisB;
    ArrayList<Vector3D> verticesArray;
    int[] triangleArray;
    int radius;
    int recursionAmt;
    ArrayList<TriangleIndices> faces;
    ArrayList<TriangleIndices> faces2;
    double t = (1.0 + Math.sqrt(5.0))/2.0;
    public Icosahedron(int recursionAmt, int radius){
        this.recursionAmt = recursionAmt;
        this.radius = radius;
    }
    void createMesh(){
        //setting 12 verticies
        verticesArray = new ArrayList<Vector3D>();
        verticesArray.add(new Vector3D(-1,  t,  0));
        verticesArray.add(new Vector3D( 1,  t,  0));
        verticesArray.add(new Vector3D(-1, -t,  0));
        verticesArray.add(new Vector3D( 1, -t,  0));

        verticesArray.add(new Vector3D( 0, -1,  t));
        verticesArray.add( new Vector3D( 0,  1,  t));
        verticesArray.add( new Vector3D( 0, -1, -t));
        verticesArray.add( new Vector3D( 0,  1, -t));

        verticesArray.add(new Vector3D( t,  0, -1));
        verticesArray.add(new Vector3D( t,  0,  1));
        verticesArray.add( new Vector3D(-t,  0, -1));
        verticesArray.add( new Vector3D(-t,  0,  1));
        //setting the 20 faces
        faces = new ArrayList<TriangleIndices>();
        //first 5 surrounding p1
        faces.add(new TriangleIndices(0, 11, 5));
        faces.add(new TriangleIndices(0, 5, 1));
        faces.add(new TriangleIndices(0, 1, 7));
        faces.add(new TriangleIndices(0, 7, 10));
        faces.add(new TriangleIndices(0, 10, 11));

        // 5 adjacent faces
        faces.add(new TriangleIndices(1, 5, 9));
        faces.add(new TriangleIndices(5, 11, 4));
        faces.add(new TriangleIndices(11, 10, 2));
        faces.add(new TriangleIndices(10, 7, 6));
        faces.add(new TriangleIndices(7, 1, 8));

        // 5 faces around point 3
        faces.add(new TriangleIndices(3, 9, 4));
        faces.add(new TriangleIndices(3, 4, 2));
        faces.add(new TriangleIndices(3, 2, 6));
        faces.add(new TriangleIndices(3, 6, 8));
        faces.add(new TriangleIndices(3, 8, 9));

        // 5 adjacent faces
        faces.add(new TriangleIndices(4, 9, 5));
        faces.add(new TriangleIndices(2, 4, 11));
        faces.add(new TriangleIndices(6, 2, 10));
        faces.add(new TriangleIndices(8, 6, 7));
        faces.add(new TriangleIndices(9, 8, 1));

        //bisecting triangles
        for(int i = 0; i < recursionAmt; i++){
            faces2 = new ArrayList<TriangleIndices>();
            for(int j = 0; j < faces.size(); j++){
                //replace the triangles for 4
                //get the middle points of each triangle (a,b,c)
                int a = tri.getV1().getMiddlePoint(tri.getV2());
                int b = tri.getV2().getMiddlePoint(tri.getV3());
                int c = tri.getV3().getMiddlePoint(tri.getV1());
                //3 vectors that get midpoints of the three vectors 
                Vector3D newA = verticesArray.get(faces.get(j).getV1()).add(verticesArray.get(faces.get(j).getV2())).divide(2);
                Vector3D newB = verticesArray.get(faces.get(j).getV2()).add(verticesArray.get(faces.get(j).getV3())).divide(2);
                Vector3D newC = verticesArray.get(faces.get(j).getV3()).add(verticesArray.get(faces.get(j).getV1())).divide(2);
                faces2.add(new TriangleIndices(tri.getV1(),a,c));
                faces2.add(new TriangleIndices(tri.getV2(),b,a));
                faces2.add(new TriangleIndices(tri.getV3(),c,b));
                faces2.add(new TriangleIndices(a,b,c));
            }
            faces = faces2;
        }
    }
    int getMiddlePoint(int p2){
        //first check if you already have it
        //if not, get it ((vector1.add(vector2).scale(.5))
        //how do I add it to the verticeArray list?
        return 0;
    }
    void draw(){
        for(int i = 0; i < faces.size(); i++){
            beginShape(TRIANGLES);
            //this SHOULD iterate thru each item in faces and therefore get the triangles and then draw them
            Vector3D p1 = verticesArray.get(faces.get(i).getV1()).scale(radius);
            Vector3D p2 = verticesArray.get(faces.get(i).getV2()).scale(radius);
            Vector3D p3 = verticesArray.get(faces.get(i).getV3()).scale(radius);
            vertex((float)p1.x,(float)p1.y,(float)p1.z);
            vertex((float)p2.x,(float)p2.y,(float)p2.z);
            vertex((float)p3.x,(float)p3.y,(float)p3.z);
            
            endShape();
        }
    }



}
/* Figure out the math for the amt of triangles every time the triangle is broken into 3 (3,6,15,45)

TRIANGLE STUFF:
the formula of total vertices is (n^2 +2)/2 where n is the amt of vertices on the bottom (two vertice) side
how to find amt of triangles on bottom? pattern: 2,3,5,9, (if u subtract initial val 2 it becomes 0,1,3,7 find an equation that follows that)]
amt of vertices on bottom = 2*recursion -1
amt of total vertices = ((bottom*bottom) + bottom) /2

for get middle point:
you need to find the mid point, add it to the faces2 array (being done) AND add it into the vertice array so it knows the vector of it
*/
