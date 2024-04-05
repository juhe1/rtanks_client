package package_51
{
   import package_41.name_320;
   
   public class name_90
   {
       
      
      private var var_394:int;
      
      private var var_393:name_320;
      
      public function name_90(param1:int = 0, param2:name_320 = null)
      {
         super();
         this.var_394 = param1;
         this.var_393 = param2;
      }
      
      public function get resistanceInPercent() : int
      {
         return this.var_394;
      }
      
      public function set resistanceInPercent(param1:int) : void
      {
         this.var_394 = param1;
      }
      
      public function get resistanceProperty() : name_320
      {
         return this.var_393;
      }
      
      public function set resistanceProperty(param1:name_320) : void
      {
         this.var_393 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TankResistance [";
         _loc1_ += "resistanceInPercent = " + this.resistanceInPercent + " ";
         _loc1_ += "resistanceProperty = " + this.resistanceProperty + " ";
         return _loc1_ + "]";
      }
   }
}
