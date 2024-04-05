package package_70
{
   import package_37.Vector3;
   import package_39.Model;
   import package_93.name_1243;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class DiscreteWeaponListenerEvents implements name_273
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_273>;
      
      public function DiscreteWeaponListenerEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_273>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function method_796(param1:name_70, param2:Vector3, param3:Vector.<name_1243>) : void
      {
         var i:int = 0;
         var m:name_273 = null;
         var shooter:name_70 = param1;
         var direction:Vector3 = param2;
         var targets:Vector.<name_1243> = param3;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_273(this.impl[i]);
               m.method_796(shooter,direction,targets);
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
