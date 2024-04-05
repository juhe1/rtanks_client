package package_215
{
   import fl.data.DataProvider;
   import package_13.Long;
   
   public class ClanMembersDataProvider extends DataProvider
   {
       
      
      private var var_1168:Function;
      
      public function ClanMembersDataProvider()
      {
         super();
      }
      
      public function name_1938(param1:Long) : int
      {
         var _loc2_:Object = null;
         var _loc3_:int = int(length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.getItemAt(_loc4_);
            if(_loc2_ && _loc2_.hasOwnProperty("id") && _loc2_["id"] == param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public function get getItemAtHandler() : Function
      {
         return this.var_1168;
      }
      
      public function set getItemAtHandler(param1:Function) : void
      {
         this.var_1168 = param1;
      }
      
      override public function getItemAt(param1:uint) : Object
      {
         var _loc2_:Object = super.getItemAt(param1);
         if(this.getItemAtHandler != null)
         {
            this.getItemAtHandler(_loc2_);
         }
         return _loc2_;
      }
   }
}
