package alternativa.tanks.vehicles.tanks
{
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.objects.Mesh;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Shape;
   import package_13.Long;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class TankSkinPart
   {
      
      private static const const_1635:String = "details.png";
      
      private static const const_1637:String = "lightmap.jpg";
      
      private static const const_1636:String = "lightmap.png";
      
      private static const const_1634:Object = {};
       
      
      public var var_1717:Long;
      
      public var details:BitmapData;
      
      public var lightmap:BitmapData;
      
      public function TankSkinPart(param1:Tanks3DSResource)
      {
         super();
         this.var_1717 = param1.id;
         this.details = param1.textures["details.png"] || this.method_856("details.png",65280);
         this.lightmap = param1.textures["lightmap.jpg"] || param1.textures["lightmap.png"] || this.method_856("lightmap.jpg",8355711);
      }
      
      private function method_856(param1:String, param2:uint) : BitmapData
      {
         var _loc3_:BitmapData = const_1634[param1];
         if(_loc3_ == null)
         {
            _loc3_ = new StubBitmapData(param2);
            const_1634[param1] = _loc3_;
         }
         return _loc3_;
      }
      
      public function createTexture(param1:BitmapData) : BitmapData
      {
         var _loc2_:BitmapData = new BitmapData(this.lightmap.width,this.lightmap.height,false,0);
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginBitmapFill(param1);
         _loc3_.graphics.drawRect(0,0,this.lightmap.width,this.lightmap.height);
         _loc2_.draw(_loc3_);
         _loc2_.draw(this.lightmap,null,null,BlendMode.HARDLIGHT);
         _loc2_.draw(this.details);
         _loc3_ = null;
         return _loc2_;
      }
      
      protected function method_764(param1:Mesh) : Mesh
      {
         if(param1.sorting != Sorting.DYNAMIC_BSP)
         {
            param1.sorting = Sorting.DYNAMIC_BSP;
            param1.calculateFacesNormals(true);
            param1.optimizeForDynamicBSP();
            param1.threshold = 0.01;
         }
         return param1;
      }
   }
}
