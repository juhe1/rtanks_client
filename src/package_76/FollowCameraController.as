package package_76
{
   import alternativa.engine3d.core.EllipsoidCollider;
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.service.settings.name_108;
   import alternativa.tanks.service.settings.name_1086;
   import alternativa.tanks.utils.name_75;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import package_12.name_24;
   import package_242.name_662;
   import package_32.class_2;
   import package_32.name_1090;
   import package_32.name_1093;
   import package_32.name_245;
   import package_33.GameActionEnum;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_95.name_298;
   
   public class FollowCameraController implements name_733, name_1090, name_1093, class_2
   {
      
      public static const name_964:int = 0;
      
      public static const name_1088:int = 1;
      
      private static var var_652:int = 0;
      
      private static var var_658:Number = 0;
      
      private static const const_434:Number = 0.7;
      
      public static var settings:name_108;
      
      public static var storageService:name_298;
      
      public static var display:name_24;
      
      public static var battleInputService:name_245;
      
      private static const const_436:Number = 0.001;
      
      private static const const_435:Number = 0.08726646259971647;
      
      private static const const_439:Number = 50;
      
      private static const const_440:Number = 5;
      
      private static const const_437:Number = 3;
      
      private static const const_441:Number = 9;
      
      private static const collisionPoint:Vector3 = new Vector3();
      
      private static const var_325:Vector3 = new Vector3();
      
      private static const rayOrigin3D:Vector3D = new Vector3D();
      
      private static const const_427:Vector3D = new Vector3D();
      
      private static const collisionPoint3D:Vector3D = new Vector3D();
      
      private static const const_425:Vector3D = new Vector3D();
      
      private static const const_430:Matrix3 = new Matrix3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const const_431:Vector3 = new Vector3();
      
      private static var var_665:name_662 = new name_662("cam_maxmove",5,0,5);
      
      public static var var_655:Number = 10;
      
      public static var var_651:Number = Math.PI / 180;
      
      public static var var_653:Number = 10;
      
      private static const const_433:Number = 0.17453292519943295;
      
      private static const const_432:Number = 1;
      
      private static const const_438:Number = 300;
      
      private static const const_428:Vector3 = new Vector3();
      
      private static const const_429:Vector3 = new Vector3();
      
      private static const var_47:Vector3 = new Vector3();
      
      private static const const_424:Vector3 = new Vector3();
      
      private static const const_426:Vector3 = new Vector3();
       
      
      private var var_669:Boolean;
      
      public var var_671:Boolean;
      
      private var var_667:Number = 0;
      
      private var locked:Boolean;
      
      private var var_654:Boolean;
      
      private var var_657:Boolean;
      
      private var active:Boolean;
      
      private var target:Tank;
      
      private var position:Vector3;
      
      private var rotation:Vector3;
      
      private var var_664:Vector3;
      
      private var var_656:Vector3;
      
      private var var_666:Number = 0;
      
      private var var_662:Number = 0;
      
      private var var_659:Number = 0;
      
      private var var_650:name_1379;
      
      private var var_663:Number;
      
      private var var_661:Number = 0;
      
      private var var_142:Point;
      
      private var point0:Point;
      
      private var point1:Point;
      
      private var point2:Point;
      
      private var point3:Point;
      
      private var var_668:EllipsoidCollider;
      
      private var var_670:Object3D;
      
      private var var_649:int;
      
      private var var_660:Number = 0;
      
      public function FollowCameraController()
      {
         this.position = new Vector3();
         this.rotation = new Vector3();
         this.var_664 = new Vector3();
         this.var_656 = new Vector3();
         this.var_650 = new name_1379();
         this.var_142 = new Point();
         super();
         this.point0 = new Point(145,545);
         this.point1 = new Point(930,1395);
         this.point2 = new Point(2245,1565);
         this.point3 = new Point(3105,760);
         this.var_668 = new EllipsoidCollider(50,50,50);
         var _loc1_:Number = Number(storageService.getStorage().data["cameraT"]);
         if(isNaN(_loc1_))
         {
            _loc1_ = 0.2;
         }
         this.method_915(_loc1_);
      }
      
      public static function name_944() : int
      {
         return var_652;
      }
      
      public static function name_1157(param1:int) : void
      {
         var_652 = param1;
      }
      
      public static function name_949() : Number
      {
         return var_658;
      }
      
      public static function name_1158(param1:Number) : void
      {
         var_658 = param1;
      }
      
      private static function method_920(param1:Vector3, param2:Vector3D) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      private static function method_916(param1:Number) : Number
      {
         return var_665.value * param1;
      }
      
      private static function method_911(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         var _loc6_:Number = 3 * (param3 - param2);
         var _loc7_:Number = 3 * param2 - 6 * param3 + 3 * param4;
         var _loc8_:Number = -param2 + 3 * param3 - 3 * param4 + param5;
         return param2 + param1 * _loc6_ + param1 * param1 * _loc7_ + param1 * param1 * param1 * _loc8_;
      }
      
      private function method_913(param1:SettingsServiceEvent = null) : void
      {
         if(param1 == null || param1.name_1383() == name_1086.name_1381)
         {
            this.var_669 = !settings.alternateCamera;
         }
      }
      
      public function name_764(param1:Object3D) : void
      {
         this.var_670 = param1;
      }
      
      public function name_758(param1:Tank) : void
      {
         this.target = param1;
      }
      
      public function name_670() : Tank
      {
         return this.target;
      }
      
      public function name_749(param1:Vector3, param2:Vector3) : void
      {
         this.var_664.copy(param1);
         this.var_656.copy(param2);
         this.method_912(param1,param2,this.var_650);
         this.position.copy(this.var_650.position);
         this.rotation.x = this.method_914(this.var_650) - 0.5 * Math.PI;
         this.rotation.y = 0;
         this.rotation.z = Math.atan2(-param2.x,param2.y);
      }
      
      public function activate(param1:name_735) : void
      {
         if(!this.active)
         {
            this.active = true;
            this.method_913();
            settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.method_913);
            param1.name_962(this.position);
            param1.name_1382(this.rotation);
            battleInputService.name_219(this);
            battleInputService.method_602(this);
            battleInputService.method_601(this);
         }
      }
      
      public function deactivate() : void
      {
         if(this.active)
         {
            this.active = false;
            battleInputService.name_150(this);
            battleInputService.method_600(this);
            battleInputService.method_599(this);
            settings.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.method_913);
            storageService.getStorage().data["cameraT"] = this.var_661;
            this.var_654 = false;
            this.var_657 = false;
         }
      }
      
      public function update(param1:name_735, param2:int, param3:int) : void
      {
         var _loc4_:Number = param3 * 0.001;
         if(_loc4_ > 0.1)
         {
            _loc4_ = 0.1;
         }
         this.method_921(_loc4_);
         if(!this.locked && this.target != null)
         {
            this.target.method_487(this.var_664,this.var_656);
         }
         this.method_912(this.var_664,this.var_656,this.var_650);
         const_426.vDiff(this.var_650.position,this.position);
         var _loc5_:Number = const_426.length();
         if(_loc5_ > var_655)
         {
            this.var_666 = method_916(_loc5_ - var_655);
         }
         var _loc6_:Number = this.var_666 * _loc4_;
         if(_loc6_ > _loc5_)
         {
            _loc6_ = _loc5_;
         }
         const_426.normalize().scale(_loc6_);
         var _loc7_:Number = this.method_914(this.var_650);
         var _loc8_:Number = Math.atan2(-this.var_656.x,this.var_656.y);
         var _loc9_:Number = name_75.method_612(this.rotation.x + 0.5 * Math.PI);
         var _loc10_:Number = name_75.method_612(this.rotation.z);
         var _loc11_:Number = name_75.method_612(_loc7_ - _loc9_);
         this.var_662 = this.method_919(_loc11_,this.var_662);
         var _loc12_:Number = this.var_662 * _loc4_;
         if(_loc11_ > 0 && _loc12_ > _loc11_ || _loc11_ < 0 && _loc12_ < _loc11_)
         {
            _loc12_ = _loc11_;
         }
         var _loc13_:Number = name_75.method_612(_loc8_ - _loc10_);
         this.var_659 = this.method_919(_loc13_,this.var_659);
         var _loc14_:Number = this.var_659 * _loc4_;
         if(_loc13_ > 0 && _loc14_ > _loc13_ || _loc13_ < 0 && _loc14_ < _loc13_)
         {
            _loc14_ = _loc13_;
         }
         this.var_666 = name_75.method_608(this.var_666,0,var_653);
         this.var_662 = name_75.method_608(this.var_662,0,var_653);
         this.var_659 = name_75.method_608(this.var_659,0,var_653);
         this.position.add(const_426);
         this.rotation.x += _loc12_;
         this.rotation.y = name_75.method_609(this.rotation.y,0,_loc4_);
         this.rotation.z += _loc14_;
         const_428.copy(this.position);
         const_429.copy(this.rotation);
         param1.name_731(const_428);
         param1.method_454(const_429);
      }
      
      public function name_666(param1:Boolean) : void
      {
         this.locked = param1;
         if(param1)
         {
            this.var_649 = 0;
         }
      }
      
      private function method_915(param1:Number) : void
      {
         this.var_661 = name_75.method_218(param1,0,1);
         var _loc2_:Number = name_75.method_218(this.var_661 + this.var_660 * 0.1,0,1);
         this.var_142.x = method_911(_loc2_,this.point0.x,this.point1.x,this.point2.x,this.point3.x);
         this.var_142.y = method_911(_loc2_,this.point0.y,this.point1.y,this.point2.y,this.point3.y);
         this.var_663 = Math.atan2(this.var_142.x,this.var_142.y);
         this.var_667 = this.var_142.length;
      }
      
      public function name_730(param1:Vector3, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         this.method_912(param1,param2,this.var_650);
         param4.x = this.method_914(this.var_650) - 0.5 * Math.PI;
         param4.z = Math.atan2(-param2.x,param2.y);
         param3.copy(this.var_650.position);
      }
      
      private function method_912(param1:Vector3, param2:Vector3, param3:name_1379) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         _loc4_ = this.var_663;
         var _loc6_:Number = Math.sqrt(param2.x * param2.x + param2.y * param2.y);
         if(_loc6_ < 0.00001)
         {
            const_424.x = 1;
            const_424.y = 0;
         }
         else
         {
            const_424.x = param2.x / _loc6_;
            const_424.y = param2.y / _loc6_;
         }
         param3.name_1380 = 0;
         param3.t = 1;
         var_47.copy(param1);
         axis.x = const_424.y;
         axis.y = -const_424.x;
         const_424.reverse();
         const_430.name_1097(axis,-_loc4_);
         const_430.name_890(const_424,const_431);
         this.method_917(var_47,const_431,this.var_667,collisionPoint);
         var _loc7_:Number = var_325.copy(var_47).vRemove(collisionPoint).length();
         param3.t = _loc7_ / this.var_667;
         if(_loc7_ < 300)
         {
            var_47.copy(collisionPoint);
            _loc5_ = 300 - _loc7_;
            this.method_917(var_47,Vector3.Z_AXIS,_loc5_,collisionPoint);
         }
         param3.position.copy(collisionPoint);
      }
      
      private function method_917(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : void
      {
         var _loc5_:Number = NaN;
         method_920(param1,rayOrigin3D);
         const_427.x = param3 * param2.x;
         const_427.y = param3 * param2.y;
         const_427.z = param3 * param2.z;
         if(this.var_668.getCollision(rayOrigin3D,const_427,collisionPoint3D,const_425,this.var_670))
         {
            _loc5_ = 50 + 0.1;
            param4.x = collisionPoint3D.x + _loc5_ * const_425.x;
            param4.y = collisionPoint3D.y + _loc5_ * const_425.y;
            param4.z = collisionPoint3D.z + _loc5_ * const_425.z;
         }
         else
         {
            param4.copy(param1).addScaled(param3,param2);
         }
      }
      
      private function method_921(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(this.var_649 < 0)
         {
            this.var_654 = true;
            this.var_657 = false;
            ++this.var_649;
            if(this.var_649 == 0)
            {
               this.var_654 = false;
            }
         }
         else if(this.var_649 > 0)
         {
            this.var_654 = false;
            this.var_657 = true;
            --this.var_649;
            if(this.var_649 == 0)
            {
               this.var_657 = false;
            }
         }
         if(!this.var_671 && this.var_654 != this.var_657)
         {
            _loc2_ = this.var_654 ? int(1) : int(-1);
            this.method_915(this.var_661 + _loc2_ * 0.7 * param1);
         }
         else
         {
            this.method_915(this.var_661);
         }
      }
      
      private function method_919(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = var_652 == 0 ? Number(3) : Number(9);
         if(param1 < -var_651)
         {
            return _loc3_ * (param1 + var_651);
         }
         if(param1 > var_651)
         {
            return _loc3_ * (param1 - var_651);
         }
         return param2;
      }
      
      private function method_914(param1:name_1379) : Number
      {
         var _loc2_:Number = this.var_663 - 0.17453292519943295;
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         var _loc3_:Number = param1.t;
         if(_loc3_ >= 1 || _loc2_ < 0.08726646259971647 || !this.var_669)
         {
            return param1.name_1380 - _loc2_;
         }
         var _loc4_:Number = this.var_142.x;
         return param1.name_1380 - Math.atan2(_loc3_ * _loc4_,1 * _loc4_ * (1 / Math.tan(_loc2_) - (1 - _loc3_) / Math.tan(this.var_663)));
      }
      
      public function method_689(param1:Number, param2:Number) : void
      {
         if(!this.locked)
         {
            this.var_660 += param2 * 0.001 * this.method_918();
            this.var_660 = name_75.method_218(this.var_660,-1,1);
         }
      }
      
      public function onMouseWheel(param1:int) : void
      {
         var _loc2_:Boolean = false;
         param1 *= this.method_918();
         if(!this.locked)
         {
            _loc2_ = false;
            if(param1 > 1)
            {
               if(this.var_649 < 0)
               {
                  this.var_649 = 0;
               }
               _loc2_ = true;
            }
            if(param1 < 1)
            {
               if(this.var_649 > 0)
               {
                  this.var_649 = 0;
               }
               _loc2_ = true;
            }
            if(_loc2_)
            {
               this.var_649 = param1 * 2;
            }
         }
      }
      
      public function method_28(param1:GameActionEnum, param2:Boolean) : void
      {
         switch(param1)
         {
            case GameActionEnum.FOLLOW_CAMERA_UP:
               this.var_654 = param2;
               break;
            case GameActionEnum.FOLLOW_CAMERA_DOWN:
               this.var_657 = param2;
         }
      }
      
      private function method_918() : int
      {
         return !!settings.mouseYInverse ? int(-1) : int(1);
      }
   }
}
