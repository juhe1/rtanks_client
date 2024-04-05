package package_6
{
   import alternativa.model.class_11;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_24.LogLevel;
   import package_24.name_50;
   import package_4.ClientObject;
   import package_7.name_11;
   import package_7.name_32;
   
   public class ObjectRegister
   {
      
      private static const const_27:String = "OBJREG";
      
      private static var counter:int;
       
      
      private var objects:Dictionary;
      
      private var var_114:Array;
      
      private var var_115:Object;
      
      public var id:int;
      
      public var space:Object;
      
      public function ObjectRegister(param1:Object)
      {
         super();
         this.var_115 = param1;
         this.objects = new Dictionary();
         this.var_114 = new Array();
         this.id = counter++;
      }
      
      public function name_15(param1:String, param2:ClientClass, param3:String) : ClientObject
      {
         var _loc5_:ClientObject = null;
         if(this.objects[param1] != null)
         {
            name_11.log(LogLevel.name_79,"FATAL ERROR: ПОПЫТКА СОЗДАНИЯ 2-ГО ДИСПЕТЧЕРА!!! (spaceId: " + this.space.id + ")");
         }
         else if(this.objects[param1] != null)
         {
            name_11.log(LogLevel.name_79,"FATAL ERROR: Повторная загрузка объекта (objectId: " + param1 + ", name: " + param3 + ")");
         }
         else
         {
            _loc5_ = new ClientObject(param1,param2,param3);
            this.method_139(_loc5_);
            Main.method_8("OBJREG","Object ADDED: space id=%1, register id=%2, object id=%3",this.space == null ? "none" : this.space.id,this.id,param1);
         }
         return this.objects[param1];
      }
      
      public function name_188(param1:String) : void
      {
         var _loc3_:Vector.<String> = null;
         var _loc4_:int = 0;
         var _loc5_:class_11 = null;
         var _loc2_:ClientObject = this.objects[param1];
         if(_loc2_ == null)
         {
            (Main.osgi.name_6(name_50) as name_50).log(LogLevel.name_79,"[ObjectRegister::destroyObject] ERROR: clientObject == null! (id: " + param1 + ")");
         }
         else
         {
            Main.method_8("OBJREG","Destroying object: space id=%1, register id=%2, object id=%3",this.space == null ? "none" : this.space.id,this.id,param1);
            _loc3_ = _loc2_.method_15();
            if(_loc3_ != null)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc5_ = name_32(Main.osgi.name_6(name_32)).getModel(_loc3_[_loc4_]) as class_11;
                  if(_loc5_ != null)
                  {
                     _loc5_.objectUnloaded(_loc2_);
                  }
                  _loc4_++;
               }
            }
            this.var_114.splice(this.var_114.indexOf(this.objects[param1]),1);
            delete this.objects[param1];
            Main.method_8("OBJREG","Object DESTROYED");
         }
      }
      
      private function method_139(param1:ClientObject) : void
      {
         this.objects[param1.id] = param1;
         this.var_114.push(param1);
         param1.register = this;
      }
      
      public function getObject(param1:String) : ClientObject
      {
         return this.objects[param1];
      }
      
      public function method_141() : Dictionary
      {
         return this.objects;
      }
      
      public function get method_140() : Array
      {
         return this.var_114;
      }
   }
}
