package alternativa.tanks.models.tank
{
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.geom.Vector3D;
   import package_37.Vector3;
   import package_39.Model;
   import package_4.ClientObject;
   import platform.client.fp10.core.type.name_70;
   
   public class ITankModelEvents implements ITank
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<Object>;
      
      public function ITankModelEvents(param1:name_70, param2:Vector.<Object>)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getTankData(param1:ClientObject) : TankData
      {
         return null;
      }
      
      public function update(param1:TankData, param2:int, param3:int, param4:Number, param5:Number, param6:Vector3) : void
      {
      }
      
      public function method_33(param1:Boolean) : void
      {
      }
      
      public function method_35() : void
      {
      }
      
      public function stop(param1:TankData) : void
      {
      }
      
      public function method_31(param1:Boolean) : void
      {
      }
      
      public function get userControlsEnabled() : Boolean
      {
         var result:Boolean = Boolean(null);
         var i:int = 0;
         var m:ITank = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = ITank(this.impl[i]);
               result = Boolean(m.userControlsEnabled);
               i++;
            }
            return result;
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_32(param1:Vector3D) : void
      {
         var pos:Vector3D = param1;
         var i:int = 0;
         var m:ITank = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = ITank(this.impl[i]);
               m.method_32(pos);
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_34(param1:ClientObject, param2:int, param3:int) : void
      {
         var clientObject:ClientObject = param1;
         var effectId:int = param2;
         var duration:int = param3;
         var i:int = 0;
         var m:ITank = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = ITank(this.impl[i]);
               m.method_34(clientObject,effectId,duration);
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_36(param1:ClientObject, param2:int) : void
      {
         var clientObject:ClientObject = param1;
         var effectId:int = param2;
         var i:int = 0;
         var m:ITank = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = ITank(this.impl[i]);
               m.method_36(clientObject,effectId);
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function getTank() : Tank
      {
         var result:Tank = null;
         var i:int = 0;
         var m:ITank = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = ITank(this.impl[i]);
               result = m.getTank();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function isLocal() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:ITank = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = ITank(this.impl[i]);
               result = Boolean(m.isLocal());
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
