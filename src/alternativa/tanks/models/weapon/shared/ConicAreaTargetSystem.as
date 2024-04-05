package alternativa.tanks.models.weapon.shared
{
   import alternativa.physics.collision.name_1083;
   import alternativa.physics.name_660;
   import flash.utils.Dictionary;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_61.name_124;
   
   public class ConicAreaTargetSystem
   {
      
      private static const collisionGroup:int = 16;
      
      private static const const_114:Vector3 = new Vector3();
       
      
      private var range:Number;
      
      private var var_2441:Number;
      
      private var name_2092:int;
      
      private var var_2440:int;
      
      private var name_247:name_1083;
      
      private var var_1056:name_1742;
      
      private var var_1012:Vector3;
      
      private var matrix:Matrix3;
      
      private var const_430:Matrix3;
      
      private var var_711:name_124;
      
      private var var_2431:GunPredicate;
      
      private var var_2436:Vector3;
      
      private var var_2439:Vector3;
      
      private var var_2437:Dictionary;
      
      private var var_2438:Dictionary;
      
      public function ConicAreaTargetSystem(param1:Number, param2:Number, param3:int, param4:int, param5:name_1083, param6:name_1742)
      {
         this.var_1012 = new Vector3();
         this.matrix = new Matrix3();
         this.const_430 = new Matrix3();
         this.var_711 = new name_124();
         this.var_2431 = new GunPredicate();
         this.var_2436 = new Vector3();
         this.var_2439 = new Vector3();
         super();
         this.range = param1;
         this.var_2441 = 0.5 * param2;
         this.name_2092 = param3;
         this.var_2440 = param4;
         this.name_247 = param5;
         this.var_1056 = param6;
      }
      
      public function name_1705(param1:name_660, param2:Number, param3:Number, param4:Vector3, param5:Vector3, param6:Vector3, param7:Array, param8:Array, param9:Array) : void
      {
         var _loc15_:* = undefined;
         var _loc16_:Number = NaN;
         this.var_2431.shooter = param1;
         this.var_2437 = new Dictionary();
         this.var_2438 = new Dictionary();
         var _loc10_:Number = param3 * param2;
         var _loc11_:Number = param2 - _loc10_;
         if(this.name_247.raycast(param4,param5,16,param2,this.var_2431,this.var_711))
         {
            if(this.var_711.var_81.name_787 == null || this.var_711.var_81.name_787.tank == null)
            {
               return;
            }
         }
         this.var_1012.vCopy(param6);
         this.var_2439.vCopy(param4).vAddScaled(_loc10_,param5);
         this.range += _loc11_;
         this.method_2467(this.var_2439,param5,this.range);
         this.const_430.name_1097(param5,Math.PI / this.var_2440);
         var _loc12_:Number = this.var_2441 / this.name_2092;
         var _loc13_:int = 0;
         while(_loc13_ < this.var_2440)
         {
            this.method_2468(this.var_2439,param5,this.var_1012,this.name_2092,_loc12_);
            this.method_2468(this.var_2439,param5,this.var_1012,this.name_2092,-_loc12_);
            this.var_1012.vTransformBy3(this.const_430);
            _loc13_++;
         }
         var _loc14_:int = 0;
         for(_loc15_ in this.var_2437)
         {
            param7[_loc14_] = _loc15_;
            _loc16_ = this.var_2437[_loc15_] - _loc11_;
            if(_loc16_ < 0)
            {
               _loc16_ = 0;
            }
            param8[_loc14_] = _loc16_;
            param9[_loc14_] = this.var_2438[_loc15_];
            _loc14_++;
         }
         param7.length = _loc14_;
         param8.length = _loc14_;
         param9.length = _loc14_;
         this.var_2431.shooter = null;
         this.var_2431.clearInvalidTargets();
         this.var_2437 = null;
         this.var_2438 = null;
      }
      
      private function method_2468(param1:Vector3, param2:Vector3, param3:Vector3, param4:int, param5:Number) : void
      {
         var _loc6_:Number = 0;
         var _loc7_:int = 0;
         while(_loc7_ < param4)
         {
            _loc6_ += param5;
            this.matrix.name_1097(param3,_loc6_);
            this.matrix.name_890(param2,this.var_2436);
            this.method_2467(param1,this.var_2436,this.range);
            _loc7_++;
         }
      }
      
      private function method_2467(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         var _loc5_:name_660 = null;
         var _loc6_:Number = NaN;
         const_114.vCopy(param1);
         var _loc4_:Number = 0;
         while(param3 > 0.1)
         {
            if(!this.name_247.raycast(const_114,param2,16,param3,this.var_2431,this.var_711))
            {
               break;
            }
            _loc5_ = this.var_711.var_81.name_787;
            if(_loc5_ == null || _loc5_.tank == null)
            {
               break;
            }
            const_114.vAddScaled(this.var_711.t,param2);
            _loc4_ += this.var_711.t;
            if(this.var_1056.name_2686(_loc5_))
            {
               this.var_2431.addTarget(_loc5_);
               _loc6_ = Number(this.var_2437[_loc5_]);
               if(isNaN(_loc6_) || _loc6_ > _loc4_)
               {
                  this.var_2437[_loc5_] = _loc4_;
               }
               this.var_2438[_loc5_] += this.var_711.position.clone();
            }
            else
            {
               this.var_2431.addInvalidTarget(_loc5_);
            }
            param3 -= this.var_711.t;
         }
         this.var_2431.clearTargets();
      }
   }
}

import alternativa.physics.collision.name_1160;
import alternativa.physics.name_660;
import flash.utils.Dictionary;

class GunPredicate implements name_1160
{
    
   
   public var shooter:name_660;
   
   private var targets:Dictionary;
   
   private var invalidTargets:Dictionary;
   
   public function GunPredicate()
   {
      this.targets = new Dictionary();
      this.invalidTargets = new Dictionary();
      super();
   }
   
   public function considerBody(param1:name_660) : Boolean
   {
      return this.shooter != param1 && this.targets[param1] == null && this.invalidTargets[param1] == null;
   }
   
   public function addTarget(param1:name_660) : void
   {
      this.targets[param1] = true;
   }
   
   public function addInvalidTarget(param1:name_660) : void
   {
      this.invalidTargets[param1] = true;
   }
   
   public function clearTargets() : void
   {
      var _loc1_:* = undefined;
      for(_loc1_ in this.targets)
      {
         delete this.targets[_loc1_];
      }
   }
   
   public function clearInvalidTargets() : void
   {
      var _loc1_:* = undefined;
      for(_loc1_ in this.invalidTargets)
      {
         delete this.invalidTargets[_loc1_];
      }
   }
}
