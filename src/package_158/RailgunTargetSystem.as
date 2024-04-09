package package_158
{
   import alternativa.physics.collision.name_1083;
   import alternativa.physics.Body;
   import alternativa.tanks.models.tank.TankData;
   import flash.utils.Dictionary;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_47.BattleTeamType;
   import package_61.RayHit;
   import package_79.class_36;
   
   public class RailgunTargetSystem
   {
      
      private static const const_2034:Number = 10;
      
      private static const var_1050:Number = 0.65;
      
      private static const const_2035:Number = 20000;
      
      private static const const_1552:Number = 1000;
       
      
      private const const_1998:int = 16;
      
      private const const_1618:Number = 10000000000;
      
      private var name_247:name_1083;
      
      private var var_2518:Number;
      
      private var var_2521:int;
      
      private var var_2519:Number;
      
      private var var_2520:int;
      
      private var weakeningCoeff:Number;
      
      private var var_2110:MultybodyCollisionPredicate;
      
      private var var_711:RayHit;
      
      private var dir:Vector3;
      
      private var const_430:Matrix3;
      
      private var const_114:Vector3;
      
      private var var_325:Vector3;
      
      private var var_2522:int;
      
      private var var_2517:Number;
      
      private var var_2516:Number;
      
      private var var_2515:Array;
      
      private var var_2514:Array;
      
      private var ctfModel:class_36;
      
      private var var_690:Number;
      
      public function RailgunTargetSystem()
      {
         this.var_2110 = new MultybodyCollisionPredicate();
         this.var_711 = new RayHit();
         this.dir = new Vector3();
         this.const_430 = new Matrix3();
         this.const_114 = new Vector3();
         this.var_325 = new Vector3();
         this.var_2515 = [];
         this.var_2514 = [];
         super();
      }
      
      public function name_1804(param1:name_1083, param2:Number, param3:int, param4:Number, param5:int, param6:Number, param7:class_36) : void
      {
         this.name_247 = param1;
         this.var_2518 = param2 / param3;
         this.var_2521 = param3;
         this.var_2519 = param4 / param5;
         this.var_2520 = param5;
         this.weakeningCoeff = param6;
         this.ctfModel = param7;
         this.var_690 = param2 > param4 ? param2 : param4;
      }
      
      public function name_1705(param1:TankData, param2:Vector3, param3:Vector3, param4:Vector3, param5:Dictionary, param6:name_1801) : void
      {
         param6.targets.length = 0;
         param6.hitPoints.length = 0;
         this.var_2516 = 0;
         this.var_2522 = 10000;
         this.var_2517 = 0;
         this.method_2506(param1,param2,param3,param4,param5,param6);
         if(this.var_2516 == 0)
         {
            this.method_2505(param1,param2,param3,param5,param6);
         }
         this.var_2110.bodies = null;
         this.var_2514.length = 0;
         this.var_2515.length = 0;
      }
      
      private function method_2506(param1:TankData, param2:Vector3, param3:Vector3, param4:Vector3, param5:Dictionary, param6:name_1801) : void
      {
         var _loc7_:int = 0;
         this.method_2502(param2,param3,0,0,param1,param5,param6);
         this.const_430.name_1097(param4,this.var_2518);
         this.dir.vCopy(param3);
         var _loc8_:Number = 0;
         _loc7_ = 1;
         while(_loc7_ <= this.var_2521)
         {
            _loc8_ += this.var_2518;
            this.dir.vTransformBy3(this.const_430);
            this.method_2502(param2,this.dir,_loc8_,_loc7_,param1,param5,param6);
            _loc7_++;
         }
         this.const_430.name_1097(param4,-this.var_2519);
         this.dir.vCopy(param3);
         _loc8_ = 0;
         _loc7_ = 1;
         while(_loc7_ <= this.var_2520)
         {
            _loc8_ += this.var_2519;
            this.dir.vTransformBy3(this.const_430);
            this.method_2502(param2,this.dir,_loc8_,_loc7_,param1,param5,param6);
            _loc7_++;
         }
      }
      
      private function method_2502(param1:Vector3, param2:Vector3, param3:Number, param4:int, param5:TankData, param6:Dictionary, param7:name_1801) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         this.var_2515.length = 0;
         this.var_2514.length = 0;
         var _loc8_:Number = this.method_2504(param1,param2,param5,param6,this.var_2515,this.var_2514);
         if(_loc8_ > 0)
         {
            _loc9_ = this.var_325.diff(this.var_2514[0],param1).vLength();
            _loc10_ = this.method_2503(param3,_loc9_);
            if(_loc8_ > this.var_2516 || _loc8_ == this.var_2516 && _loc10_ > this.var_2517)
            {
               this.var_2516 = _loc8_;
               this.var_2522 = param4;
               this.var_2517 = _loc10_;
               param7.dir.vCopy(param2);
               _loc11_ = int(this.var_2515.length);
               _loc12_ = 0;
               while(_loc12_ < _loc11_)
               {
                  param7.targets[_loc12_] = this.var_2515[_loc12_];
                  param7.hitPoints[_loc12_] = this.var_2514[_loc12_];
                  _loc12_++;
               }
               param7.targets.length = _loc11_;
               if(this.var_2514.length > _loc11_)
               {
                  param7.hitPoints[_loc11_] = this.var_2514[_loc11_];
                  param7.hitPoints.length = _loc11_ + 1;
               }
               else
               {
                  param7.hitPoints.length = _loc11_;
               }
            }
         }
      }
      
      private function method_2504(param1:Vector3, param2:Vector3, param3:TankData, param4:Dictionary, param5:Array, param6:Array) : Number
      {
         var _loc10_:Body = null;
         var _loc11_:TankData = null;
         var _loc12_:Boolean = false;
         this.var_2110.bodies = new Dictionary();
         this.var_2110.bodies[param3.tank] = true;
         this.const_114.vCopy(param1);
         var _loc7_:Number = 0;
         var _loc8_:Number = 1;
         var _loc9_:Boolean = true;
         while(this.name_247.raycast(this.const_114,param2,16,10000000000,this.var_2110,this.var_711))
         {
            _loc10_ = this.var_711.var_81.name_787;
            if(_loc10_.tank == null)
            {
               param6.push(this.var_711.position.vClone());
               break;
            }
            _loc11_ = param4[_loc10_];
            if(_loc11_ != null)
            {
               _loc12_ = param3.teamType == BattleTeamType.NONE || param3.teamType != _loc11_.teamType;
               if(_loc9_)
               {
                  if(_loc11_.health > 0 && !_loc12_)
                  {
                     return 0;
                  }
                  _loc9_ = false;
               }
               if(_loc11_.health > 0)
               {
                  if(_loc12_)
                  {
                     if(this.ctfModel != null && Boolean(this.ctfModel.method_804(_loc11_)))
                     {
                        _loc7_ += 10 * _loc8_;
                     }
                     else
                     {
                        _loc7_ += _loc8_;
                     }
                  }
                  else
                  {
                     _loc7_ -= _loc8_;
                  }
               }
               _loc8_ *= this.weakeningCoeff;
               param5.push(_loc11_);
               param6.push(this.var_711.position.vClone());
            }
            this.var_2110.bodies[_loc10_] = true;
            this.const_114.vCopy(this.var_711.position);
         }
         return _loc7_;
      }
      
      private function method_2505(param1:TankData, param2:Vector3, param3:Vector3, param4:Dictionary, param5:name_1801) : void
      {
         var _loc6_:Body = null;
         var _loc7_:TankData = null;
         param5.hitPoints.length = 0;
         param5.targets.length = 0;
         param5.dir.vCopy(param3);
         this.var_2110.bodies = new Dictionary();
         this.var_2110.bodies[param1.tank] = true;
         this.const_114.vCopy(param2);
         while(this.name_247.raycast(this.const_114,param3,16,10000000000,this.var_2110,this.var_711))
         {
            _loc6_ = this.var_711.var_81.name_787;
            if(_loc6_.tank == null)
            {
               param5.hitPoints.push(this.var_711.position.vClone());
               break;
            }
            _loc7_ = param4[_loc6_];
            if(_loc7_ != null)
            {
               param5.targets.push(_loc7_);
               param5.hitPoints.push(this.var_711.position.vClone());
            }
            this.var_2110.bodies[_loc6_] = true;
            this.const_114.vCopy(this.var_711.position);
         }
      }
      
      private function method_2503(param1:Number, param2:Number) : Number
      {
         return 1000 - (0.65 * param2 / 20000 + (1 - 0.65) * param1 / this.var_690);
      }
   }
}

import alternativa.physics.collision.name_1160;
import alternativa.physics.Body;
import flash.utils.Dictionary;

class MultybodyCollisionPredicate implements name_1160
{
    
   
   public var bodies:Dictionary;
   
   public function MultybodyCollisionPredicate()
   {
      this.bodies = new Dictionary();
      super();
   }
   
   public function considerBody(param1:Body) : Boolean
   {
      return this.bodies[param1] == null;
   }
}
