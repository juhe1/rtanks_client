package alternativa.tanks.models.weapon.machinegun.sfx
{
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BlendMode;
   
   public class name_3275 extends Mesh
   {
      
      private static const name_424:Number = 15000;
       
      
      private var a:Vertex;
      
      private var b:Vertex;
      
      private var c:Vertex;
      
      private var d:Vertex;
      
      private var var_3112:Number;
      
      private var offset:Number = 0;
      
      public function name_3275()
      {
         super();
         this.a = addVertex(-1,1,-5);
         this.b = addVertex(-1,0,-5);
         this.c = addVertex(1,0,-5);
         this.d = addVertex(1,1,-5);
         addQuadFace(this.a,this.b,this.c,this.d);
         calculateFacesNormals();
         blendMode = BlendMode.ADD;
         useLight = false;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         useShadowMap = false;
      }
      
      public function init(param1:TextureMaterial) : void
      {
         param1.repeat = true;
         var _loc2_:Number = 30 * 0.5;
         this.a.x = -_loc2_;
         this.a.u = 0;
         this.b.x = -_loc2_;
         this.b.u = 0;
         this.c.x = _loc2_;
         this.c.u = 1;
         this.d.x = _loc2_;
         this.d.u = 1;
         this.var_3112 = 4 * 30 * param1.texture.height / param1.texture.width;
         setMaterialToAllFaces(param1);
         this.offset = 0;
      }
      
      public function update(param1:int, param2:Number = 512) : void
      {
         this.offset += 15000 * param1 / 1000;
         this.a.y = param2;
         this.d.y = param2;
         this.b.v = 1 + this.offset / this.var_3112;
         this.c.v = this.b.v;
         this.a.v = this.b.v - param2 / this.var_3112;
         this.d.v = this.a.v;
      }
   }
}
