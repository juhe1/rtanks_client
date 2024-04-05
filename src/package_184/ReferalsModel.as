package package_184
{
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import package_1.Main;
   import package_282.name_1028;
   import package_282.name_1851;
   import package_282.name_993;
   import package_31.name_115;
   import package_4.ClientObject;
   import package_7.name_32;
   
   public class ReferalsModel extends name_993 implements name_1028, class_11, name_989
   {
       
      
      private var clientObject:ClientObject;
      
      private var var_1125:Array;
      
      private var modelRegister:name_32;
      
      public function ReferalsModel()
      {
         super();
         var_365.push(name_66);
         var_365.push(name_1028);
         var_365.push(class_11);
         var_365.push(name_989);
         this.modelRegister = Main.osgi.name_6(name_32) as name_32;
      }
      
      public function initObject(param1:ClientObject, param2:String) : void
      {
         this.clientObject = param1;
         Main.method_8("REFERALS MODEL","initObject   magicString: %1",param2);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         Main.method_8("REFERALS MODEL","objectLoaded");
         this.clientObject = param1;
         Main.method_8("REFERALS MODEL","   clientObject: %1",this.clientObject);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         Main.method_8("REFERALS MODEL","objectUnloaded");
         this.clientObject = null;
      }
      
      public function method_1354(param1:ClientObject, param2:Boolean, param3:String) : void
      {
         var _loc4_:name_115 = (this.modelRegister.getModelsByInterface(name_115) as Vector.<name_66>)[0] as name_115;
         _loc4_.method_511(param2,param3);
      }
      
      public function method_1353(param1:ClientObject, param2:Array) : void
      {
         var _loc3_:name_1851 = null;
         var _loc4_:Vector.<name_66> = null;
         var _loc5_:int = 0;
         this.var_1125 = param2;
         for each(_loc3_ in param2)
         {
            Main.method_8("REFERALS MODEL","rank: " + _loc3_.rank + " callsign: " + _loc3_.callsign + " income: " + _loc3_.income);
         }
         _loc4_ = this.modelRegister.getModelsByInterface(class_25) as Vector.<name_66>;
         if(_loc4_ != null)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               (_loc4_[_loc5_] as class_25).method_509(param2);
               _loc5_++;
            }
         }
      }
      
      public function name_1051() : void
      {
         Main.method_8("REFERALS MODEL","getReferalsData   clientObject: %1",this.clientObject);
      }
   }
}
