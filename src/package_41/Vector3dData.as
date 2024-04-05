package package_41
{
   import package_37.Vector3;
   
   public class Vector3dData
   {
       
      
      public var x:Number;
      
      public var y:Number;
      
      public var z:Number;
      
      public function Vector3dData(param1:Number, param2:Number, param3:Number)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.z = param3;
      }
      
      public function toVector3() : Vector3
      {
         return new Vector3(this.x,this.y,this.z);
      }
      
      public function toString() : String
      {
         return "Vector3d(" + this.x + " , " + this.y + " , " + this.z + ")";
      }
   }
}
