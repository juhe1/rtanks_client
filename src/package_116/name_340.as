package package_116
{
   public class name_340
   {
       
      
      private var _index:int;
      
      private var var_931:String;
      
      private var var_23:String;
      
      public function name_340(param1:int = 0, param2:String = null, param3:String = null)
      {
         super();
         this._index = param1;
         this.var_931 = param2;
         this.var_23 = param3;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function set index(param1:int) : void
      {
         this._index = param1;
      }
      
      public function get mode() : String
      {
         return this.var_931;
      }
      
      public function set mode(param1:String) : void
      {
         this.var_931 = param1;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
      
      public function set name(param1:String) : void
      {
         this.var_23 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "EquipmentConstraintsModeInfo [";
         _loc1_ += "index = " + this.index + " ";
         _loc1_ += "mode = " + this.mode + " ";
         _loc1_ += "name = " + this.name + " ";
         return _loc1_ + "]";
      }
   }
}
