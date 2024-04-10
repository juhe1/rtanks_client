package package_93
{
   import alternativa.osgi.OSGi;
   import flash.utils.Dictionary;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_67.Vector3d;
   import platform.client.fp10.core.model.name_66;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.name_1378;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class DiscreteWeaponCommunicationModelServer
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2235:Long;
      
      private var var_2240:name_860;
      
      private var var_2237:name_860;
      
      private var var_2234:Long;
      
      private var var_2236:name_860;
      
      private var var_2238:name_860;
      
      private var var_2239:name_860;
      
      private var model:name_66;
      
      public function DiscreteWeaponCommunicationModelServer(param1:name_66)
      {
         this.var_2235 = Long.getLong(854040669,-100146847);
         this.var_2234 = Long.getLong(2115177320,1289626411);
         super();
         this.model = param1;
      }
      
      public function method_910(param1:int, param2:Vector3d) : void
      {
         this.method_909(param1,param2,new Vector.<name_1378>());
      }
      
      public function method_909(param1:int, param2:Vector3d, param3:Vector.<name_1378>) : void
      {
         var _loc4_:Object = this.method_2304(param1, param2, param3);
         Network(OSGi.getInstance().getService(INetworker)).send("battle;fire;" + JSON.stringify(_loc4_));
      }
      
      private function method_2304(param1:int, param2:Vector3d, param3:Vector.<name_1378>) : Object
      {
         var _loc4_:Object = new Object();
         _loc4_.direction = param2;
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         var _loc7_:Vector.<name_1243> = this.method_1004(param3);
         var _loc8_:Object = null;
         var _loc9_:name_1243 = null;
         while(_loc6_ < _loc7_.length)
         {
            _loc9_ = _loc7_[_loc6_];
            _loc8_ = new Object();
            _loc8_.dir = _loc9_.direction;
            _loc8_.localHitPoint = _loc9_.localHitPoint;
            _loc8_.numberHits = _loc9_.numberHits;
            _loc8_.target = _loc9_.target.name;
            _loc5_.push(_loc8_);
            _loc6_++;
         }
         _loc4_.targets = _loc5_;
         _loc4_.physTime = param1;
         return _loc4_;
      }
      
      private function method_1004(param1:Vector.<name_1378>) : Vector.<name_1243>
      {
         var _loc2_:Dictionary = new Dictionary();
         var _loc3_:Vector.<name_1243> = new Vector.<name_1243>();
         var _loc4_:name_1378 = null;
         var _loc5_:name_1243 = null;
         for each(_loc4_ in param1)
         {
            if(_loc2_[_loc4_.target] == null)
            {
               _loc5_ = new name_1243(_loc4_.orientation,_loc4_.localHitPoint,1,_loc4_.target.tankData.object);
               _loc2_[_loc4_.target] = _loc5_;
               _loc3_.push(_loc5_);
            }
            else
            {
               ++name_1243(_loc2_[_loc4_.target]).numberHits;
            }
         }
         return _loc3_;
      }
   }
}
