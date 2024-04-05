package package_99
{
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.utils.getTimer;
   import package_242.name_662;
   import package_242.name_679;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_76.name_658;
   import package_76.name_733;
   
   public class name_1505 implements name_658
   {
      
      private static var var_1406:name_662;
      
      private static var var_2339:name_662;
      
      private static var var_2338:name_662;
      
      private static var duration:name_679;
      
      private static var m1:Matrix3 = new Matrix3();
      
      private static var m2:Matrix3 = new Matrix3();
      
      private static var axis:Vector3 = new Vector3();
       
      
      private var method_613:int;
      
      private var time:int;
      
      private var tank:Tank;
      
      public function name_1505()
      {
         super();
      }
      
      public static function name_725() : void
      {
         var_1406 = new name_662("minecam_ampl",0,-10000,10000);
         var_2339 = new name_662("minecam_yaw",-0.02,-10,10);
         var_2338 = new name_662("minecam_roll",0.03,-10,10);
         duration = new name_679("minecam_time",800,0,10000);
      }
      
      public function update(param1:int, param2:int, param3:Vector3, param4:Vector3) : Boolean
      {
         if(param1 - this.time > duration.value)
         {
            return false;
         }
         return true;
      }
      
      public function method_1616(param1:name_733) : void
      {
         this.time = getTimer();
         this.method_613 = 1;
         this.tank = param1.name_670();
      }
      
      public function destroy() : void
      {
         axis = null;
      }
   }
}
