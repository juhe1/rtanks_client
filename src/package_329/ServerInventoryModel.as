package package_329
{
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_4.ClientObject;
   import package_49.name_97;
   import package_50.EffectsVisualizationModel;
   import package_50.name_104;
   import package_7.name_32;
   import package_80.InventoryItemModel;
   import package_80.InventoryModel;
   import package_80.name_1440;
   
   public class ServerInventoryModel
   {
       
      
      private var var_56:InventoryModel;
      
      private var var_720:InventoryItemModel;
      
      private var var_2380:EffectsVisualizationModel;
      
      private var var_686:name_32;
      
      private var var_199:Dictionary;
      
      public function ServerInventoryModel()
      {
         super();
      }
      
      public function init() : void
      {
         this.var_686 = name_32(Main.osgi.name_6(name_32));
         this.var_56 = InventoryModel(this.var_686.getModelsByInterface(name_97)[0]);
         this.var_720 = InventoryItemModel(this.var_686.getModelsByInterface(name_1440)[0]);
         this.var_2380 = EffectsVisualizationModel(this.var_686.getModelsByInterface(name_104)[0]);
         this.var_199 = new Dictionary();
      }
      
      public function name_1619(param1:Array) : void
      {
         var _loc2_:name_1593 = null;
         var _loc3_:ClientObject = null;
         this.var_56.objectLoaded(null);
         for each(_loc2_ in param1)
         {
            _loc3_ = this.name_1863(_loc2_.id);
            this.var_720.initObject(_loc3_,null,_loc2_.count,_loc2_.itemEffectTime,_loc2_.slotId,_loc2_.itemRestSec);
            this.var_199[_loc2_.id] = _loc3_;
         }
      }
      
      public function name_1625(param1:Array) : void
      {
         var _loc2_:name_1593 = null;
         if(this.var_56 == null || this.var_720 == null)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            this.var_720.method_1386(this.var_199[_loc2_.id],_loc2_.count);
         }
      }
      
      public function name_1623(param1:String) : void
      {
         this.var_720.activated(this.var_199[param1]);
      }
      
      public function method_997(param1:String, param2:int) : void
      {
         this.var_720.method_997(this.var_199[param1],param2);
      }
      
      public function method_994(param1:String, param2:int) : void
      {
         this.var_720.method_994(this.var_199[param1],param2);
      }
      
      public function name_1631(param1:ClientObject, param2:Array) : void
      {
         this.var_2380.initObject(param1,param2);
      }
      
      public function name_1616(param1:ClientObject, param2:int, param3:int) : void
      {
         this.var_2380.method_1387(param1,param1.id,param2,param3);
      }
      
      public function name_1624(param1:ClientObject, param2:int) : void
      {
         this.var_2380.method_36(param1,param1.id,param2);
      }
      
      public function name_1620() : void
      {
         if(this.var_56 == null)
         {
            return;
         }
         this.var_56.method_998(null);
      }
      
      private function name_1863(param1:String) : ClientObject
      {
         return new ClientObject(param1,null,param1,null);
      }
   }
}
