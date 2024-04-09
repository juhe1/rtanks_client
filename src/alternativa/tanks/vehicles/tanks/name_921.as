package alternativa.tanks.vehicles.tanks
{
   import alternativa.physics.name_888;
   import alternativa.tanks.utils.MathUtils;
   import package_277.name_904;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_42.name_73;
   
   public class name_921
   {
      
      private static const const_61:name_888 = new name_888(0,1);
      
      private static const const_60:name_888 = new name_888(0,0.2);
       
      
      public function name_921()
      {
         super();
      }
      
      public static function name_945(param1:Vector3, param2:Number, param3:TankBody) : void
      {
         var _loc28_:Vector3 = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = param2 - 10;
         var _loc7_:Number = param1.y;
         var _loc8_:Number = _loc6_ / 2;
         var _loc9_:Number = 1 - (1 - 0.82) * (1 - 0.82) * _loc7_ * _loc7_ / (_loc8_ * _loc8_);
         if(_loc9_ > 0)
         {
            _loc9_ = Math.sqrt(_loc9_);
         }
         else
         {
            _loc9_ = 1 - (1 - 0.82) * _loc7_ / _loc8_;
         }
         var _loc10_:Number = (0.82 - 1) * _loc7_ / ((1 + _loc9_) * _loc8_);
         var _loc11_:Number = _loc9_ * _loc8_ - _loc10_ * _loc7_;
         var _loc12_:Number = (1 - 0.82) * _loc7_ / ((1 + _loc9_) * _loc8_);
         var _loc13_:Number = (1 - _loc9_) * _loc8_ / ((1 - 0.82) * _loc7_);
         if(MathUtils.method_603(_loc12_,_loc13_,0.00001) || _loc12_ < _loc13_)
         {
            _loc4_ = 0.82 * _loc7_;
            _loc5_ = _loc10_ * _loc4_ + _loc11_;
         }
         else
         {
            _loc4_ = (1 - _loc9_) * _loc8_ / _loc10_ + _loc7_;
            _loc5_ = _loc8_;
         }
         var _loc14_:Number = _loc5_ - _loc9_ * _loc8_;
         var _loc15_:Number = _loc7_ - _loc4_;
         var _loc16_:Number = Math.sqrt(_loc14_ * _loc14_ + _loc15_ * _loc15_) / 2;
         _loc14_ = (1 + _loc9_) * _loc8_;
         _loc15_ = (1 - 0.82) * _loc7_;
         var _loc17_:Number = Math.sqrt(_loc14_ * _loc14_ + _loc15_ * _loc15_) / 2;
         var _loc18_:name_904 = new name_904(new Vector3(param1.x,_loc16_,_loc17_),name_73.name_252,const_60);
         var _loc19_:Matrix4 = new Matrix4();
         var _loc20_:Number = Math.atan(_loc12_);
         _loc19_.name_932(-_loc20_,0,0);
         var _loc21_:Number = 0.82 * _loc7_ + _loc17_ * Math.sin(_loc20_) - _loc16_ * Math.cos(_loc20_);
         var _loc22_:Number = -_loc8_ + _loc17_ * Math.cos(_loc20_) + _loc16_ * Math.sin(_loc20_) - (param1.z - _loc6_ / 2);
         _loc19_.name_731(new Vector3(0,_loc21_,_loc22_));
         param3.name_787.method_443(_loc18_,_loc19_);
         param3.name_1174.push(_loc18_);
         _loc18_ = new name_904(new Vector3(param1.x,_loc16_,_loc17_),name_73.name_252,const_60);
         _loc19_.name_932(_loc20_,0,0);
         _loc19_.name_731(new Vector3(0,-_loc21_,_loc22_));
         param3.name_787.method_443(_loc18_,_loc19_);
         param3.name_1174.push(_loc18_);
         var _loc23_:Number = param2 * 3 / 4;
         var _loc24_:Vector3 = new Vector3(param1.x,param1.y * 0.82,_loc23_ / 2);
         var _loc25_:Matrix4 = new Matrix4();
         _loc25_.m23 = _loc24_.z - param1.z;
         var _loc26_:name_904 = new name_904(_loc24_,name_73.name_252,const_60);
         param3.name_787.method_443(_loc26_,_loc25_);
         param3.name_1174.push(_loc26_);
         var _loc27_:Number = param2 * 3 / 4;
         _loc28_ = new Vector3(param1.x,param1.y * 0.82,_loc27_ / 2);
         var _loc29_:Matrix4 = new Matrix4();
         _loc29_.m23 = param2 - _loc28_.z - param1.z;
         var _loc30_:name_904 = new name_904(_loc28_,name_73.name_252,const_61);
         param3.name_787.method_443(_loc30_,_loc29_);
         param3.name_1174.push(_loc30_);
      }
      
      public static function method_1872(param1:Vector3, param2:Number, param3:TankBody) : void
      {
         var _loc4_:Vector3 = new Vector3(param1.x,param1.y,param2 / 2);
         var _loc5_:name_904 = new name_904(_loc4_,0,const_60);
         var _loc6_:Matrix4 = new Matrix4();
         _loc6_.m23 = param2 / 2 - param1.z;
         param3.name_787.method_443(_loc5_,_loc6_);
         param3.name_908 = _loc5_;
      }
   }
}
