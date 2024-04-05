package package_235
{
   import package_13.Long;
   
   public class name_2052
   {
       
      
      private var var_1219:Vector.<Long>;
      
      public function name_2052(param1:Vector.<Long> = null)
      {
         super();
         this.var_1219 = param1;
      }
      
      public function get users() : Vector.<Long>
      {
         return this.var_1219;
      }
      
      public function set users(param1:Vector.<Long>) : void
      {
         this.var_1219 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClanFriendsCC [";
         _loc1_ += "users = " + this.users + " ";
         return _loc1_ + "]";
      }
   }
}
