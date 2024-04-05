package package_88
{
   import package_41.Vector3dData;
   
   public class name_695
   {
       
      
      private var _position:Vector3dData;
      
      private var var_1408:String;
      
      private var var_1409:Vector3dData;
      
      public function name_695(param1:Vector3dData = null, param2:String = null, param3:Vector3dData = null)
      {
         super();
         this._position = param1;
         this.var_1408 = param2;
         this.var_1409 = param3;
      }
      
      public function get position() : Vector3dData
      {
         return this._position;
      }
      
      public function set position(param1:Vector3dData) : void
      {
         this._position = param1;
      }
      
      public function get regionType() : String
      {
         return this.var_1408;
      }
      
      public function set regionType(param1:String) : void
      {
         this.var_1408 = param1;
      }
      
      public function get rotation() : Vector3dData
      {
         return this.var_1409;
      }
      
      public function set rotation(param1:Vector3dData) : void
      {
         this.var_1409 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BonusRegionData [";
         _loc1_ += "position = " + this.position + " ";
         _loc1_ += "regionType = " + this.regionType + " ";
         _loc1_ += "rotation = " + this.rotation + " ";
         return _loc1_ + "]";
      }
   }
}
