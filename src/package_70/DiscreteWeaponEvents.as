package package_70
{
   import package_37.Vector3;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.name_1378;
   
   public class DiscreteWeaponEvents implements name_278
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<Object>;
      
      public function DiscreteWeaponEvents(param1:name_70, param2:Vector.<Object>)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function method_909(param1:int, param2:Vector3, param3:Vector.<name_1378>) : void
      {
         var i:int = 0;
         var m:name_278 = null;
         var clientTime:int = param1;
         var direction:Vector3 = param2;
         var targets:Vector.<name_1378> = param3;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_278(this.impl[i]);
               m.method_909(clientTime,direction,targets);
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_910(param1:int, param2:Vector3) : void
      {
         var i:int = 0;
         var m:name_278 = null;
         var clientTime:int = param1;
         var direction:Vector3 = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_278(this.impl[i]);
               m.method_910(clientTime,direction);
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
