package package_355
{
   import package_13.Long;
   
   public class name_1688
   {
       
      
      private var _data:Object;
      
      private var var_21:Long;
      
      public function name_1688(param1:Object = null, param2:Long = null)
      {
         super();
         this._data = param1;
         this.var_21 = param2;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function get id() : Long
      {
         return this.var_21;
      }
      
      public function set id(param1:Long) : void
      {
         this.var_21 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ModelData [";
         _loc1_ += "data = " + this.data + " ";
         _loc1_ += "id = " + this.id + " ";
         return _loc1_ + "]";
      }
   }
}
