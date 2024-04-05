package package_54
{
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class LocaleService implements name_102
   {
       
      
      private var var_1087:String;
      
      private var var_1086:Dictionary;
      
      private var images:Dictionary;
      
      public function LocaleService(param1:String)
      {
         super();
         this.var_1087 = param1;
         this.var_1086 = new Dictionary();
         this.images = new Dictionary();
      }
      
      public function method_617(param1:String, param2:String) : void
      {
         this.var_1086[param1] = param2;
      }
      
      public function method_618(param1:String, param2:Array) : void
      {
         this.var_1086[param1] = param2;
      }
      
      public function method_620(param1:Array) : void
      {
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.method_617(param1[_loc3_],param1[_loc3_ + 1]);
            _loc3_ += 2;
         }
      }
      
      public function method_619(param1:String, param2:BitmapData) : void
      {
         this.images[param1] = param2;
      }
      
      public function getText(param1:String, ... rest) : String
      {
         var _loc3_:String = this.var_1086[param1] != null ? String(this.var_1086[param1]) : param1;
         var _loc4_:int = 0;
         while(_loc4_ < rest.length)
         {
            _loc3_ = _loc3_.replace("%" + (_loc4_ + 1),rest[_loc4_]);
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function method_616(param1:String) : Array
      {
         return this.var_1086[param1] != null ? this.var_1086[param1] : new Array();
      }
      
      public function getImage(param1:String) : BitmapData
      {
         return this.images[param1];
      }
      
      public function get language() : String
      {
         return this.var_1087;
      }
   }
}
