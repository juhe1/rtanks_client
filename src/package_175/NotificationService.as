package package_175
{
   import package_324.Signal;
   
   public class NotificationService implements name_539
   {
       
      
      private var var_1133:Array;
      
      private var var_1132:name_1832;
      
      public function NotificationService()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.var_1133 = [];
         this.method_1376();
      }
      
      private function method_1376() : void
      {
         this.method_1373();
      }
      
      public function addNotification(param1:name_1832, param2:Boolean = false) : void
      {
         if(param2)
         {
            this.var_1133.unshift(param1);
         }
         else
         {
            this.var_1133.push(param1);
         }
         this.method_1373();
      }
      
      private function method_1373() : void
      {
         var _loc1_:Signal = null;
         if(this.method_1374())
         {
            this.var_1132 = this.var_1133.shift();
            _loc1_ = new Signal();
            _loc1_.name_1861(this.method_1375);
            this.var_1132.show(_loc1_);
         }
      }
      
      private function method_1374() : Boolean
      {
         return this.var_1132 == null && this.var_1133.length != 0;
      }
      
      private function method_1375() : void
      {
         this.var_1132 = null;
         this.method_1373();
      }
      
      public function method_1308(param1:String, param2:String) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:name_1832 = null;
         if(this.method_1377(param1,param2))
         {
            return true;
         }
         var _loc5_:int = int(this.var_1133.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = this.var_1133[_loc6_];
            if(_loc4_.userId == param1 && _loc4_.message == param2)
            {
               _loc3_ = true;
               break;
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      private function method_1377(param1:String, param2:String) : Boolean
      {
         return this.var_1132 != null && this.var_1132.userId == param1 && this.var_1132.message == param2;
      }
      
      public function method_354() : void
      {
         if(Boolean(this.var_1132))
         {
            this.var_1132 = null;
         }
         this.var_1133.length = 0;
      }
   }
}
