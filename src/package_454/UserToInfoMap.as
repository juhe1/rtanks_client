package package_454
{
   import flash.utils.Dictionary;
   import package_13.Long;
   import package_490.name_3622;
   
   public class UserToInfoMap
   {
       
      
      private var var_3681:*;
      
      public function UserToInfoMap()
      {
         this.var_3681 = new Dictionary();
         super();
      }
      
      public function name_1237(param1:name_3622) : void
      {
         this.var_3681[param1.user] = param1;
      }
      
      public function name_1621(param1:Long) : name_3622
      {
         return name_3622(this.var_3681[param1]);
      }
      
      public function remove(param1:Long) : void
      {
         delete this.var_3681[param1];
      }
      
      public function method_3290() : *
      {
         var _loc1_:name_3622 = null;
         for each(_loc1_ in this.var_3681)
         {
            _loc1_.score = 0;
         }
      }
   }
}
