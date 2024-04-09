package alternativa.tanks.models.weapon.shared
{
   import alternativa.physics.collision.name_1083;
   import alternativa.physics.Body;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_61.RayHit;
   import package_92.name_1699;
   
   public class CommonTargetSystem
   {
      
      private static const const_1998:int = 16;
      
      private static var matrix:Matrix3 = new Matrix3();
      
      private static var rayDir1:Vector3 = new Vector3();
      
      private static var rayDir2:Vector3 = new Vector3();
      
      private static var var_711:RayHit = new RayHit();
       
      
      private var maxDistance:Number;
      
      private var var_2435:Number;
      
      private var name_1628:int;
      
      private var var_2434:Number;
      
      private var name_1622:int;
      
      private var name_247:name_1083;
      
      private var var_689:name_1709;
      
      private var var_2433:Number;
      
      private var var_2432:Body;
      
      private var var_2430:Number;
      
      private var var_722:Vector3;
      
      private var normal:Vector3;
      
      private var var_2431:GunPredicate;
      
      private var var_2436:Vector3;
      
      private var var_1012:Vector3;
      
      public function CommonTargetSystem(param1:Number, param2:Number, param3:int, param4:Number, param5:int, param6:name_1083, param7:name_1709)
      {
         this.var_722 = new Vector3();
         this.normal = new Vector3();
         this.var_2431 = new GunPredicate();
         this.var_2436 = new Vector3();
         this.var_1012 = new Vector3();
         super();
         this.maxDistance = param1;
         this.var_2435 = param2;
         this.name_1628 = param3;
         this.var_2434 = param4;
         this.name_1622 = param5;
         this.name_247 = param6;
         this.var_689 = param7;
      }
      
      public function name_670(param1:Vector3, param2:Vector3, param3:Vector3, param4:Body, param5:name_1699) : Boolean
      {
         var _loc6_:Body = null;
         this.var_2433 = 0;
         this.var_2430 = this.maxDistance + 1;
         this.var_2432 = null;
         this.var_2431.shooter = param4;
         if(this.name_247.raycast(param1,param2,16,this.maxDistance,this.var_2431,var_711))
         {
            this.normal.vCopy(var_711.normal);
            this.var_722.vCopy(param2);
            this.var_2430 = var_711.t;
            _loc6_ = var_711.var_81.name_787;
            if(_loc6_.tank != null)
            {
               this.var_2432 = _loc6_;
               this.var_2433 = this.var_689.method_960(_loc6_,this.var_2430,0);
            }
         }
         if(this.name_1628 > 0)
         {
            this.method_2466(param1,param2,param3,this.name_1628,this.var_2435 / this.name_1628);
         }
         if(this.name_1622 > 0)
         {
            this.method_2466(param1,param2,param3,this.name_1622,-this.var_2434 / this.name_1622);
         }
         this.var_2431.shooter = null;
         if(this.var_2430 <= this.maxDistance)
         {
            param5.distance = this.var_2430;
            param5.normal.vCopy(this.normal);
            param5.direction.vCopy(this.var_722);
            param5.position.vCopy(param1).vAddScaled(this.var_2430,this.var_722);
            param5.name_787 = this.var_2432;
            this.var_2432 = null;
            return true;
         }
         return false;
      }
      
      private function method_2466(param1:Vector3, param2:Vector3, param3:Vector3, param4:int, param5:Number) : void
      {
         var _loc8_:Body = null;
         var _loc9_:Number = NaN;
         matrix.name_1097(param3,param5);
         if(param5 < 0)
         {
            param5 = -param5;
         }
         rayDir2.vCopy(param2);
         var _loc6_:Number = 0;
         var _loc7_:int = 1;
         while(_loc7_ <= param4)
         {
            _loc6_ += param5;
            rayDir1.vCopy(rayDir2);
            matrix.name_890(rayDir1,rayDir2);
            if(this.name_247.raycast(param1,rayDir2,16,this.maxDistance,this.var_2431,var_711))
            {
               _loc8_ = var_711.var_81.name_787;
               if(!(_loc8_ == null || _loc8_.tank == null))
               {
                  _loc9_ = Number(this.var_689.method_960(_loc8_,var_711.t,_loc6_));
                  if(_loc9_ > this.var_2433)
                  {
                     this.var_2433 = _loc9_;
                     this.var_2432 = _loc8_;
                     this.var_722.vCopy(rayDir2);
                     this.var_2430 = var_711.t;
                  }
               }
            }
            _loc7_++;
         }
      }
   }
}

import alternativa.physics.collision.name_1160;
import alternativa.physics.Body;

class GunPredicate implements name_1160
{
    
   
   public var shooter:Body;
   
   public function GunPredicate()
   {
      super();
   }
   
   public function considerBody(param1:Body) : Boolean
   {
      return this.shooter != param1;
   }
}
