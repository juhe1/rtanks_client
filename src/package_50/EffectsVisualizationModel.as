package package_50
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import flash.utils.IDataInput;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_332.EffectsVisualizationModelBase;
   import package_332.class_137;
   import package_332.name_1598;
   import package_4.ClientObject;
   import package_7.name_32;
   
   public class EffectsVisualizationModel extends EffectsVisualizationModelBase implements class_137, name_104, class_11, IModel
   {
       
      
      private var var_123:TankModel;
      
      private var var_1140:Vector.<name_1598>;
      
      public function EffectsVisualizationModel()
      {
         super();
         var_365.push(IModel,name_104,class_11);
         Main.osgi.registerService(name_104,this);
      }
      
      public function initObject(param1:ClientObject, param2:Array) : void
      {
         var _loc3_:name_32 = null;
         if(param2 == null)
         {
            this.var_1140 = null;
         }
         else
         {
            this.var_1140 = Vector.<name_1598>(param2);
         }
         if(this.var_123 == null)
         {
            _loc3_ = name_32(Main.osgi.getService(name_32));
            this.var_123 = TankModel(Main.osgi.getService(ITank));
         }
      }
      
      public function method_1387(param1:ClientObject, param2:String, param3:int, param4:int) : void
      {
         var _loc5_:ClientObject = param1;
         if(_loc5_ != null)
         {
            this.var_123.method_34(_loc5_,param3,param4);
         }
      }
      
      public function method_36(param1:ClientObject, param2:String, param3:int) : void
      {
         var _loc5_:uint = 0;
         var _loc6_:int = 0;
         var _loc7_:name_1598 = null;
         if(this.var_1140 != null)
         {
            _loc5_ = this.var_1140.length;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = this.var_1140[_loc6_];
               if(_loc7_.userID == param2 && _loc7_.itemIndex == param3)
               {
                  this.var_1140[_loc6_] = this.var_1140[--_loc5_];
                  this.var_1140.length = _loc5_;
                  return;
               }
               _loc6_++;
            }
         }
         var _loc4_:ClientObject = param1;
         if(_loc4_ != null)
         {
            this.var_123.method_36(_loc4_,param3);
         }
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         this.var_1140 = null;
      }
      
      public function name_259(param1:String) : Vector.<name_110>
      {
         var _loc2_:Vector.<name_110> = null;
         var _loc5_:name_1598 = null;
         if(this.var_1140 == null)
         {
            return null;
         }
         var _loc3_:int = getTimer();
         var _loc4_:int = 0;
         while(_loc4_ < this.var_1140.length)
         {
            _loc5_ = this.var_1140[_loc4_];
            if(_loc5_.userID == param1)
            {
               if(_loc2_ == null)
               {
                  _loc2_ = new Vector.<name_110>();
               }
               _loc2_.push(new name_110(_loc3_,_loc5_.userID,_loc5_.itemIndex,_loc5_.durationTime));
               this.var_1140.splice(_loc4_,1);
               _loc4_--;
            }
            _loc4_++;
         }
         if(this.var_1140.length == 0)
         {
            this.var_1140 = null;
         }
         return _loc2_;
      }
      
      public function method_305(param1:ClientObject, param2:Object) : void
      {
      }
      
      public function invoke(param1:ClientObject, param2:String, param3:Object, param4:IDataInput, param5:Object) : void
      {
      }
      
      public function get id() : String
      {
         return "";
      }
      
      public function get interfaces() : Vector.<Class>
      {
         return var_365;
      }
   }
}
