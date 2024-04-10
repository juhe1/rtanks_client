package package_62
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.tank.ITank;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_67.Vector3d;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class LaserPointerModelServer
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2262:Long;
      
      private var var_2265:name_860;
      
      private var var_2266:name_860;
      
      private var var_2264:Long;
      
      private var var_2263:Long;
      
      private var var_2267:name_860;
      
      private var model:name_66;
      
      public function LaserPointerModelServer(param1:name_66)
      {
         this.var_2262 = Long.getLong(378246388,-1614466693);
         this.var_2264 = Long.getLong(1929188336,1755522623);
         this.var_2263 = Long.getLong(840274237,-606345319);
         super();
         this.model = param1;
      }
      
      public function method_875(param1:name_70, param2:Vector3d) : void
      {
         var _loc3_:String = String(ITank(param1.name_176(ITank)).getTank().tankData.userName);
         var _loc4_:Object = {};
         _loc4_.x = param2.x;
         _loc4_.y = param2.y;
         _loc4_.z = param2.z;
         Network(OSGi.getInstance().getService(INetworker)).send("battle;aim_at_tank;" + _loc3_ + ";" + JSON.stringify(_loc4_));
      }
      
      public function hide() : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("battle;hide_laser;");
      }
      
      public function method_877(param1:Number) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("battle;update_direction;" + param1);
      }
   }
}
