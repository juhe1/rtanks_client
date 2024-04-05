package mx.utils
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class StringUtil
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function StringUtil()
      {
         super();
      }
      
      public static function trim(param1:String) : String
      {
         if(param1 == null)
         {
            return "";
         }
         var _loc2_:int = 0;
         while(isWhitespace(param1.charAt(_loc2_)))
         {
            _loc2_++;
         }
         var _loc3_:int = param1.length - 1;
         while(isWhitespace(param1.charAt(_loc3_)))
         {
            _loc3_--;
         }
         if(_loc3_ >= _loc2_)
         {
            return param1.slice(_loc2_,_loc3_ + 1);
         }
         return "";
      }
      
      public static function trimArrayElements(param1:String, param2:String) : String
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 != "" && param1 != null)
         {
            _loc3_ = param1.split(param2);
            _loc4_ = int(_loc3_.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_[_loc5_] = StringUtil.trim(_loc3_[_loc5_]);
               _loc5_++;
            }
            if(_loc4_ > 0)
            {
               param1 = _loc3_.join(param2);
            }
         }
         return param1;
      }
      
      public static function isWhitespace(param1:String) : Boolean
      {
         switch(param1)
         {
            case " ":
            case "\t":
            case "\r":
            case "\n":
            case "\f":
               return true;
            default:
               return false;
         }
      }
      
      public static function substitute(param1:String, ... rest) : String
      {
         var _loc3_:Array = null;
         if(param1 == null)
         {
            return "";
         }
         var _loc4_:uint = uint(rest.length);
         if(_loc4_ == 1 && rest[0] is Array)
         {
            _loc4_ = (_loc3_ = rest[0] as Array).length;
         }
         else
         {
            _loc3_ = rest;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            param1 = param1.replace(new RegExp("\\{" + _loc5_ + "\\}","g"),_loc3_[_loc5_]);
            _loc5_++;
         }
         return param1;
      }
      
      public static function repeat(param1:String, param2:int) : String
      {
         if(param2 == 0)
         {
            return "";
         }
         var _loc3_:String = param1;
         var _loc4_:int = 1;
         while(_loc4_ < param2)
         {
            _loc3_ += param1;
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function restrict(param1:String, param2:String) : String
      {
         var _loc3_:uint = 0;
         if(param2 == null)
         {
            return param1;
         }
         if(param2 == "")
         {
            return "";
         }
         var _loc4_:Array = [];
         var _loc5_:int = param1.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = param1.charCodeAt(_loc6_);
            if(testCharacter(_loc3_,param2))
            {
               _loc4_.push(_loc3_);
            }
            _loc6_++;
         }
         return String.fromCharCode.apply(null,_loc4_);
      }
      
      private static function testCharacter(param1:uint, param2:String) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:uint = 0;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:* = true;
         var _loc10_:uint = 0;
         if((_loc3_ = param2.length) > 0)
         {
            if((_loc4_ = param2.charCodeAt(0)) == 94)
            {
               _loc6_ = true;
            }
         }
         var _loc11_:int = 0;
         while(_loc11_ < _loc3_)
         {
            _loc4_ = param2.charCodeAt(_loc11_);
            _loc5_ = false;
            if(!_loc7_)
            {
               if(_loc4_ == 45)
               {
                  _loc8_ = true;
               }
               else if(_loc4_ == 94)
               {
                  _loc9_ = !_loc9_;
               }
               else if(_loc4_ == 92)
               {
                  _loc7_ = true;
               }
               else
               {
                  _loc5_ = true;
               }
            }
            else
            {
               _loc5_ = true;
               _loc7_ = false;
            }
            if(_loc5_)
            {
               if(_loc8_)
               {
                  if(_loc10_ <= param1 && param1 <= _loc4_)
                  {
                     _loc6_ = _loc9_;
                  }
                  _loc8_ = false;
                  _loc10_ = 0;
               }
               else
               {
                  if(param1 == _loc4_)
                  {
                     _loc6_ = _loc9_;
                  }
                  _loc10_ = _loc4_;
               }
            }
            _loc11_++;
         }
         return _loc6_;
      }
   }
}
