package package_333
{
   import alternativa.physics.collision.name_1083;
   import alternativa.physics.collision.name_1160;
   import alternativa.physics.Body;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.sfx.name_657;
   import package_161.IWeaponWeakeningModel;
   import package_301.name_2411;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_42.name_73;
   import package_61.RayHit;
   import package_68.name_175;
   import package_76.name_735;
   
   public class SnowmanShot implements name_657, name_1160
   {
      
      public static const SIZE:Number = 80;
      
      private static const const_2029:int = 20;
      
      private static var pool:Vector.<SnowmanShot> = new Vector.<SnowmanShot>(20);
      
      private static var var_2492:int = -1;
      
      private static const const_2026:Number = 30;
      
      private static const const_2028:int = 8;
      
      private static const const_2027:Number = 0.7853981633974483;
      
      private static var var_2496:Matrix3 = new Matrix3();
      
      private static var var_1015:Vector3 = new Vector3();
      
      private static var var_2495:Vector3 = new Vector3();
      
      private static var const_372:RayHit = new RayHit();
       
      
      public var shotId:int;
      
      public var active:Boolean;
      
      public var name_1764:TankData;
      
      public var name_1769:Number = 0;
      
      private var var_2494:Vector.<Vector3>;
      
      private var var_2491:Vector3;
      
      private var direction:Vector3;
      
      private var listener:class_186;
      
      private var var_3276:name_2653;
      
      private var name_247:name_1083;
      
      private var sprite:AnimatedSprite3D;
      
      private var numFrames:int;
      
      private var var_1869:Number;
      
      private var var_1014:IWeaponWeakeningModel;
      
      private var sfxData:name_2411;
      
      public function SnowmanShot()
      {
         this.var_2491 = new Vector3();
         this.direction = new Vector3();
         super();
         this.var_2494 = new Vector.<Vector3>(8);
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.var_2494[_loc1_] = new Vector3();
            _loc1_++;
         }
         this.sprite = new AnimatedSprite3D(80,80);
      }
      
      public static function name_1766() : SnowmanShot
      {
         if(var_2492 == -1)
         {
            return new SnowmanShot();
         }
         var _loc1_:SnowmanShot = pool[var_2492];
         var _loc2_:* = var_2492--;
         pool[_loc2_] = null;
         return _loc1_;
      }
      
      public function init(param1:int, param2:Boolean, param3:name_2653, param4:Vector3, param5:Vector3, param6:TankData, param7:class_186, param8:name_2411, param9:name_1083, param10:IWeaponWeakeningModel) : void
      {
         this.shotId = param1;
         this.active = param2;
         this.var_3276 = param3;
         this.var_2491.vCopy(param4);
         this.direction.vCopy(param5);
         this.name_1764 = param6;
         this.listener = param7;
         this.name_247 = param9;
         this.var_1014 = param10;
         this.sfxData = param8;
         var _loc11_:name_1072 = param8.var_3074;
         this.sprite.name_1433(_loc11_);
         this.sprite.name_1431(this.sprite.name_2313() * Math.random());
         this.sprite.rotation = 0;
         this.sprite.colorTransform = param8.colorTransform;
         this.name_1769 = 0;
         this.method_2495(param4,param5,param3.shotRadius);
      }
      
      public function name_742(param1:name_175) : void
      {
         param1.addChild(this.sprite);
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:Vector3 = null;
         if(this.name_1769 > this.var_3276.name_1767)
         {
            this.listener.method_2394(this);
            return false;
         }
         var _loc3_:Number = 0.001 * param1;
         var _loc4_:Number = this.var_3276.shotSpeed * _loc3_;
         this.name_1769 += _loc4_;
         this.sprite.update(param1);
         if(this.active)
         {
            if(this.name_247.raycast(this.var_2491,this.direction,name_73.WEAPON,_loc4_,this,const_372))
            {
               if(const_372.var_81 != null)
               {
                  this.listener.method_2393(this,const_372.position,this.direction,const_372.var_81.name_787);
               }
               return false;
            }
            _loc5_ = 0;
            while(_loc5_ < 8)
            {
               _loc6_ = this.var_2494[_loc5_];
               if(this.name_247.raycast(_loc6_,this.direction,name_73.WEAPON,_loc4_,this,const_372))
               {
                  if(const_372.var_81.name_787 != null)
                  {
                     this.listener.method_2393(this,const_372.position,this.direction,const_372.var_81.name_787);
                     return false;
                  }
               }
               _loc5_++;
            }
            var_1015.x = this.var_2491.x;
            var_1015.y = this.var_2491.y;
            var_1015.z = this.var_2491.z + this.var_3276.shotRadius;
            var_2495.z = -1;
            if(this.name_247.name_251(var_1015,var_2495,name_73.name_252,this.var_3276.shotRadius,null,const_372))
            {
               this.listener.method_2393(this,this.var_2491,this.direction,null);
               return false;
            }
         }
         var _loc7_:Number = _loc4_ * this.direction.x;
         var _loc8_:Number = _loc4_ * this.direction.y;
         var _loc9_:Number = _loc4_ * this.direction.z;
         this.var_2491.x += _loc7_;
         this.var_2491.y += _loc8_;
         this.var_2491.z += _loc9_;
         _loc5_ = 0;
         while(_loc5_ < 8)
         {
            _loc6_ = this.var_2494[_loc5_];
            _loc6_.x += _loc7_;
            _loc6_.y += _loc8_;
            _loc6_.z += _loc9_;
            _loc5_++;
         }
         var _loc10_:Number = 80 * this.var_1014.name_1458(this.name_1764.turret,0.01 * this.name_1769);
         this.sprite.width = _loc10_;
         this.sprite.height = _loc10_;
         this.sprite.x = this.var_2491.x;
         this.sprite.y = this.var_2491.y;
         this.sprite.z = this.var_2491.z;
         this.sprite.rotation -= 0.003 * param1;
         return true;
      }
      
      public function destroy() : void
      {
         this.sprite.parent.removeChild(this.sprite);
         this.var_3276 = null;
         this.listener = null;
         this.name_247 = null;
         this.name_1764 = null;
         this.var_1014 = null;
         this.sfxData = null;
         this.sprite.material = null;
         this.sprite.colorTransform = null;
         var _loc1_:* = ++var_2492;
         pool[_loc1_] = this;
      }
      
      public function kill() : void
      {
         this.name_1769 = this.var_3276.name_1767 + 1;
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.name_1764.tank != param1;
      }
      
      public function toString() : String
      {
         return "[PlasmaCharge tankId=" + this.name_1764.user.id + ", chargeId=" + this.shotId + "]";
      }
      
      private function method_2495(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Number = 1e+308;
         var _loc6_:Number = param2.x < 0 ? -param2.x : param2.x;
         if(_loc6_ < _loc5_)
         {
            _loc5_ = _loc6_;
            _loc4_ = 0;
         }
         _loc6_ = param2.y < 0 ? -param2.y : param2.y;
         if(_loc6_ < _loc5_)
         {
            _loc5_ = _loc6_;
            _loc4_ = 1;
         }
         _loc6_ = param2.z < 0 ? -param2.z : param2.z;
         if(_loc6_ < _loc5_)
         {
            _loc4_ = 2;
         }
         var _loc7_:Vector3 = new Vector3();
         switch(_loc4_)
         {
            case 0:
               _loc7_.x = 0;
               _loc7_.y = param2.z;
               _loc7_.z = -param2.y;
               break;
            case 1:
               _loc7_.x = -param2.z;
               _loc7_.y = 0;
               _loc7_.z = param2.x;
               break;
            case 2:
               _loc7_.x = param2.y;
               _loc7_.y = -param2.x;
               _loc7_.z = 0;
         }
         _loc7_.vNormalize().vScale(param3);
         var_2496.name_1097(param2,0.7853981633974483);
         Vector3(this.var_2494[0]).vCopy(param1).vAdd(_loc7_);
         var _loc8_:int = 1;
         while(_loc8_ < 8)
         {
            _loc7_.vTransformBy3(var_2496);
            Vector3(this.var_2494[_loc8_]).vCopy(param1).vAdd(_loc7_);
            _loc8_++;
         }
      }
   }
}
