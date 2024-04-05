package alternativa.tanks.config
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   
   public class Billboards
   {
      
      private static const const_1802:String = "display";
       
      
      private var var_552:Vector.<Mesh>;
      
      private var faces:Vector.<Face>;
      
      private var material:TextureMaterial;
      
      private var var_2076:BitmapData;
      
      public function Billboards()
      {
         this.var_552 = new Vector.<Mesh>();
         this.faces = new Vector.<Face>();
         super();
      }
      
      public function add(param1:Mesh) : void
      {
         var _loc2_:Face = null;
         this.var_552.push(param1);
         for each(_loc2_ in param1.faces)
         {
            if(_loc2_.material.name == "display")
            {
               this.faces.push(_loc2_);
               if(this.material == null)
               {
                  this.material = TextureMaterial(_loc2_.material);
                  this.method_2184();
               }
            }
         }
      }
      
      public function name_461(param1:BitmapData) : void
      {
         this.var_2076 = param1;
         this.method_2184();
      }
      
      private function method_2184() : void
      {
         if(this.material != null && this.var_2076 != null)
         {
            this.material.texture = this.var_2076;
            this.method_2185();
         }
      }
      
      private function method_2185() : void
      {
         if(this.var_552.length > 0)
         {
            this.material.resolution = 1;
         }
      }
   }
}
