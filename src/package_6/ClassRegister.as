package package_6
{
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_13.Long;
   import package_7.name_46;
   
   public class ClassRegister implements name_46
   {
       
      
      private var var_209:Dictionary;
      
      private var var_210:Array;
      
      public function ClassRegister()
      {
         super();
         this.var_210 = new Array();
         this.var_209 = new Dictionary();
      }
      
      public function createClass(param1:String, param2:ClientClass, param3:String, param4:Array, param5:Array) : ClientClass
      {
         var _loc8_:Vector.<String> = null;
         var _loc9_:int = 0;
         var _loc10_:Dictionary = null;
         var _loc11_:* = undefined;
         var _loc6_:Vector.<String> = new Vector.<String>();
         if(param2 != null)
         {
            _loc8_ = param2.models;
            _loc9_ = 0;
            while(_loc9_ < _loc8_.length)
            {
               if(param5 != null)
               {
                  if(param5.indexOf(_loc8_[_loc9_]) == -1)
                  {
                     _loc6_.push(_loc8_[_loc9_]);
                  }
               }
               else
               {
                  _loc6_.push(_loc8_[_loc9_]);
               }
               _loc9_++;
            }
         }
         if(param4 != null)
         {
            _loc9_ = 0;
            while(_loc9_ < param4.length)
            {
               _loc6_.push(param4[_loc9_]);
               _loc9_++;
            }
         }
         _loc6_.sort(this.method_304);
         var _loc7_:ClientClass = new ClientClass(param1,param2,param3,_loc6_);
         if(param2 != null)
         {
            param2.addChild(_loc7_);
            _loc10_ = param2.name_852;
            for(_loc11_ in _loc10_)
            {
               _loc7_.name_853(_loc11_,_loc10_[_loc11_]);
            }
         }
         this.var_209[param1] = _loc7_;
         this.var_210.push(_loc7_);
         Main.method_7("ClassRegister ClientClass id:" + param1 + " name:" + param3 + " зарегистрирован");
         return _loc7_;
      }
      
      private function method_304(param1:Long, param2:Long) : int
      {
         var _loc3_:int = param1.high - param2.high;
         if(_loc3_ == 0)
         {
            _loc3_ = param1.low - param2.low;
         }
         return _loc3_;
      }
      
      public function method_302(param1:String) : void
      {
         this.var_210.splice(this.var_210.indexOf(this.var_209[param1]),1);
         this.var_209[param1] = null;
      }
      
      public function getClass(param1:String) : ClientClass
      {
         return this.var_209[param1];
      }
      
      public function get method_303() : Dictionary
      {
         return this.var_209;
      }
      
      public function get method_301() : Array
      {
         return this.var_210;
      }
   }
}
