package package_6
{
   import alternativa.model.IModel;
   import flash.utils.Dictionary;
   import flash.utils.IDataInput;
   import package_1.Main;
   import package_24.LogLevel;
   import package_4.ClientObject;
   import package_7.name_11;
   import package_7.name_32;
   
   public class ModelsRegister implements name_32
   {
       
      
      private var var_188:Dictionary;
      
      private var var_191:Dictionary;
      
      private var var_189:Dictionary;
      
      private var var_190:Dictionary;
      
      private var var_193:Dictionary;
      
      private var var_192:Vector.<IModel>;
      
      public function ModelsRegister()
      {
         super();
         this.var_189 = new Dictionary();
         this.var_188 = new Dictionary();
         this.var_190 = new Dictionary();
         this.var_191 = new Dictionary();
         this.var_193 = new Dictionary();
         this.var_192 = new Vector.<IModel>();
      }
      
      public function register(param1:String, param2:String) : void
      {
         this.var_190[param2] = param1;
         Main.method_8("MODEL REGISTER","Метод %1 (модель %2) зарегистрирован",param2,param1);
      }
      
      public function method_258(param1:String, param2:Class) : void
      {
         this.var_193[param1] = param2;
      }
      
      public function method_261(param1:String) : void
      {
         this.var_193[param1] = null;
      }
      
      public function method_257(param1:String) : Class
      {
         return this.var_193[param1];
      }
      
      public function add(param1:IModel) : void
      {
         var _loc5_:Class = null;
         var _loc6_:Vector.<IModel> = null;
         Main.method_8("MODEL REGISTER","add model %1",param1);
         this.var_192.push(param1);
         var _loc2_:String = String(param1.id);
         this.var_188[_loc2_] = param1;
         var _loc3_:Vector.<Class> = param1.interfaces;
         this.var_189[_loc2_] = _loc3_;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            _loc6_ = this.var_191[_loc5_];
            if(_loc6_ == null)
            {
               this.var_191[_loc5_] = _loc6_ = new Vector.<IModel>();
            }
            _loc6_.push(param1);
            _loc4_++;
         }
         Main.method_8("MODEL REGISTER","Реализация модели id: %1 %2 добавлена в реестр",_loc2_,param1);
      }
      
      public function remove(param1:String) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:IModel = null;
         var _loc4_:Vector.<Class> = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Class = null;
         var _loc8_:Vector.<IModel> = null;
         var _loc9_:int = 0;
         Main.method_8("MODEL REGISTER","remove model id: %1",param1);
         this.var_192.splice(this.var_192.indexOf(this.var_188[param1]),1);
         for(_loc2_ in this.var_190)
         {
            _loc6_ = String(this.var_190[_loc2_]);
            if(_loc6_ == param1)
            {
               delete this.var_190[_loc2_];
            }
         }
         _loc3_ = IModel(this.var_188[param1]);
         Main.method_8("MODEL REGISTER","   model instance: %1",_loc3_);
         _loc4_ = this.var_189[param1] as Vector.<Class>;
         Main.method_8("MODEL REGISTER","   model interfaces: %1",_loc4_);
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc7_ = _loc4_[_loc5_];
            _loc8_ = this.var_191[_loc7_] as Vector.<IModel>;
            Main.method_8("MODEL REGISTER","   models for interface %1: %2",_loc7_,_loc8_);
            _loc9_ = _loc8_.indexOf(_loc3_);
            _loc8_.splice(_loc9_,1);
            _loc5_++;
         }
         delete this.var_189[param1];
         delete this.var_188[param1];
         Main.method_8("MODEL REGISTER","Реализация модели id: %1 удалена из реестра",param1);
      }
      
      public function invoke(param1:ClientObject, param2:String, param3:IDataInput, param4:Object) : void
      {
         var _loc5_:String = String(this.var_190[param2]);
         var _loc6_:IModel = IModel(this.var_188[_loc5_]);
         Main.method_8("MODEL REGISTER","invoke");
         Main.method_8("MODEL REGISTER","   methodId: " + param2,255);
         Main.method_8("MODEL REGISTER","   clientObjectId: " + param1.id,255);
         Main.method_8("MODEL REGISTER","   invoke modelId: " + _loc5_,255);
         Main.method_8("MODEL REGISTER","   invoke model: " + _loc6_,255);
         if(_loc6_ != null)
         {
            _loc6_.invoke(param1,param2,null,param3,param4);
         }
         else
         {
            Main.method_8("MODEL REGISTER","   method invoke failed. MODEL NOT FOUND");
         }
      }
      
      public function getModel(param1:String) : IModel
      {
         return this.var_188[param1];
      }
      
      public function getModelsByInterface(param1:Class) : Vector.<IModel>
      {
         Main.method_8("MODEL REGISTER","getModelsByInterface %1: %2",param1,this.var_191[param1]);
         return this.var_191[param1];
      }
      
      public function method_260(param1:ClientObject, param2:Class) : IModel
      {
         var _loc3_:String = null;
         var _loc4_:IModel = null;
         var _loc7_:Vector.<Class> = null;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            _loc3_ = "Object is null. Model interface = " + param2;
            name_11.log(LogLevel.name_79,"ModelRegister::getModelForObject " + _loc3_);
         }
         if(param2 == null)
         {
            _loc3_ = "Model interface is null. Object id = " + param1.id;
            name_11.log(LogLevel.name_79,"ModelRegister::getModelForObject " + _loc3_);
            throw new ArgumentError(_loc3_);
         }
         var _loc5_:Vector.<String> = param1.method_15();
         var _loc6_:int = _loc5_.length - 1;
         while(_loc6_ >= 0)
         {
            _loc7_ = this.var_189[_loc5_[_loc6_]] as Vector.<Class>;
            if(_loc7_ == null)
            {
               throw new Error("No interfaces found. Object id=" + param1.id + ", model id=" + _loc5_[_loc6_]);
            }
            _loc8_ = _loc7_.length - 1;
            while(_loc8_ >= 0)
            {
               if(_loc7_[_loc8_] == param2)
               {
                  if(_loc4_ == null)
                  {
                     _loc4_ = this.getModel(_loc5_[_loc6_]);
                     break;
                  }
                  throw new Error("MODEL REGISTER getModelForObject: Найдено несколько моделей с указанным интерфейсом.");
               }
               _loc8_--;
            }
            _loc6_--;
         }
         return _loc4_;
      }
      
      public function getModelsForObject(param1:ClientObject, param2:Class) : Vector.<IModel>
      {
         var _loc6_:Vector.<Class> = null;
         var _loc7_:int = 0;
         var _loc3_:Vector.<IModel> = new Vector.<IModel>();
         var _loc4_:Vector.<String> = param1.method_15();
         var _loc5_:int = _loc4_.length - 1;
         while(_loc5_ >= 0)
         {
            _loc6_ = this.var_189[_loc4_[_loc5_]] as Vector.<Class>;
            if(_loc6_ == null)
            {
               throw new Error("No interfaces found. Object id=" + param1.id + ", model id=" + _loc4_[_loc5_]);
            }
            _loc7_ = _loc6_.length - 1;
            while(_loc7_ >= 0)
            {
               if(_loc6_[_loc7_] == param2)
               {
                  _loc3_.push(this.getModel(_loc4_[_loc5_]));
                  break;
               }
               _loc7_--;
            }
            _loc5_--;
         }
         return _loc3_;
      }
      
      public function method_259(param1:String) : Vector.<Class>
      {
         return this.var_189[param1];
      }
      
      public function get method_256() : Vector.<IModel>
      {
         return this.var_192;
      }
   }
}
