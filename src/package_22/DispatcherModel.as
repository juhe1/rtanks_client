package package_22
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import flash.utils.IDataInput;
   import package_1.Main;
   import package_13.Long;
   import package_19.name_42;
   import package_24.LogLevel;
   import package_24.name_50;
   import package_274.name_854;
   import package_4.ClientObject;
   import package_6.ClientClass;
   import package_6.ObjectRegister;
   import package_7.name_32;
   import package_7.name_46;
   
   public class DispatcherModel implements IModel
   {
      
      private static const const_27:String = "DISPATCHER";
       
      
      private var var_212:ObjectRegister;
      
      private var var_213:name_46;
      
      public function DispatcherModel()
      {
         super();
         this.var_213 = name_46(Main.osgi.getService(name_46));
      }
      
      public function get interfaces() : Vector.<Class>
      {
         return Vector.<Class>([IModel]);
      }
      
      public function method_305(param1:ClientObject, param2:Object) : void
      {
      }
      
      public function invoke(param1:ClientObject, param2:String, param3:Object, param4:IDataInput, param5:Object) : void
      {
         var _loc9_:Long = null;
         switch(param2)
         {
            case "a":
               _loc9_ = Long(param3.getCodec(Long).decode(param4,param5,true));
               break;
            case "s":
               Main.method_8("DISPATCHER","[DispatcherModel.invoke] LOAD command recieved");
               this.method_307(param3,param4,param5);
               break;
            case "":
               Main.method_8("DISPATCHER","[DispatcherModel.invoke] UNLOAD command recieved");
               this.method_306(param3,param4,param5);
         }
      }
      
      private function method_307(param1:Object, param2:IDataInput, param3:Object) : void
      {
      }
      
      private function method_306(param1:Object, param2:IDataInput, param3:Object) : void
      {
         var _loc4_:name_854 = name_854(param1.getCodec(Long));
         Main.method_7("[DispatcherModel.invoke] unload " + null);
         this.var_212.name_188(null);
      }
      
      public function set method_308(param1:ObjectRegister) : void
      {
         this.var_212 = param1;
      }
      
      public function get id() : String
      {
         return "";
      }
   }
}
