package package_120
{
   public class name_350
   {
       
      
      private var userId:String;
      
      private var rankId:int;
      
      private var var_445:Boolean;
      
      private var var_806:Boolean;
      
      public function name_350(param1:String, param2:int, param3:Boolean, param4:Boolean)
      {
         super();
         this.userId = param1;
         this.rankId = param2;
         this.var_445 = param3;
         this.var_806 = param4;
      }
      
      public function get nickname() : String
      {
         return this.userId;
      }
      
      public function get rank() : int
      {
         return this.rankId;
      }
      
      public function get premium() : Boolean
      {
         return this.var_445;
      }
      
      public function get online() : Boolean
      {
         return this.var_806;
      }
   }
}
