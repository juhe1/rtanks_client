package package_151
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.physics.collision.name_1083;
   import alternativa.physics.collision.name_1160;
   import alternativa.physics.name_660;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.models.sfx.name_1096;
   import alternativa.tanks.models.sfx.name_2710;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.weapon.name_1419;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_1070;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_2500;
   import alternativa.tanks.sfx.name_657;
   import alternativa.tanks.sfx.name_89;
   import flash.media.Sound;
   import package_1.Main;
   import package_152.name_1793;
   import package_161.name_1448;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_42.name_73;
   import package_61.name_124;
   import package_68.name_175;
   import package_76.name_735;
   
   public class RicochetShot extends class_30 implements name_657, name_1160
   {
      
      public static const const_1492:Number = 100;
      
      private static const const_2033:Number = 300;
      
      public static const name_1815:Number = 266;
      
      public static const name_1817:Number = 300;
      
      private static const const_2032:Number = 80;
      
      public static const name_1819:Number = 150;
      
      private static const const_2031:int = 100;
      
      private static const const_2026:Number = 30;
      
      private static const const_2028:int = 6;
      
      private static const const_2027:Number = 1.0471975511965976;
      
      private static var const_430:Matrix3 = new Matrix3();
      
      private static var const_369:Vector3 = new Vector3();
      
      private static var const_372:name_124 = new name_124();
      
      private static var var_1015:Vector3 = new Vector3();
      
      private static var var_2495:Vector3 = new Vector3();
      
      private static var counter:int;
       
      
      public var id:int;
      
      public var name_1764:TankData;
      
      public var name_1769:Number = 0;
      
      public var sfxData:name_1793;
      
      private var battlefield:name_83;
      
      private var var_2494:Vector.<Vector3>;
      
      private var var_2506:Vector3;
      
      private var direction:Vector3;
      
      private var listener:class_107;
      
      private var var_2508:name_1792;
      
      private var name_247:name_1083;
      
      private var sprite:AnimatedSprite3D;
      
      private var var_2497:BattlefieldModel;
      
      private var var_1014:name_1448;
      
      private var var_2185:int;
      
      private var var_2507:TailTrail;
      
      private var var_2510:Boolean;
      
      private var var_2509:name_1096;
      
      private var var_2498:name_2710;
      
      public function RicochetShot(param1:ObjectPool)
      {
         this.var_2506 = new Vector3();
         this.direction = new Vector3();
         this.var_2497 = Main.osgi.name_6(name_83) as BattlefieldModel;
         super(param1);
         this.var_2494 = new Vector.<Vector3>(6,true);
         var _loc2_:int = 0;
         while(_loc2_ < 6)
         {
            this.var_2494[_loc2_] = new Vector3();
            _loc2_++;
         }
         this.sprite = new AnimatedSprite3D(300,300);
         this.sprite.name_1432 = true;
         this.var_2507 = new TailTrail(100,300);
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:TankData, param4:name_1792, param5:name_1793, param6:name_1083, param7:name_1448, param8:class_107, param9:name_83) : void
      {
         this.var_2506.vCopy(param1);
         this.direction.vCopy(param2);
         this.name_1764 = param3;
         this.var_2508 = param4;
         this.sfxData = param5;
         this.name_247 = param6;
         this.var_1014 = param7;
         this.listener = param8;
         this.battlefield = param9;
         this.id = counter++;
         this.sprite.rotation = 2 * Math.PI * Math.random();
         var _loc10_:name_1072 = param5.name_1813;
         this.sprite.name_1433(_loc10_);
         this.sprite.name_1431(this.sprite.name_2313() * Math.random());
         this.var_2507.setMaterialToAllFaces(param5.name_1816);
         this.var_2509 = name_1096(this.var_2497.getObjectPool().getObject(name_1096));
         this.var_2498 = name_2710(this.var_2497.getObjectPool().getObject(name_2710));
         this.var_2509.init(this.var_2498,LightDataManager.name_1723(param3.turret.id),name_1096.const_1705,true);
         this.method_2495(param1,param2,param4.shotRadius);
         this.name_1769 = 0;
         this.var_2185 = 0;
         this.var_2510 = true;
      }
      
      public function name_742(param1:name_175) : void
      {
         param1.addChild(this.sprite);
         param1.addChild(this.var_2507);
         this.battlefield.name_217(this.var_2509);
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         var _loc5_:Number = NaN;
         var _loc6_:name_660 = null;
         var _loc15_:Number = NaN;
         var _loc16_:int = 0;
         var _loc17_:Vector3 = null;
         var _loc18_:Vector3 = null;
         var _loc19_:name_1070 = null;
         var _loc20_:name_1071 = null;
         var _loc21_:name_1072 = null;
         if(this.name_1769 > this.var_2508.shotDistance)
         {
            return false;
         }
         if(this.var_2510)
         {
            this.var_2510 = false;
            var_1015.x = this.var_2506.x;
            var_1015.y = this.var_2506.y;
            var_1015.z = this.var_2506.z + this.var_2508.shotRadius;
            var_2495.z = -1;
            if(this.name_247.name_251(var_1015,var_2495,name_73.name_252,this.var_2508.shotRadius,null,const_372))
            {
               return false;
            }
         }
         var _loc3_:Number = param1 / 1000;
         var _loc4_:Number = this.var_2508.shotSpeed * _loc3_;
         while(_loc4_ > 0)
         {
            _loc15_ = -1;
            _loc5_ = _loc4_;
            if(this.name_247.raycast(this.var_2506,this.direction,name_73.WEAPON,_loc4_,this,const_372))
            {
               _loc15_ = const_372.t;
               _loc6_ = const_372.var_81.name_787;
               if(_loc6_ != null && _loc6_.tank != null)
               {
                  this.listener.method_1282(this,this.var_2506,this.direction,_loc6_);
                  return false;
               }
               _loc5_ = _loc15_;
               const_369.vCopy(const_372.normal);
            }
            _loc16_ = 0;
            while(_loc16_ < 6)
            {
               _loc17_ = this.var_2494[_loc16_];
               if(this.name_247.raycast(_loc17_,this.direction,name_73.WEAPON,_loc5_,this,const_372))
               {
                  _loc6_ = const_372.var_81.name_787;
                  _loc18_ = new Vector3();
                  _loc18_.vCopy(this.var_2506).vAddScaled(const_372.t,this.direction);
                  if(_loc6_ != null && _loc6_.tank != null && !this.method_2494(this.var_2506,_loc18_))
                  {
                     this.listener.method_1282(this,this.var_2506,this.direction,_loc6_);
                     return false;
                  }
               }
               _loc17_.vAddScaled(_loc5_,this.direction);
               _loc16_++;
            }
            if(_loc15_ > -1)
            {
               ++this.var_2185;
               this.name_1769 += _loc15_;
               _loc4_ -= _loc15_;
               this.var_2506.vAddScaled(_loc15_,this.direction).vAddScaled(0.1,const_369);
               this.direction.vAddScaled(-2 * this.direction.dot(const_369),const_369);
               this.method_2495(this.var_2506,this.direction,this.var_2508.shotRadius);
               _loc19_ = name_1070(objectPool.getObject(name_1070));
               _loc20_ = name_1071(objectPool.getObject(name_1071));
               _loc20_.init(this.var_2506,50);
               _loc21_ = this.sfxData.name_1814;
               _loc19_.init(80,80,_loc21_,Math.random() * Math.PI * 2,_loc20_,0.5,0.5);
               this.battlefield.name_217(_loc19_);
               this.method_1286(this.sfxData.ricochetSound,this.var_2506,name_89.name_191,name_89.name_229,name_89.name_250,0.8);
               this.method_2501(this.var_2506,this.name_1764.turret);
            }
            else
            {
               this.name_1769 += _loc4_;
               this.var_2506.vAddScaled(_loc4_,this.direction);
               _loc4_ = 0;
            }
         }
         this.sprite.x = this.var_2506.x;
         this.sprite.y = this.var_2506.y;
         this.sprite.z = this.var_2506.z;
         this.sprite.update(_loc3_);
         var _loc7_:Number = Number(this.var_1014.name_1458(this.name_1764.turret,0.01 * this.name_1769));
         var _loc8_:Number = 300 * _loc7_;
         this.sprite.width = _loc8_;
         this.sprite.height = _loc8_;
         this.sprite.rotation -= 0.003 * param1;
         var _loc9_:Vector3 = param2.pos;
         name_2500.name_2503(this.var_2507,this.var_2506,this.direction,param2.pos);
         var _loc10_:Number = this.var_2506.x - _loc9_.x;
         var _loc11_:Number = this.var_2506.y - _loc9_.y;
         var _loc12_:Number = this.var_2506.z - _loc9_.z;
         var _loc13_:Number = _loc10_ * _loc10_ + _loc11_ * _loc11_ + _loc12_ * _loc12_;
         if(_loc13_ > 0.00001)
         {
            _loc13_ = 1 / Math.sqrt(_loc13_);
            _loc10_ *= _loc13_;
            _loc11_ *= _loc13_;
            _loc12_ *= _loc13_;
         }
         var _loc14_:Number = _loc10_ * this.direction.x + _loc11_ * this.direction.y + _loc12_ * this.direction.z;
         if(_loc14_ < 0)
         {
            _loc14_ = -_loc14_;
         }
         if(_loc14_ > 0.5)
         {
            this.var_2507.alpha = 2 * (1 - _loc14_) * _loc7_;
         }
         else
         {
            this.var_2507.alpha = _loc7_;
         }
         this.var_2498.name_731(this.var_2506);
         return true;
      }
      
      private function method_2501(param1:Vector3, param2:ClientObject) : void
      {
         var _loc3_:name_1096 = name_1096(this.var_2497.getObjectPool().getObject(name_1096));
         var _loc4_:name_1071 = name_1071(this.var_2497.getObjectPool().getObject(name_1071));
         _loc4_.init(param1,50);
         _loc3_.init(_loc4_,LightDataManager.name_1250(param2.id));
         this.var_2497.name_217(_loc3_);
      }
      
      private function method_2494(param1:Vector3, param2:Vector3) : Boolean
      {
         return name_1419.name_1423(param1,param2);
      }
      
      public function destroy() : void
      {
         this.sprite.alternativa3d::removeFromParent();
         this.var_2509.kill();
         this.var_2509 = null;
         this.var_2498 = null;
         this.sprite.material = null;
         this.var_2507.alternativa3d::removeFromParent();
         this.var_2507.material = null;
         this.var_2507.colorTransform = null;
         this.name_1764 = null;
         this.var_2508 = null;
         this.sfxData = null;
         this.name_247 = null;
         this.var_1014 = null;
         this.listener = null;
         this.battlefield = null;
         method_584();
      }
      
      public function kill() : void
      {
         this.name_1769 = this.var_2508.shotDistance + 1;
      }
      
      public function considerBody(param1:name_660) : Boolean
      {
         return param1 != this.name_1764.tank as name_660 || this.var_2185 > 0;
      }
      
      override protected function getClass() : Class
      {
         return RicochetShot;
      }
      
      private function method_2495(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Number = 1e+308;
         var _loc7_:Number = param2.x < 0 ? -param2.x : param2.x;
         if(_loc7_ < _loc6_)
         {
            _loc6_ = _loc7_;
            _loc5_ = 0;
         }
         _loc7_ = param2.y < 0 ? -param2.y : param2.y;
         if(_loc7_ < _loc6_)
         {
            _loc6_ = _loc7_;
            _loc5_ = 1;
         }
         _loc7_ = param2.z < 0 ? -param2.z : param2.z;
         if(_loc7_ < _loc6_)
         {
            _loc5_ = 2;
         }
         var _loc8_:Vector3 = new Vector3();
         switch(_loc5_)
         {
            case 0:
               _loc8_.x = 0;
               _loc8_.y = param2.z;
               _loc8_.z = -param2.y;
               break;
            case 1:
               _loc8_.x = -param2.z;
               _loc8_.y = 0;
               _loc8_.z = param2.x;
               break;
            case 2:
               _loc8_.x = param2.y;
               _loc8_.y = -param2.x;
               _loc8_.z = 0;
         }
         _loc8_.vNormalize().vScale(param3);
         const_430.name_1097(param2,1.0471975511965976);
         Vector3(this.var_2494[0]).vCopy(param1).vAdd(_loc8_);
         _loc4_ = 1;
         while(_loc4_ < 6)
         {
            _loc8_.vTransformBy3(const_430);
            Vector3(this.var_2494[_loc4_]).vCopy(param1).vAdd(_loc8_);
            _loc4_++;
         }
      }
      
      private function method_1286(param1:Sound, param2:Vector3, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Sound3D = null;
         var _loc8_:Sound3DEffect = null;
         if(param1 != null)
         {
            _loc7_ = Sound3D.create(param1,param3,param4,param5,param6);
            _loc8_ = Sound3DEffect.create(objectPool,null,param2,_loc7_);
            this.battlefield.name_195(_loc8_);
         }
      }
   }
}

import alternativa.tanks.models.sfx.SimplePlane;

class TailTrail extends SimplePlane
{
    
   
   public function TailTrail(param1:Number, param2:Number)
   {
      super(param1,param2,0.5,1);
      name_2709(1,1,1,0,0,0,0,1);
      shadowMapAlphaThreshold = 2;
      depthMapAlphaThreshold = 2;
      useShadowMap = false;
      useLight = false;
   }
}
