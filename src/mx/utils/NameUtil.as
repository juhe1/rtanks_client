package mx.utils
{
   import flash.display.DisplayObject;
   import flash.utils.getQualifiedClassName;
   import mx.core.IRepeaterClient;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class NameUtil
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var counter:int = 0;
       
      
      public function NameUtil()
      {
         super();
      }
      
      public static function createUniqueName(param1:Object) : String
      {
         var _loc2_:int = 0;
         if(!param1)
         {
            return null;
         }
         var _loc3_:* = getQualifiedClassName(param1);
         var _loc4_:int = int(_loc3_.indexOf("::"));
         if(_loc4_ != -1)
         {
            _loc3_ = _loc3_.substr(_loc4_ + 2);
         }
         if((_loc2_ = int(_loc3_.charCodeAt(_loc3_.length - 1))) >= 48 && _loc2_ <= 57)
         {
            _loc3_ += "_";
         }
         return _loc3_ + counter++;
      }
      
      public static function displayObjectToString(param1:DisplayObject) : String
      {
         var _loc2_:String = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         try
         {
            _loc3_ = param1;
            while(_loc3_ != null)
            {
               if(_loc3_.parent && _loc3_.stage && _loc3_.parent == _loc3_.stage)
               {
                  break;
               }
               _loc4_ = "id" in _loc3_ && Boolean(_loc3_["id"]) ? String(_loc3_["id"]) : _loc3_.name;
               if(_loc3_ is IRepeaterClient)
               {
                  if(Boolean(_loc5_ = IRepeaterClient(_loc3_).instanceIndices))
                  {
                     _loc4_ += "[" + _loc5_.join("][") + "]";
                  }
               }
               _loc2_ = _loc2_ == null ? _loc4_ : _loc4_ + "." + _loc2_;
               _loc3_ = _loc3_.parent;
            }
         }
         catch(e:SecurityError)
         {
         }
         return _loc2_;
      }
      
      public static function getUnqualifiedClassName(param1:Object) : String
      {
         var _loc2_:String = null;
         if(param1 is String)
         {
            _loc2_ = param1 as String;
         }
         else
         {
            _loc2_ = getQualifiedClassName(param1);
         }
         var _loc3_:int = _loc2_.indexOf("::");
         if(_loc3_ != -1)
         {
            _loc2_ = _loc2_.substr(_loc3_ + 2);
         }
         return _loc2_;
      }
   }
}
