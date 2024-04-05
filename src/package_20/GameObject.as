package package_20
{
   import flash.utils.Dictionary;
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.name_178;
   import platform.client.fp10.core.type.name_202;
   import platform.client.fp10.core.type.name_70;
   import platform.client.fp10.core.type.name_71;
   
   public class GameObject implements name_70, name_71
   {
      
      public static var modelRegistry:name_29;
       
      
      private var var_23:String;
      
      private var var_21:Long;
      
      private var var_219:GameClass;
      
      private var var_218:name_202;
      
      private var data:Dictionary;
      
      private var var_216:Dictionary;
      
      private var var_217:Dictionary;
      
      private var var_220:Dictionary;
      
      public function GameObject(param1:Long, param2:GameClass, param3:String, param4:name_202)
      {
         this.data = new Dictionary();
         this.var_216 = new Dictionary();
         this.var_217 = new Dictionary();
         this.var_220 = new Dictionary();
         super();
         this.var_21 = param1;
         this.var_219 = param2;
         this.var_23 = param3;
         this.var_218 = param4;
      }
      
      public function get id() : Long
      {
         return this.var_21;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
      
      public function get gameClass() : name_178
      {
         return this.var_219;
      }
      
      public function get space() : name_202
      {
         return this.var_218;
      }
      
      public function event(param1:Class) : Object
      {
         var _loc2_:Object = this.var_217[param1];
         if(_loc2_ == null)
         {
            _loc2_ = this.method_317(param1,true);
            this.var_217[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public function method_316(param1:Class) : Boolean
      {
         if(this.var_216[param1] == null)
         {
            return modelRegistry.getModelsForObject(this,param1).length > 0;
         }
         return true;
      }
      
      public function name_176(param1:Class) : Object
      {
         var _loc2_:Object = this.var_216[param1];
         if(_loc2_ == null)
         {
            _loc2_ = this.method_317(param1,false);
            if(_loc2_ == null)
            {
               throw new Error("GameObject::adapt() No models have been found. Object: " + this + ", interface: " + param1);
            }
            this.var_216[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public function putData(param1:Model, param2:Class, param3:Object) : void
      {
         var _loc4_:Dictionary = this.data[param1];
         if(_loc4_ == null)
         {
            _loc4_ = new Dictionary();
            this.data[param1] = _loc4_;
         }
         _loc4_[param2] = param3;
      }
      
      public function getData(param1:Model, param2:Class) : Object
      {
         var _loc3_:Dictionary = this.data[param1];
         return _loc3_ == null ? null : _loc3_[param2];
      }
      
      public function clearData(param1:Model, param2:Class) : Object
      {
         var _loc3_:Dictionary = this.data[param1];
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:Object = _loc3_[param2];
         delete _loc3_[param2];
         return _loc4_;
      }
      
      public function toString() : String
      {
         return "[GameObject id=" + this.var_21 + "]";
      }
      
      private function method_317(param1:Class, param2:Boolean) : Object
      {
         var _loc3_:uint = 0;
         var _loc4_:Vector.<name_66> = modelRegistry.getModelsForObject(this,param1);
         if(!param2)
         {
            _loc3_ = _loc4_.length;
            if(_loc3_ > 1)
            {
               throw new Error("GameObject::_adapt() Multiple models have been found. Object: " + this + ", interface: " + param1);
            }
            if(_loc3_ == 0)
            {
               return null;
            }
         }
         var _loc5_:Class = param2 ? modelRegistry.name_857(param1) : modelRegistry.name_856(param1);
         if(_loc5_ == null)
         {
            throw new Error("Proxy class not found for specified interface");
         }
         return new _loc5_(this,param2 ? _loc4_ : _loc4_[0]);
      }
      
      public function clear() : void
      {
         this.method_319();
         this.var_219 = null;
         this.var_218 = null;
         this.method_318();
         this.clearDictionary(this.var_216);
         this.clearDictionary(this.var_220);
         this.clearDictionary(this.var_217);
      }
      
      private function method_318() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Dictionary = null;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         for(_loc1_ in this.data)
         {
            _loc2_ = this.data[_loc1_];
            for(_loc3_ in _loc2_)
            {
               _loc4_ = _loc2_[_loc3_];
               if(_loc4_ is AutoClosable)
               {
                  trace("AutoClosable " + _loc4_ + " is close");
                  AutoClosable(_loc4_).close();
               }
               delete _loc2_[_loc3_];
            }
            delete this.data[_loc1_];
         }
      }
      
      private function method_319() : void
      {
         var _loc1_:name_66 = null;
         var _loc2_:Vector.<name_66> = modelRegistry.getModelsForObject(this,name_66);
         Model.object = this;
         for each(_loc1_ in _loc2_)
         {
            _loc1_.method_37();
         }
         Model.method_38();
      }
      
      private function clearDictionary(param1:Dictionary) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in param1)
         {
            delete param1[_loc2_];
         }
      }
   }
}
