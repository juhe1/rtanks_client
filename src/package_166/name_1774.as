package package_166
{
   import flash.utils.getTimer;
   import package_242.name_662;
   import package_37.Vector3;
   import package_76.name_658;
   import package_76.name_733;
   
   public class name_1774 implements name_658
   {
      
      private static var var_1406:name_662;
      
      private static var var_2502:name_662;
       
      
      public var var_2503:int;
      
      private var startTime:int;
      
      public function name_1774()
      {
         super();
      }
      
      public static function name_725() : void
      {
         var_1406 = new name_662("healcam_ampl",2,0,1000);
         var_2502 = new name_662("healcam_freq",25,0,1000);
      }
      
      public function update(param1:int, param2:int, param3:Vector3, param4:Vector3) : Boolean
      {
         if(this.var_2503 <= 0)
         {
            return false;
         }
         var _loc5_:Number = 0.001 * (param1 - this.startTime);
         param3.z += var_1406.value * Math.sin(var_2502.value * _loc5_);
         return true;
      }
      
      public function method_1616(param1:name_733) : void
      {
         this.startTime = getTimer();
      }
      
      public function destroy() : void
      {
      }
   }
}
