package alternativa.tanks.models.sfx
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   
   use namespace alternativa3d;
   
   public class SimplePlane extends Mesh
   {
       
      
      private var a:Vertex;
      
      private var b:Vertex;
      
      private var c:Vertex;
      
      private var d:Vertex;
      
      private var face:Face;
      
      private var originX:Number;
      
      private var originY:Number;
      
      public function SimplePlane(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.originX = param3;
         this.originY = param4;
         boundMinX = -param3 * param1;
         boundMaxX = boundMinX + param1;
         boundMinY = -param4 * param2;
         boundMaxY = boundMinY + param2;
         boundMinZ = 0;
         boundMaxZ = 0;
         this.a = this.createVertex(boundMinX,boundMinY,0,0,1);
         this.b = this.createVertex(boundMaxX,boundMinY,0,1,1);
         this.c = this.createVertex(boundMaxX,boundMaxY,0,1,0);
         this.d = this.createVertex(boundMinX,boundMaxY,0,0,0);
         this.face = this.createQuad(this.a,this.b,this.c,this.d);
         calculateFacesNormals();
      }
      
      public function name_2709(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         this.a.u = param1;
         this.a.v = param2;
         this.b.u = param3;
         this.b.v = param4;
         this.c.u = param5;
         this.c.v = param6;
         this.d.u = param7;
         this.d.v = param8;
      }
      
      public function set material(param1:Material) : void
      {
         this.face.material = param1;
      }
      
      public function set width(param1:Number) : void
      {
         boundMinX = this.a.x = this.d.x = -this.originX * param1;
         boundMaxX = this.b.x = this.c.x = boundMinX + param1;
      }
      
      public function get length() : Number
      {
         return boundMaxY - boundMinY;
      }
      
      public function set length(param1:Number) : void
      {
         boundMinY = this.a.y = this.b.y = -this.originY * param1;
         boundMaxY = this.d.y = this.c.y = boundMinY + param1;
      }
      
      private function createVertex(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Vertex
      {
         var _loc6_:Vertex = new Vertex();
         _loc6_.alternativa3d::next = alternativa3d::vertexList;
         alternativa3d::vertexList = _loc6_;
         _loc6_.x = param1;
         _loc6_.y = param2;
         _loc6_.z = param3;
         _loc6_.u = param4;
         _loc6_.v = param5;
         return _loc6_;
      }
      
      private function createQuad(param1:Vertex, param2:Vertex, param3:Vertex, param4:Vertex) : Face
      {
         var _loc5_:Face = new Face();
         _loc5_.alternativa3d::next = alternativa3d::faceList;
         alternativa3d::faceList = _loc5_;
         _loc5_.alternativa3d::wrapper = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::vertex = param1;
         _loc5_.alternativa3d::wrapper.alternativa3d::next = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::vertex = param2;
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param3;
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::next = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param4;
         return _loc5_;
      }
      
      public function destroy() : void
      {
         var _loc1_:Vertex = null;
         var _loc2_:Face = null;
         this.a = null;
         this.b = null;
         this.c = null;
         this.d = null;
         this.face = null;
         if(alternativa3d::vertexList != null)
         {
            while(alternativa3d::vertexList.alternativa3d::next != null)
            {
               _loc1_ = alternativa3d::vertexList;
               alternativa3d::vertexList = null;
               alternativa3d::vertexList = _loc1_.alternativa3d::next;
            }
            alternativa3d::vertexList = null;
         }
         if(alternativa3d::faceList != null)
         {
            while(alternativa3d::faceList.alternativa3d::next != null)
            {
               _loc2_ = alternativa3d::faceList;
               alternativa3d::faceList.alternativa3d::wrapper.alternativa3d::vertex = null;
               alternativa3d::faceList.alternativa3d::wrapper = null;
               alternativa3d::faceList = null;
               alternativa3d::faceList = _loc2_.alternativa3d::next;
            }
            alternativa3d::faceList = null;
         }
         alternativa3d::captureListeners = null;
         alternativa3d::bubbleListeners = null;
      }
   }
}
