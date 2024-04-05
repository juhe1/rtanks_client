package package_132
{
   import package_103.name_323;
   
   public class name_359
   {
       
      
      private var var_910:Vector.<name_323>;
      
      public function name_359(param1:Vector.<name_323> = null)
      {
         super();
         this.var_910 = param1;
      }
      
      public function get properties() : Vector.<name_323>
      {
         return this.var_910;
      }
      
      public function set properties(param1:Vector.<name_323>) : void
      {
         this.var_910 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ItemPropertiesCC [";
         _loc1_ += "properties = " + this.properties + " ";
         return _loc1_ + "]";
      }
   }
}
