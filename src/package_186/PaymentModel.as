package package_186
{
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import flash.net.SharedObject;
   import package_1.Main;
   import package_387.class_132;
   import package_387.class_133;
   import package_4.ClientObject;
   import package_7.name_32;
   import package_95.name_298;
   
   public class PaymentModel extends class_132 implements class_133, class_11, class_134
   {
       
      
      private var clientObject:ClientObject;
      
      private var var_1137:String;
      
      private var var_1134:int;
      
      private var var_1136:String;
      
      private var var_1135:String;
      
      public function PaymentModel()
      {
         super();
         var_365.push(name_66);
         var_365.push(class_134);
         var_365.push(class_133);
         var_365.push(class_11);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         this.clientObject = param1;
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         this.clientObject = null;
      }
      
      public function method_563(param1:ClientObject, param2:Array, param3:Array, param4:String, param5:int, param6:String, param7:String) : void
      {
         var _loc10_:int = 0;
         this.var_1137 = param4;
         this.var_1134 = param5;
         this.var_1136 = param6;
         this.var_1135 = param7;
         var _loc8_:name_32 = Main.osgi.name_6(name_32) as name_32;
         var _loc9_:Vector.<name_66> = _loc8_.getModelsByInterface(name_1020);
         if(_loc9_ != null)
         {
            _loc10_ = 0;
            while(_loc10_ < _loc9_.length)
            {
               (_loc9_[_loc10_] as name_1020).method_563(param2,param3,param4,param5,param6);
               _loc10_++;
            }
         }
      }
      
      public function method_1385(param1:ClientObject, param2:String, param3:Array) : void
      {
         var _loc6_:int = 0;
         var _loc4_:name_32 = Main.osgi.name_6(name_32) as name_32;
         var _loc5_:Vector.<name_66> = _loc4_.getModelsByInterface(name_1020);
         if(_loc5_ != null)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               (_loc5_[_loc6_] as name_1020).method_1385(param2,param3);
               _loc6_++;
            }
         }
      }
      
      public function method_1384(param1:ClientObject, param2:int, param3:Array) : void
      {
         var _loc6_:int = 0;
         var _loc4_:name_32 = Main.osgi.name_6(name_32) as name_32;
         var _loc5_:Vector.<name_66> = _loc4_.getModelsByInterface(name_1020);
         if(_loc5_ != null)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               (_loc5_[_loc6_] as name_1020).method_1384(param2,param3);
               _loc6_++;
            }
         }
      }
      
      public function getData() : void
      {
      }
      
      public function method_1383(param1:String) : void
      {
      }
      
      public function method_1379(param1:int) : void
      {
         var _loc2_:SharedObject = name_298(Main.osgi.name_6(name_298)).getStorage();
         _loc2_.data.userOperator = param1;
      }
      
      public function get method_1378() : String
      {
         return this.var_1135;
      }
      
      public function get method_1381() : String
      {
         return this.var_1137;
      }
      
      public function get method_1382() : int
      {
         return this.var_1134;
      }
      
      public function get method_1380() : String
      {
         return this.var_1136;
      }
   }
}
