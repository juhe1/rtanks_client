package package_490
{
   import package_13.Long;
   
   public class name_3622
   {
       
      
      private var var_921:Long;
      
      private var var_275:int;
      
      private var var_3745:Boolean;
      
      private var var_363:Long;
      
      public function name_3622(param1:Long = null, param2:int = 0, param3:Boolean = false, param4:Long = null)
      {
         super();
         this.var_921 = param1;
         this.var_275 = param2;
         this.var_3745 = param3;
         this.var_363 = param4;
      }
      
      public function get clanId() : Long
      {
         return this.var_921;
      }
      
      public function set clanId(param1:Long) : void
      {
         this.var_921 = param1;
      }
      
      public function get score() : int
      {
         return this.var_275;
      }
      
      public function set score(param1:int) : void
      {
         this.var_275 = param1;
      }
      
      public function get suspicious() : Boolean
      {
         return this.var_3745;
      }
      
      public function set suspicious(param1:Boolean) : void
      {
         this.var_3745 = param1;
      }
      
      public function get user() : Long
      {
         return this.var_363;
      }
      
      public function set user(param1:Long) : void
      {
         this.var_363 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleInfoUser [";
         _loc1_ += "clanId = " + this.clanId + " ";
         _loc1_ += "score = " + this.score + " ";
         _loc1_ += "suspicious = " + this.suspicious + " ";
         _loc1_ += "user = " + this.user + " ";
         return _loc1_ + "]";
      }
   }
}
