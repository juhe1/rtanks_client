package alternativa.tanks.utils
{
   import package_14.name_36;
   
   public class Antiflood
   {
      
      public static var clientLog:name_36;
      
      private static const const_1991:String = "chat";
      
      private static const const_1993:RegExp = /[^bpfvбпфвcgjkqsxzсцзкгхdtдтlлйmnмнrржшщч]/g;
      
      private static const g1:RegExp = /[bpfvбпфв]+/g;
      
      private static const g2:RegExp = /[cgjkqsxzсцзкгх]+/g;
      
      private static const g3:RegExp = /[dtдт]+/g;
      
      private static const g4:RegExp = /[lлй]+/g;
      
      private static const g5:RegExp = /[mnмн]+/g;
      
      private static const g6:RegExp = /[rр]+/g;
      
      private static const g7:RegExp = /[жшщч]+/g;
      
      private static var var_2410:Vector.<Array> = Vector.<Array>([]);
      
      private static var var_2413:Vector.<String>;
      
      private static var var_2412:int;
      
      private static var var_2411:int;
      
      private static var bufferSize:int;
       
      
      public function Antiflood()
      {
         super();
      }
      
      public static function init(param1:Vector.<String>, param2:int, param3:int, param4:int) : void
      {
         Antiflood.var_2413 = param1;
         Antiflood.var_2412 = param2;
         Antiflood.var_2411 = param3;
         Antiflood.bufferSize = param4;
         clientLog.log("chat","init: minChars = %1  minWords = %2 bufferSize = %3",Antiflood.var_2412,Antiflood.var_2411,Antiflood.bufferSize);
      }
      
      private static function method_2412(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:String = param1.substr(0,1).toUpperCase();
         param1 = param1.substr(1).toLowerCase().replace(const_1993,"");
         param1 = param1.replace(g1,"1").replace(g2,"2").replace(g3,"3").replace(g4,"4").replace(g5,"5").replace(g6,"6").replace(g7,"7");
         var _loc4_:int = 0;
         while(_loc4_ < 10)
         {
            _loc2_ = _loc4_.toString();
            param1 = param1.replace(RegExp(_loc2_ + "{2,}"),_loc2_);
            _loc4_++;
         }
         if(param1.length > 4)
         {
            param1 = param1.substr(0,4);
         }
         else
         {
            param1 += int(0).toFixed(4 - param1.length).substr(2);
         }
         return _loc3_ + param1;
      }
      
      public static function name_2657(param1:String) : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Array = name_2656(param1);
         if(param1.length < var_2412 && _loc5_.length < var_2411)
         {
            return true;
         }
         if(Antiflood.method_2410(param1) < 0.3 || Antiflood.method_2411(_loc5_) < 0.59)
         {
            return false;
         }
         for each(_loc2_ in var_2410)
         {
            _loc3_ = Math.max(_loc5_.length,_loc2_.length) / Math.min(_loc5_.length,_loc2_.length);
            if(_loc3_ < 1.5)
            {
               _loc4_ = method_2409(_loc5_,_loc2_);
               if(_loc4_ > 0.7)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public static function method_2409(param1:Array, param2:Array) : Number
      {
         var _loc3_:Number = 0;
         var _loc4_:int = param1.indexOf(param2[0]);
         if(param1.length > 1 && _loc4_ > -1 && _loc4_ < param1.length / 2)
         {
            param1 = param1.slice(_loc4_);
         }
         var _loc5_:int = Math.min(param1.length,param2.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(param1[_loc6_] == param2[_loc6_])
            {
               _loc3_ += 1;
            }
            else if(_loc6_ > 0 && param1[_loc6_] == param2[_loc6_ - 1])
            {
               _loc3_ += 0.5;
            }
            else if(_loc6_ < _loc5_ - 1 && param1[_loc6_] == param2[_loc6_ + 1])
            {
               _loc3_ += 0.5;
            }
            _loc6_++;
         }
         return _loc3_ / _loc5_;
      }
      
      public static function name_2656(param1:String, param2:Boolean = false) : Array
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         param1 = method_2408(param1);
         var _loc6_:Array = param1.split(" ");
         var _loc7_:Array = new Array();
         for each(_loc3_ in _loc6_)
         {
            if(_loc3_ != "")
            {
               _loc7_.push(_loc3_);
            }
         }
         _loc4_ = [];
         for each(_loc5_ in _loc7_)
         {
            _loc4_.push(Antiflood.method_2412(_loc5_));
         }
         if(param2 && _loc4_.length > 0 && (_loc7_.length >= var_2411 || param1.length >= var_2412))
         {
            var_2410.push(_loc4_);
            if(var_2410.length > bufferSize)
            {
               var_2410.shift();
            }
         }
         return _loc4_;
      }
      
      private static function method_2408(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         for each(_loc2_ in var_2413)
         {
            _loc3_ = "(http://|https://)?(www\\.)?" + _loc2_ + "[-a-zA-Z0-9./#%_]+";
            param1 = param1.replace(new RegExp(_loc3_,"gi")," ");
         }
         return param1.replace(/[\s_!@#$%^&*()"'\{\}_=+~,.;:\-\/?\[\]\/]+/g," ");
      }
      
      private static function method_2411(param1:Array) : Number
      {
         var _loc2_:String = null;
         if(param1.length < 1)
         {
            return 1;
         }
         var _loc3_:Array = new Array();
         for each(_loc2_ in param1)
         {
            if(_loc3_.indexOf(_loc2_) < 0)
            {
               _loc3_.push(_loc2_);
            }
         }
         return _loc3_.length / param1.length;
      }
      
      public static function method_2410(param1:String) : Number
      {
         var _loc2_:String = param1.replace(/[\s_!@#$%^&*()"'\{\}_=+~,.;:\-\/?\[\]\/]+/g,"");
         return _loc2_.length / param1.length;
      }
   }
}
