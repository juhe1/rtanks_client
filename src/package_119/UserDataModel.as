package package_119
{
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_4.ClientObject;
   import package_7.name_32;
   import projects.tanks.client.panel.model.class_120;
   import projects.tanks.client.panel.model.class_121;
   
   public class UserDataModel extends class_120 implements class_121, class_11, name_361
   {
       
      
      private var clientObject:ClientObject;
      
      private var data:Dictionary;
      
      private var var_913:String;
      
      private var var_385:String;
      
      public function UserDataModel()
      {
         super();
         var_365.push(name_66);
         var_365.push(name_361);
         var_365.push(class_11);
         var_365.push(class_121);
         this.data = new Dictionary(false);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         this.clientObject = param1;
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         this.clientObject = null;
      }
      
      public function initObject(param1:ClientObject, param2:String, param3:String) : void
      {
         this.var_913 = param3;
         this.var_385 = param2;
      }
      
      public function method_1303(param1:ClientObject, param2:String, param3:String, param4:int) : void
      {
         var _loc7_:int = 0;
         this.data[param2] = new name_351(param2,param3,param4);
         var _loc5_:name_32 = Main.osgi.name_6(name_32) as name_32;
         var _loc6_:Vector.<name_66> = _loc5_.getModelsByInterface(name_1829);
         if(_loc6_ != null)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc6_.length)
            {
               (_loc6_[_loc7_] as name_1829).name_1830(param2);
               _loc7_++;
            }
         }
      }
      
      public function getData(param1:String) : name_351
      {
         var _loc2_:name_351 = null;
         Main.method_7("UserDataModel getData userId: " + param1);
         if(this.data[param1] != null)
         {
            _loc2_ = this.data[param1];
         }
         return _loc2_;
      }
      
      public function get userId() : String
      {
         return this.var_913;
      }
      
      public function get userName() : String
      {
         return this.var_385;
      }
   }
}
