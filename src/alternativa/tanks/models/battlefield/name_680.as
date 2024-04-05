package alternativa.tanks.models.battlefield
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.SkyBox;
   import package_243.name_673;
   
   public class name_680 extends SkyBox
   {
      
      private static const const_1578:int = 200000;
       
      
      public function name_680(param1:name_673)
      {
         var _loc2_:TextureMaterial = new TextureMaterial(param1.left.data);
         var _loc3_:TextureMaterial = new TextureMaterial(param1.right.data);
         var _loc4_:TextureMaterial = new TextureMaterial(param1.front.data);
         var _loc5_:TextureMaterial = new TextureMaterial(param1.back.data);
         var _loc6_:TextureMaterial = new TextureMaterial(param1.top.data);
         var _loc7_:TextureMaterial = new TextureMaterial(param1.bottom.data);
         super(200000,_loc2_,_loc3_,_loc5_,_loc4_,_loc7_,_loc6_,0);
      }
   }
}
