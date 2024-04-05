package package_225
{
   import package_275.name_865;
   
   public class name_1901
   {
       
      
      private var var_269:Vector.<name_865>;
      
      public function name_1901(param1:Vector.<name_865> = null)
      {
         super();
         this.var_269 = param1;
      }
      
      public function get flags() : Vector.<name_865>
      {
         return this.var_269;
      }
      
      public function set flags(param1:Vector.<name_865>) : void
      {
         this.var_269 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ForeignClanCC [";
         _loc1_ += "flags = " + this.flags + " ";
         return _loc1_ + "]";
      }
   }
}
