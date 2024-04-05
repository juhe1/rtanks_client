package package_217
{
   public class name_1910
   {
       
      
      private var var_1219:Vector.<name_351>;
      
      public function name_1910(param1:Vector.<name_351> = null)
      {
         super();
         this.var_1219 = param1;
      }
      
      public function get users() : Vector.<name_351>
      {
         return this.var_1219;
      }
      
      public function set users(param1:Vector.<name_351>) : void
      {
         this.var_1219 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClanMembersCC [";
         _loc1_ += "users = " + this.users + " ";
         return _loc1_ + "]";
      }
   }
}
