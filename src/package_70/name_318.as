package package_70
{
   import package_37.Vector3;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.name_1378;
   
   public class name_318 implements name_278
   {
       
      
      private var object:name_70;
      
      private var impl:name_278;
      
      public function name_318(param1:name_70, param2:name_278)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function method_909(param1:int, param2:Vector3, param3:Vector.<name_1378>) : void
      {
         var clientTime:int = param1;
         var direction:Vector3 = param2;
         var targets:Vector.<name_1378> = param3;
         try
         {
            Model.object = this.object;
            this.impl.method_909(clientTime,direction,targets);
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_910(param1:int, param2:Vector3) : void
      {
         var clientTime:int = param1;
         var direction:Vector3 = param2;
         try
         {
            Model.object = this.object;
            this.impl.method_910(clientTime,direction);
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
