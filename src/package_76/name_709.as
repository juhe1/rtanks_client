package package_76
{
   import package_242.name_662;
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public class name_709 implements name_658
   {
      
      private static var var_1406:name_662;
      
      private static var var_1405:name_662;
      
      private static var time1:name_662;
      
      private static var time2:name_662;
      
      private static var m:Matrix3 = new Matrix3();
      
      private static var m1:Matrix3 = new Matrix3();
       
      
      private var var_1404:Vector3;
      
      private var var_1407:Vector3;
      
      private var power:Number;
      
      private var t:Number;
      
      private var state:int;
      
      public function name_709()
      {
         this.var_1404 = new Vector3();
         this.var_1407 = new Vector3();
         super();
      }
      
      public static function name_725() : void
      {
         var_1406 = new name_662("hitcam_ampl",50,-1000,1000);
         var_1405 = new name_662("hitcam_sway",-0.05,-10,10);
         time1 = new name_662("hitcam_time1",0.1,0,10);
         time2 = new name_662("hitcam_time2",0.5,0,10);
      }
      
      public function init(param1:Vector3, param2:Number) : void
      {
         this.var_1404.vCopy(param1);
         this.power = param2;
         this.var_1407.reset(this.var_1404.y,-this.var_1404.x,0).vNormalize();
         this.t = 0;
         this.state = 0;
      }
      
      public function update(param1:int, param2:int, param3:Vector3, param4:Vector3) : Boolean
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         this.t += param2 * 0.001;
         switch(this.state)
         {
            case 0:
               if(this.t > time1.value)
               {
                  this.t = time1.value;
                  this.state = 1;
               }
               _loc5_ = Math.sin(Math.PI / 2 / time1.value * this.t);
               break;
            case 1:
               if(this.t > time2.value)
               {
                  this.t = time2.value;
                  this.state = 2;
               }
               _loc6_ = Math.PI / (time2.value - time1.value);
               _loc7_ = Math.PI * time1.value / (time1.value - time2.value);
               _loc5_ = 0.5 * (1 + Math.cos(_loc6_ * this.t + _loc7_));
               break;
            case 2:
               return false;
         }
         param3.vAddScaled(_loc5_ * var_1406.value * this.power,this.var_1404);
         m.name_932(param4.x,param4.y,param4.z);
         m1.name_1097(this.var_1407,_loc5_ * var_1405.value * this.power);
         m.append(m1);
         m.name_182(param4);
         return true;
      }
      
      public function method_1616(param1:name_733) : void
      {
      }
      
      public function destroy() : void
      {
      }
   }
}
