package package_80
{
   import alternativa.model.IModel;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_13.Long;
   import package_388.class_135;
   import package_388.class_136;
   import package_4.ClientObject;
   import package_46.name_1862;
   import package_46.name_96;
   import package_49.name_97;
   import package_7.name_32;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class InventoryItemModel extends class_136 implements class_135, name_1440
   {
      
      public static var battleEventDispatcher:name_96 = OSGi.getInstance().getService(name_96) as name_96;
       
      
      private var var_1138:class_40;
      
      private var var_1139:Dictionary;
      
      private var var_123:TankModel;
      
      public function InventoryItemModel()
      {
         this.var_1139 = new Dictionary();
         super();
         _interfaces.push(IModel,class_135,name_1440);
      }
      
      public function initObject(param1:ClientObject, param2:Long, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc9_:name_32 = null;
         if(this.var_1138 == null)
         {
            _loc9_ = name_32(Main.osgi.getService(name_32));
            this.var_1138 = class_40(_loc9_.getModelsByInterface(class_40)[0]);
            this.var_123 = TankModel(Main.osgi.getService(ITank));
         }
         var _loc7_:name_1437 = new name_1437(param1,param5,param3,param4,param6);
         this.var_1139[param1] = _loc7_;
         var _loc8_:int = param5 - 1;
         this.var_1138.method_985(_loc7_,_loc8_);
      }
      
      public function activated(param1:ClientObject) : void
      {
         var _loc2_:name_1437 = this.var_1139[param1];
         if(_loc2_ == null)
         {
            return;
         }
         --_loc2_.count;
         this.var_1138.method_986(_loc2_);
      }
      
      public function method_997(param1:ClientObject, param2:int) : void
      {
         var _loc3_:name_1437 = this.var_1139[param1];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:InventoryModel = this.var_1138 as InventoryModel;
         _loc4_.method_997(_loc3_,param2);
      }
      
      public function method_994(param1:ClientObject, param2:int) : void
      {
         var _loc3_:name_1437 = this.var_1139[param1];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:InventoryModel = this.var_1138 as InventoryModel;
         _loc4_.method_994(_loc3_,param2);
      }
      
      public function method_1386(param1:ClientObject, param2:int) : void
      {
         var _loc3_:name_1437 = this.var_1139[param1];
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.count <= 0 && param2 > 0)
         {
            battleEventDispatcher.dispatchEvent(new name_1862());
         }
         _loc3_.count = param2;
         InventoryModel(name_32(Main.osgi.getService(name_32)).getModelsByInterface(name_97)[0]).itemUpdated(_loc3_);
      }
      
      public function name_1445(param1:name_1437) : void
      {
         var _loc2_:Vector3D = null;
         if(param1.name_1864())
         {
            _loc2_ = new Vector3D();
            this.var_123.method_32(_loc2_);
            this.activate(param1.name_1863(),_loc2_);
         }
      }
      
      private function activate(param1:ClientObject, param2:Vector3D) : void
      {
         Network(Main.osgi.getService(INetworker)).send("battle;activate_item;" + param1.id + ";" + param2.x + ";" + param2.y + ";" + param2.z);
      }
   }
}
