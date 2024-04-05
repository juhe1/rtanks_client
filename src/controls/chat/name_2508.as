package controls.chat
{
   public class name_2508
   {
       
      
      private var var_845:int;
      
      private var var_3137:int;
      
      private var var_1557:String;
      
      private var var_913:String;
      
      private var var_3138:String;
      
      public function name_2508(param1:int = 0, param2:int = 0, param3:String = null, param4:String = null, param5:String = null)
      {
         super();
         this.var_845 = param1;
         this.var_3137 = param2;
         this.var_1557 = param3;
         this.var_3138 = param4;
         this.var_913 = param3;
      }
      
      public function get chatModeratorLevel() : int
      {
         return this.var_845;
      }
      
      public function set chatModeratorLevel(param1:int) : void
      {
         this.var_845 = param1;
      }
      
      public function get rankIndex() : int
      {
         return this.var_3137;
      }
      
      public function set rankIndex(param1:int) : void
      {
         this.var_3137 = param1;
      }
      
      public function get uid() : String
      {
         return this.var_1557;
      }
      
      public function set uid(param1:String) : void
      {
         this.var_1557 = param1;
      }
      
      public function get userId() : String
      {
         return this.var_913;
      }
      
      public function set userId(param1:String) : void
      {
         this.var_913 = param1;
      }
      
      public function get ip() : String
      {
         return this.var_3138;
      }
      
      public function set ip(param1:String) : void
      {
         this.var_3138 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "UserStatus [";
         _loc1_ += "chatModeratorLevel = " + this.chatModeratorLevel + " ";
         _loc1_ += "rankIndex = " + this.rankIndex + " ";
         _loc1_ += "uid = " + this.uid + " ";
         _loc1_ += "userId = " + this.userId + " ";
         return _loc1_ + "]";
      }
   }
}
