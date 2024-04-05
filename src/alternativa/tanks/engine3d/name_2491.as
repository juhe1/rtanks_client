package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import flash.display.BitmapData;
   import package_1.Main;
   
   public class name_2491 extends TextureMaterial
   {
       
      
      public function name_2491(param1:BitmapData = null, param2:Boolean = false, param3:Boolean = true, param4:int = 0, param5:Number = 1)
      {
         var _loc6_:BattlefieldModel = BattlefieldModel(Main.osgi.name_6(name_83));
         if(_loc6_.var_130.indexOf(this) == -1)
         {
            _loc6_.var_130.push(this);
         }
         super(param1,param2,param3,param4,param5);
      }
      
      public function destroy(param1:Boolean) : *
      {
         dispose();
      }
   }
}
