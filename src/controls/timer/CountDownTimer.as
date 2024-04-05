package controls.timer
{
   import alternativa.osgi.service.logging.name_26;
   import flash.utils.clearInterval;
   import flash.utils.getTimer;
   import flash.utils.setInterval;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class CountDownTimer implements AutoClosable
   {
      
      public static var logService:name_26;
      
      private static var var_2219:Vector.<CountDownTimer> = new Vector.<CountDownTimer>();
      
      private static var var_1522:int;
      
      private static var const_53:Vector.<Object> = new Vector.<Object>(0,true);
       
      
      private var var_211:uint;
      
      private var var_2221:int;
      
      private var var_2220:Object;
      
      public function CountDownTimer()
      {
         this.var_2220 = {};
         super();
      }
      
      public static function method_2296() : void
      {
         if(var_2219.length != 0)
         {
            clearInterval(var_1522);
            var_2219.length = 0;
         }
      }
      
      private static function method_2293() : void
      {
         var _loc1_:CountDownTimer = null;
         var _loc2_:int = getTimer();
         var _loc3_:int = var_2219.length - 1;
         while(_loc3_ >= 0)
         {
            _loc1_ = var_2219[_loc3_];
            _loc1_.method_2294(_loc2_);
            _loc3_--;
         }
      }
      
      public function addListener(param1:Class, param2:Object) : void
      {
         var _loc3_:Vector.<Object> = this.var_2220[param1];
         if(_loc3_ == null)
         {
            this.var_2220[param1] = _loc3_ = new Vector.<Object>();
         }
         _loc3_.push(param2);
      }
      
      public function removeListener(param1:Class, param2:Object) : void
      {
         var _loc3_:Vector.<Object> = this.var_2220[param1];
         if(_loc3_ != null)
         {
            _loc3_.splice(_loc3_.indexOf(param2),1);
         }
      }
      
      public function start(param1:uint) : void
      {
         this.var_211 = param1;
         this.method_2295();
         this.var_2221 = Math.ceil((param1 - getTimer()) / 1000);
      }
      
      public function destroy() : void
      {
         this.method_2292();
         this.var_2220 = {};
      }
      
      public function stop() : void
      {
         this.method_2291(true);
      }
      
      private function method_2291(param1:Boolean) : void
      {
         var _loc2_:name_2547 = null;
         var _loc3_:name_2545 = null;
         this.method_2292();
         this.var_2221 = 0;
         for each(_loc2_ in this.method_2290(name_2547).concat())
         {
            _loc2_.name_2548(this,param1);
         }
         for each(_loc3_ in this.method_2290(name_2545).concat())
         {
            _loc3_.name_2549(this,param1);
         }
         this.var_2220 = {};
      }
      
      public function name_1368() : int
      {
         return this.var_2221;
      }
      
      public function method_278() : uint
      {
         return this.var_211;
      }
      
      private function method_2294(param1:int) : void
      {
         var _loc2_:name_2546 = null;
         this.var_2221 = Math.ceil((this.var_211 - param1) / 1000);
         if(this.var_2221 <= 0)
         {
            this.method_2291(false);
         }
         else
         {
            for each(_loc2_ in this.method_2290(name_2546))
            {
               _loc2_.method_2294(this);
            }
         }
      }
      
      private function method_2290(param1:Class) : Vector.<Object>
      {
         var _loc2_:Vector.<Object> = this.var_2220[param1];
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return const_53;
      }
      
      private function method_2295() : void
      {
         if(var_2219.length == 0)
         {
            var_1522 = setInterval(method_2293,1000);
         }
         var_2219.push(this);
      }
      
      private function method_2292() : void
      {
         var _loc1_:Number = var_2219.indexOf(this);
         if(_loc1_ == -1)
         {
            return;
         }
         var_2219.splice(_loc1_,1);
         if(var_2219.length == 0)
         {
            clearInterval(var_1522);
         }
      }
      
      public function close() : void
      {
         this.destroy();
      }
   }
}
