package package_4
{
   import alternativa.model.name_66;
   import flash.utils.Dictionary;
   import package_13.Long;
   import package_6.ClientClass;
   import package_6.ObjectRegister;
   import projects.tanks.client.panel.model.name_67;
   
   public class ClientObject
   {
       
      
      private var var_23:String;
      
      private var var_21:String;
      
      private var var_20:ClientClass;
      
      private var models:Vector.<Long>;
      
      private var var_19:Dictionary;
      
      private var var_18:Dictionary;
      
      private var var_22:ObjectRegister;
      
      private var user:name_67;
      
      public function ClientObject(param1:String, param2:ClientClass, param3:String, param4:String = null)
      {
         super();
         this.var_21 = param1;
         this.var_20 = param2;
         this.var_23 = param3;
         if(this.models != null)
         {
            this.models = this.models;
         }
         else
         {
            this.models = new Vector.<Long>();
         }
         this.var_19 = new Dictionary();
         this.var_18 = new Dictionary();
      }
      
      public function method_17(param1:name_66) : void
      {
         this.models.push(param1);
      }
      
      public function method_13(param1:name_66) : void
      {
         var _loc2_:int = this.models.indexOf(param1);
         this.models.splice(_loc2_,1);
      }
      
      public function method_16(param1:Class) : Object
      {
         return this.var_18[param1];
      }
      
      public function method_12(param1:Class, param2:Object) : void
      {
         this.var_18[param1] = param2;
      }
      
      public function method_19(param1:Class) : Object
      {
         var _loc2_:Object = this.var_18[param1];
         delete this.var_18[param1];
         return _loc2_;
      }
      
      public function method_11(param1:name_66) : Object
      {
         return this.var_19[param1];
      }
      
      public function method_18(param1:name_66, param2:Object) : void
      {
         this.var_19[param1] = param2;
      }
      
      public function get id() : String
      {
         return this.var_21;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
      
      public function get method_14() : ClientClass
      {
         return this.var_20;
      }
      
      public function method_15() : Vector.<String>
      {
         return this.var_20.models;
      }
      
      public function get register() : ObjectRegister
      {
         return this.var_22;
      }
      
      public function set register(param1:ObjectRegister) : void
      {
         this.var_22 = param1;
      }
   }
}
