package package_73
{
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import package_37.Vector3;
   
   public class name_3072 extends Mesh
   {
       
      
      private var a:Vertex;
      
      private var b:Vertex;
      
      private var c:Vertex;
      
      private var d:Vertex;
      
      public var distance:Number = 0;
      
      public var direction:Vector3;
      
      public var position:Vector3;
      
      public var name_3073:Boolean = false;
      
      public function name_3072()
      {
         this.direction = new Vector3();
         this.position = new Vector3();
         super();
         this.a = addVertex(-1,1,0,0,0);
         this.b = addVertex(-1,0,0,0,1);
         this.c = addVertex(1,0,0,1,1);
         this.d = addVertex(1,1,0,1,0);
         addQuadFace(this.a,this.b,this.c,this.d);
         calculateFacesNormals();
      }
      
      public function init(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:TextureMaterial) : void
      {
         var _loc7_:Number = param1 / 2;
         this.method_3186(this.a,-_loc7_,param4);
         this.method_3186(this.b,-_loc7_,param3);
         this.method_3186(this.c,_loc7_,param3);
         this.method_3186(this.d,_loc7_,param4);
         this.alpha = param2;
         this.distance = param5;
         setMaterialToAllFaces(param6);
      }
      
      private function method_3186(param1:Vertex, param2:Number, param3:Number) : void
      {
         param1.x = param2;
         param1.y = param3;
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
         this.name_3073 = false;
      }
   }
}
