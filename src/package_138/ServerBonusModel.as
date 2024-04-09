package package_138
{
   import package_1.Main;
   import package_182.BonusModel;
   import package_327.name_1586;
   import package_327.name_1587;
   import package_7.name_32;
   
   public class ServerBonusModel
   {
       
      
      private var model:BonusModel;
      
      private var var_686:name_32;
      
      public function ServerBonusModel()
      {
         super();
         this.var_686 = name_32(Main.osgi.getService(name_32));
         this.model = BonusModel(this.var_686.getModelsByInterface(name_1587)[0]);
      }
      
      public function name_437(param1:String) : void
      {
         var _loc5_:Object = null;
         var _loc6_:name_1586 = null;
         var _loc2_:Array = new Array();
         var _loc3_:Object = JSON.parse(param1);
         var _loc4_:int = 0;
         for each(_loc5_ in _loc3_.items)
         {
            _loc6_ = new name_1586(_loc5_.id);
            _loc6_.count = _loc5_.count;
            _loc2_[_loc4_] = _loc6_;
            _loc4_++;
         }
         this.model.name_437(null,_loc2_,"RU");
      }
      
      public function name_469(param1:int) : void
      {
         this.model.name_1590(null,param1,null);
      }
      
      public function name_430() : void
      {
         this.model.name_430(null,null);
      }
      
      public function name_459() : void
      {
         this.model.name_459(null,null);
      }
      
      public function method_1109() : void
      {
         this.model.name_1588();
      }
      
      public function method_1110() : void
      {
         this.model.name_1589();
      }
   }
}
