package package_130
{
   import package_13.Long;
   
   public class name_348
   {
       
      
      private var var_934:String;
      
      private var var_933:String;
      
      private var var_937:int;
      
      private var var_936:String;
      
      private var var_21:Long;
      
      private var var_935:String;
      
      public function name_348(param1:String = null, param2:String = null, param3:int = 0, param4:String = null, param5:Long = null, param6:String = null)
      {
         super();
         this.var_934 = param1;
         this.var_933 = param2;
         this.var_937 = param3;
         this.var_936 = param4;
         this.var_21 = param5;
         this.var_935 = param6;
      }
      
      public function get dateInSeconds() : String
      {
         return this.var_934;
      }
      
      public function set dateInSeconds(param1:String) : void
      {
         this.var_934 = param1;
      }
      
      public function get description() : String
      {
         return this.var_933;
      }
      
      public function set description(param1:String) : void
      {
         this.var_933 = param1;
      }
      
      public function get endDate() : int
      {
         return this.var_937;
      }
      
      public function set endDate(param1:int) : void
      {
         this.var_937 = param1;
      }
      
      public function get header() : String
      {
         return this.var_936;
      }
      
      public function set header(param1:String) : void
      {
         this.var_936 = param1;
      }
      
      public function get id() : Long
      {
         return this.var_21;
      }
      
      public function set id(param1:Long) : void
      {
         this.var_21 = param1;
      }
      
      public function get imageUrl() : String
      {
         return this.var_935;
      }
      
      public function set imageUrl(param1:String) : void
      {
         this.var_935 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "NewsItemData [";
         _loc1_ += "dateInSeconds = " + this.dateInSeconds + " ";
         _loc1_ += "description = " + this.description + " ";
         _loc1_ += "endDate = " + this.endDate + " ";
         _loc1_ += "header = " + this.header + " ";
         _loc1_ += "id = " + this.id + " ";
         _loc1_ += "imageUrl = " + this.imageUrl + " ";
         return _loc1_ + "]";
      }
   }
}
