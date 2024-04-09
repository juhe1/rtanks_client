package platform.client.fp10.core.registry.impl
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.name_11;
   import alternativa.osgi.service.logging.name_26;
   import flash.utils.Dictionary;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.type.name_70;
   
   public class ModelsRegistryImpl implements name_29
   {
      
      public static var var_235:name_840;
       
      
      private var var_17:name_11;
      
      private var var_230:Dictionary;
      
      private var var_233:Dictionary;
      
      private var var_231:Dictionary;
      
      private var var_190:Dictionary;
      
      private var var_234:Dictionary;
      
      private var var_232:Vector.<name_66>;
      
      private var class2Adapt:Dictionary;
      
      private var class2Events:Dictionary;
      
      public function ModelsRegistryImpl(param1:OSGi)
      {
         this.class2Adapt = new Dictionary();
         this.class2Events = new Dictionary();
         super();
         var _loc2_:name_26 = name_26(param1.getService(name_26));
         this.var_17 = _loc2_.getLogger("modelsreg");
         this.var_231 = new Dictionary();
         this.var_230 = new Dictionary();
         this.var_190 = new Dictionary();
         this.var_233 = new Dictionary();
         this.var_234 = new Dictionary();
         this.var_232 = new Vector.<name_66>();
      }
      
      public function register(param1:Long, param2:Long) : void
      {
         this.var_190[param2] = param1;
      }
      
      public function method_335(param1:Long, param2:name_860) : void
      {
         this.var_234[param1] = param2;
      }
      
      public function method_261(param1:Long) : void
      {
         delete this.var_234[param1];
      }
      
      public function method_334(param1:Long) : name_860
      {
         return this.var_234[param1];
      }
      
      public function add(param1:name_66, param2:Vector.<Class>) : void
      {
         var _loc3_:Class = null;
         var _loc4_:Vector.<name_66> = null;
         this.var_232.push(param1);
         if(param2.indexOf(name_66) < 0)
         {
            param2.push(name_66);
         }
         var _loc5_:Long = param1.id;
         this.var_230[_loc5_] = param1;
         this.var_231[_loc5_] = param2;
         var _loc6_:int = 0;
         while(_loc6_ < param2.length)
         {
            _loc3_ = param2[_loc6_];
            _loc4_ = this.var_233[_loc3_];
            if(_loc4_ == null)
            {
               this.var_233[_loc3_] = _loc4_ = new Vector.<name_66>();
            }
            _loc4_.push(param1);
            _loc6_++;
         }
      }
      
      public function remove(param1:Long) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:name_66 = null;
         var _loc4_:Vector.<Class> = null;
         var _loc5_:int = 0;
         var _loc6_:Long = null;
         var _loc7_:Class = null;
         var _loc8_:Vector.<name_66> = null;
         var _loc9_:int = 0;
         this.var_232.splice(this.var_232.indexOf(this.var_230[param1]),1);
         for(_loc2_ in this.var_190)
         {
            _loc6_ = this.var_190[_loc2_];
            if(_loc6_ == param1)
            {
               delete this.var_190[_loc2_];
            }
         }
         _loc3_ = name_66(this.var_230[param1]);
         _loc4_ = this.var_231[param1] as Vector.<Class>;
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc7_ = _loc4_[_loc5_];
            _loc8_ = this.var_233[_loc7_] as Vector.<name_66>;
            _loc9_ = _loc8_.indexOf(_loc3_);
            _loc8_.splice(_loc9_,1);
            _loc5_++;
         }
         delete this.var_231[param1];
         delete this.var_230[param1];
      }
      
      public function invoke(param1:name_70, param2:Long, param3:name_69) : void
      {
         var _loc4_:Long = Long(this.var_190[param2]);
         var _loc5_:Model = Model(this.var_230[_loc4_]);
         if(_loc5_ != null)
         {
            Model.object = param1;
            _loc5_.invoke(param2,param3);
            Model.method_38();
         }
      }
      
      public function getModel(param1:Long) : name_66
      {
         return this.var_230[param1];
      }
      
      public function getModelsByInterface(param1:Class) : Vector.<name_66>
      {
         return this.var_233[param1];
      }
      
      public function method_260(param1:name_70, param2:Class) : name_66
      {
         var _loc3_:name_66 = null;
         var _loc4_:Long = null;
         var _loc5_:Vector.<Class> = null;
         var _loc6_:int = 0;
         var _loc7_:Vector.<Long> = param1.gameClass.models;
         var _loc8_:int = _loc7_.length - 1;
         while(_loc8_ >= 0)
         {
            _loc4_ = _loc7_[_loc8_];
            _loc5_ = this.var_231[_loc4_] as Vector.<Class>;
            if(_loc5_ == null)
            {
               throw new Error("ModelsRegistryImpl::getModelForObject() No interfaces found. Object id=" + param1.id + ", model id=" + _loc4_);
            }
            _loc6_ = _loc5_.length - 1;
            while(_loc6_ >= 0)
            {
               if(_loc5_[_loc6_] == param2)
               {
                  if(_loc3_ == null)
                  {
                     _loc3_ = this.getModel(_loc4_);
                     break;
                  }
                  throw new Error("ModelsRegistryImpl::getModelForObject() Multiple models have been found. Object: " + param1 + ", interface: " + param2);
               }
               _loc6_--;
            }
            _loc8_--;
         }
         return _loc3_;
      }
      
      public function getModelsForObject(param1:name_70, param2:Class) : Vector.<name_66>
      {
         var _loc3_:Long = null;
         var _loc4_:Vector.<Class> = null;
         if(param1.gameClass == null)
         {
            throw new Error("ModelsRegistryImpl::getModelsForObject(): Object class not found. Object: " + param1 + ", interface: " + param2);
         }
         var _loc5_:Vector.<Long> = param1.gameClass.models;
         var _loc6_:Vector.<name_66> = new Vector.<name_66>();
         var _loc7_:int = _loc5_.length - 1;
         while(_loc7_ >= 0)
         {
            _loc3_ = _loc5_[_loc7_];
            _loc4_ = this.var_231[_loc3_] as Vector.<Class>;
            if(_loc4_ != null && _loc4_.indexOf(param2) >= 0)
            {
               _loc6_.push(this.getModel(_loc3_));
            }
            _loc7_--;
         }
         return _loc6_;
      }
      
      public function method_259(param1:Long) : Vector.<Class>
      {
         return this.var_231[param1];
      }
      
      public function get models() : Vector.<name_66>
      {
         return this.var_232;
      }
      
      public function name_275(param1:Class, param2:Class) : void
      {
         this.class2Adapt[param1] = param2;
      }
      
      public function name_270(param1:Class, param2:Class) : void
      {
         this.class2Events[param1] = param2;
      }
      
      public function name_856(param1:Class) : Class
      {
         return this.class2Adapt[param1];
      }
      
      public function name_857(param1:Class) : Class
      {
         return this.class2Events[param1];
      }
   }
}
