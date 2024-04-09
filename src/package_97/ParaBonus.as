package package_97
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.physics.collision.class_44;
   import alternativa.physics.collision.CollisionPrimitive;
   import alternativa.physics.name_886;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.sfx.name_1464;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.geom.ColorTransform;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_241.class_14;
   import package_241.name_1459;
   import package_241.name_659;
   import package_249.name_1430;
   import package_324.Signal;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_61.RayHit;
   import package_68.name_175;
   import package_74.name_272;
   
   public class ParaBonus implements name_659, class_44
   {
      
      public static var lightingService:name_272;
      
      private static const const_480:Number = 10000000000;
      
      private static const const_490:Number = 20;
      
      private static const const_474:Number = 75;
      
      private static const const_477:Number = 10;
      
      private static const const_485:Number = 180;
      
      private static const const_471:Number = 400;
      
      private static const const_488:int = 2000;
      
      private static const const_473:int = 300;
      
      private static const const_476:int = 1700;
      
      private static const const_479:int = 204;
      
      private static const const_465:Number = Number(204) / 300;
      
      private static const const_464:Number = Number(204) / (2000 - 300);
      
      private static const const_470:Number = 300;
      
      private static const const_482:Number = 2;
      
      private static const const_484:int = 1;
      
      private static const const_475:int = 2;
      
      private static const const_483:int = 3;
      
      private static const const_487:int = 8000;
      
      private static const const_489:int = 2000;
      
      private static const const_472:int = 500;
      
      private static const const_481:Number = 0.5;
      
      private static const const_478:Number = 0.5;
      
      private static const const_486:Number = 10;
      
      private static const const_469:name_886 = new name_886();
      
      private static var var_739:Dictionary = new Dictionary();
      
      private static var var_325:Vector3 = new Vector3();
      
      private static const const_372:RayHit = new RayHit();
      
      private static const N:Vector3 = new Vector3();
      
      private static const P:Vector3 = new Vector3();
      
      private static const P1:Vector3 = new Vector3();
      
      private static const X:Vector3 = new Vector3();
      
      private static const Y:Vector3 = new Vector3();
      
      private static const Y1:Vector3 = new Vector3();
      
      private static const const_114:Vector3 = new Vector3();
      
      private static const m:Matrix3 = new Matrix3();
      
      private static const m1:Matrix3 = new Matrix3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const const_64:Vector3 = new Vector3();
      
      private static const const_417:Vector3 = new Vector3();
       
      
      private var var_746:String;
      
      private var var_734:int;
      
      private var var_747:class_14;
      
      public var parachute:name_1461;
      
      public var var_735:Cords;
      
      private var var_750:int;
      
      private var var_758:int;
      
      private var var_757:int;
      
      private var var_736:int;
      
      private var var_738:int;
      
      private var var_737:int;
      
      private var var_759:Number;
      
      private var var_742:int;
      
      private var pool:Pool;
      
      public var skin:BonusMesh;
      
      public var var_609:OmniLight;
      
      private var var_749:name_1430;
      
      private var var_752:Mesh;
      
      private var var_756:Mesh;
      
      private var var_753:Mesh;
      
      private var var_754:Material;
      
      private var var_745:Number = 150;
      
      private var var_751:int = 3;
      
      private var var_755:int = 3;
      
      private var var_741:name_1472;
      
      private var var_740:name_1470;
      
      private var var_744:Boolean;
      
      public var var_743:name_1474;
      
      private var battleService:BattlefieldModel;
      
      private var data:name_1469;
      
      public const const_467:Signal = new Signal();
      
      public const const_466:Signal = new Signal();
      
      public const const_468:Signal = new Signal();
      
      private var var_748:Number;
      
      public function ParaBonus(param1:Pool, param2:name_1469)
      {
         super();
         this.pool = param1;
         this.data = param2;
         this.var_752 = param2.name_1483;
         this.var_756 = param2.name_1489;
         this.var_753 = param2.name_1480;
         this.var_754 = param2.name_1486;
         this.var_741 = new name_1472(this);
         this.var_740 = new name_1470(this);
         this.var_609 = new OmniLight(0,0,0);
         this.var_743 = new name_1474(this);
         this.battleService = BattlefieldModel(Main.osgi.getService(IBattleField));
      }
      
      public static function create(param1:name_1469) : ParaBonus
      {
         var _loc2_:Pool = var_739[param1];
         if(_loc2_ == null)
         {
            _loc2_ = new Pool();
            var_739[param1] = _loc2_;
         }
         if(_loc2_.numObjects == 0)
         {
            return new ParaBonus(_loc2_,param1);
         }
         var _loc3_:ParaBonus = _loc2_.objects[--_loc2_.numObjects];
         _loc2_.objects[_loc2_.numObjects] = null;
         return _loc3_;
      }
      
      public static function method_1023(param1:name_1469) : void
      {
         delete var_739[param1];
      }
      
      private static function method_864(param1:Vector3) : Boolean
      {
         return param1.z > name_1460.name_1479;
      }
      
      private function method_1020(param1:Vector3) : Boolean
      {
         var _loc2_:TanksCollisionDetector = this.battleService.var_117.name_247;
         return _loc2_.method_695(param1,Vector3.Z_AXIS,name_73.name_252,10000000000);
      }
      
      public function init(param1:String, param2:int, param3:Boolean) : void
      {
         this.var_746 = param1;
         if(BonusCache.name_1488(this.name_693))
         {
            this.skin = new BonusMesh(this.var_746,this.var_752);
         }
         else
         {
            this.skin = BonusCache.name_1481(this.var_746);
         }
         this.var_748 = lightingService.method_879();
         this.var_609.color = this.data.lightColor;
         this.var_609.attenuationBegin = this.data.attenuationBegin;
         this.var_609.attenuationEnd = this.data.attenuationEnd;
         this.var_609.intensity = this.data.name_1475 * this.var_748;
         this.var_609.calculateBounds();
         this.var_609.x = this.skin.x;
         this.var_609.y = this.skin.y;
         this.var_609.z = this.skin.z;
         this.battleService.var_117.viewport.name_884(this.var_609);
         this.var_749 = new name_1430(this.skin);
         this.method_1014(this.var_756,this.var_753,this.var_754);
         this.var_750 = param2 < 0 ? int(int.MAX_VALUE) : int(param2);
         this.var_734 = param3 ? int(name_1459.name_1466) : int(name_1459.name_1468);
         this.skin.alpha = 1;
         var _loc4_:ColorTransform = this.skin.colorTransform;
         if(_loc4_ != null)
         {
            _loc4_.redOffset = 0;
            _loc4_.greenOffset = 0;
            _loc4_.blueOffset = 0;
         }
         this.var_737 = 0;
         this.var_735.alpha = 1;
         this.var_757 = 0;
         this.var_736 = 2000;
         this.var_738 = 2000;
         this.var_758 = 500;
      }
      
      private function method_1018(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:TanksCollisionDetector = this.battleService.var_117.name_247;
         if(_loc4_.name_251(param1,Vector3.DOWN,name_73.name_252,10000000000,null,const_372))
         {
            param3.vCopy(const_372.normal);
            param2.vCopy(const_372.position);
         }
         else
         {
            param3.vCopy(Vector3.Z_AXIS);
            param2.vCopy(param1);
            param2.z -= 1000;
         }
      }
      
      public function get name_693() : String
      {
         return this.var_746;
      }
      
      public function name_740() : Boolean
      {
         return this.var_734 == name_1459.name_1466;
      }
      
      public function name_703(param1:Vector3) : void
      {
         param1.x = this.skin.x;
         param1.y = this.skin.y;
         param1.z = this.skin.z;
      }
      
      public function method_1017(param1:Number, param2:Number, param3:Number) : void
      {
         this.skin.x = param1;
         this.skin.y = param2;
         this.skin.z = param3;
      }
      
      public function method_1007(param1:Number, param2:Number, param3:Number) : void
      {
         this.method_1017(param1,param2,param3);
         if(this.var_734 != name_1459.name_1468)
         {
            this.var_734 = name_1459.name_1468;
            this.method_1009();
         }
      }
      
      public function name_741() : void
      {
         this.const_467.name_1473();
         this.var_736 = 2000;
         this.skin.name_1068(1);
         if(this.var_734 == name_1459.name_1466)
         {
            this.method_1009();
         }
         this.var_734 = name_1459.name_1471;
      }
      
      public function name_748() : void
      {
         this.const_466.name_1473();
         this.var_734 = name_1459.name_1477;
      }
      
      public function name_769(param1:Vector3, param2:name_175, param3:class_14, param4:Boolean) : void
      {
         var _loc8_:Boolean = false;
         var _loc9_:name_1465 = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(param2 != null)
         {
            param2.addChild(this.skin);
            this.battleService.hidableObjects.add(this.var_749);
         }
         if(this.var_734 == name_1459.name_1466)
         {
            this.var_742 = 1;
         }
         else
         {
            this.var_742 = 3;
         }
         this.var_747 = param3;
         this.method_1018(param1,P,N);
         if(this.var_734 == name_1459.name_1466)
         {
            if(method_864(N))
            {
               _loc5_ = this.method_1010(param1,P);
               P1.vCopy(P);
            }
            else
            {
               X.vCross2(N,Vector3.Z_AXIS);
               X.vNormalize();
               Y.vCross2(N,X);
               Y1.vCross2(Vector3.Z_AXIS,X);
               const_114.vCopy(param1);
               const_114.vAddScaled(-name_1460.name_1463,Y1);
               P1.vCopy(P);
               P1.vAddScaled(-name_1460.name_1463 / N.z,Y);
               if(this.battleService.var_117.name_247.name_251(const_114,Vector3.DOWN,name_73.name_252,10000000000,null,const_372))
               {
                  if(P.z < const_372.position.z && const_372.position.z < P1.z)
                  {
                     P1.vAddScaled(name_1460.name_1463 / N.z * (P1.z - const_372.position.z) / (P1.z - P.z),Y);
                  }
               }
               _loc5_ = this.method_1010(param1,P1);
               this.var_740.init(P1,N);
               this.var_744 = true;
            }
            _loc6_ = P1.z + name_1460.name_1463 + name_1460.name_1491;
            _loc7_ = this.method_1021();
            _loc8_ = this.method_1020(param1);
            if(param4 || _loc8_)
            {
               this.skin.x = P1.x;
               this.skin.y = P1.y;
               this.skin.z = P1.z + name_1460.name_1463;
               this.skin.rotationX = 0;
               this.skin.rotationY = 0;
               this.skin.rotationZ = _loc7_ + _loc5_ * name_1460.name_1490;
               this.method_1012();
               this.var_741.init(P1,this.var_745,_loc6_,-_loc5_,0,_loc7_);
               if(_loc8_)
               {
                  _loc9_ = name_1465(this.battleService.getObjectPool().getObject(name_1465));
                  _loc9_.start(this);
               }
               this.var_742 = 3;
            }
            else
            {
               this.parachute.x = param1.x;
               this.parachute.y = param1.y;
               this.parachute.z = param1.z + 0.5 * 400;
               param2.addChild(this.parachute);
               param2.addChild(this.var_735);
               this.skin.x = param1.x;
               this.skin.y = param1.y;
               this.skin.z = param1.z;
               this.skin.rotationX = 0;
               this.skin.rotationY = 0;
               this.skin.rotationZ = _loc7_;
               this.method_1012();
               this.method_1015(this.battleService);
               this.var_741.init(param1,this.var_745,_loc6_,-_loc5_,0,_loc7_);
            }
         }
         if(!_loc8_)
         {
            this.var_743.activate(this.battleService);
         }
      }
      
      private function method_1015(param1:BattlefieldModel) : void
      {
         var _loc2_:name_1467 = name_1467(param1.getObjectPool().getObject(name_1467));
         _loc2_.start(this.skin,this.var_735,this.parachute);
      }
      
      private function method_1012() : void
      {
         this.var_743.update(this.skin.x,this.skin.y,this.skin.z,this.skin.rotationX,this.skin.rotationY,this.skin.rotationZ);
      }
      
      public function method_1022() : void
      {
         this.var_744 = false;
      }
      
      private function method_1021() : Number
      {
         return Math.PI * 10 * parseInt(this.name_693.split("_")[1]) / 180;
      }
      
      private function method_1010(param1:Vector3, param2:Vector3) : Number
      {
         return (param1.z - param2.z - name_1460.name_1463) / this.var_745;
      }
      
      public function update(param1:int, param2:int, param3:Number) : Boolean
      {
         var _loc4_:int = 0;
         this.var_750 -= param2;
         this.var_609.intensity = this.var_748 * this.data.name_1475;
         this.var_609.x = this.skin.x;
         this.var_609.y = this.skin.y;
         this.var_609.z = this.skin.z;
         if(this.var_734 == name_1459.name_1466)
         {
            _loc4_ = 0;
            while(_loc4_ < this.var_751)
            {
               this.var_741.method_426(param2 / this.var_751);
               this.var_741.method_465(param3);
               this.var_741.render();
               _loc4_++;
            }
            return true;
         }
         if(this.var_734 == name_1459.name_1471)
         {
            if(this.var_736 < 0)
            {
               return false;
            }
            this.method_1019(param2);
         }
         if(this.var_734 == name_1459.name_1468 && this.var_744)
         {
            _loc4_ = 0;
            while(_loc4_ < this.var_755)
            {
               this.var_740.method_426(param2 / this.var_755);
               this.var_740.method_465(param3);
               this.var_740.render();
               _loc4_++;
            }
         }
         if(this.var_738 > 0)
         {
            this.var_738 -= param2;
            if(this.var_738 <= 0)
            {
               this.method_1011();
               this.method_1013();
            }
            else
            {
               this.var_735.name_1068(this.var_738 / 2000);
               this.parachute.name_1068(this.var_738 / 2000);
               this.parachute.z -= this.var_745 / 2000 * param2;
               this.var_735.name_1482();
            }
         }
         return this.var_734 != name_1459.REMOVED;
      }
      
      public function destroy() : void
      {
         var _loc2_:name_1462 = null;
         this.const_468.name_1473();
         this.const_467.removeAll();
         this.const_466.removeAll();
         this.const_468.removeAll();
         if(this.var_734 != name_1459.name_1471)
         {
            _loc2_ = name_1462(this.battleService.getObjectPool().getObject(name_1462));
            _loc2_.init(this.skin);
         }
         else
         {
            this.skin.alternativa3d::removeFromParent();
            this.skin.name_1336();
            this.skin = null;
         }
         var _loc1_:name_1464 = null;
         if(this.var_609.parent != null)
         {
            this.battleService.getBattlefieldData().viewport.method_280(this.var_609);
            _loc1_ = name_1464(this.battleService.getObjectPool().getObject(name_1464));
            _loc1_.init(this.var_609,1777,1 / 0.777);
            this.battleService.name_217(_loc1_);
         }
         this.battleService.hidableObjects.remove(this.var_749);
         if(this.skin != null)
         {
            this.skin = null;
         }
         this.method_1011();
         this.method_1013();
         var _loc3_:* = this.pool.numObjects++;
         this.pool.objects[_loc3_] = this;
         this.var_743.deactivate();
      }
      
      public function method_1008(param1:CollisionPrimitive) : Boolean
      {
         if(param1.name_787 is Tank)
         {
            this.method_155();
         }
         return false;
      }
      
      public function method_1025() : void
      {
         this.method_155();
         this.name_741();
         this.var_743.deactivate();
      }
      
      public function method_1024() : void
      {
         this.var_734 = name_1459.name_1468;
         this.method_1009();
         if(this.var_747 != null)
         {
            this.var_747.method_156(this);
         }
         if(this.var_744)
         {
            this.var_740.start();
         }
      }
      
      private function method_1009() : void
      {
         this.method_1016();
      }
      
      private function method_1016() : void
      {
         this.var_738 = 2000;
      }
      
      private function method_155() : void
      {
         this.var_747.method_155(this);
      }
      
      private function method_1014(param1:Mesh, param2:Mesh, param3:Material) : void
      {
         if(BonusCache.name_1492())
         {
            this.parachute = new name_1461(param1,param2);
         }
         else
         {
            this.parachute = BonusCache.name_1478();
         }
         if(BonusCache.name_1484())
         {
            this.var_735 = new Cords(name_1461.name_1476,75,name_1461.name_1485,param3);
         }
         else
         {
            this.var_735 = BonusCache.name_1487();
         }
         this.var_735.init(this.skin,this.parachute);
      }
      
      private function method_1011() : void
      {
         if(this.parachute != null)
         {
            this.parachute.alternativa3d::removeFromParent();
            this.parachute.name_1336();
            this.parachute = null;
         }
         if(this.var_735 != null)
         {
            this.var_735.alternativa3d::removeFromParent();
            this.var_735.name_1336();
            this.var_735 = null;
         }
      }
      
      private function method_1013() : void
      {
         if(this.var_742 == 2)
         {
            if(this.parachute != null)
            {
               this.parachute = null;
            }
            this.var_742 = 3;
         }
      }
      
      private function method_1019(param1:int) : void
      {
         var _loc2_:Number = param1 * 0.001;
         this.skin.z += (300 * this.var_736 / 2000 + 300 * 0.1) * _loc2_;
         this.skin.rotationZ += (2 * this.var_736 / 2000 + 2 * 0.1) * _loc2_;
         if(this.var_736 > 2000 - 300)
         {
            this.var_737 += const_465 * param1;
            if(this.var_737 > 204)
            {
               this.var_737 = 204;
            }
         }
         else
         {
            this.var_737 -= const_464 * param1;
            if(this.var_737 < 0)
            {
               this.var_737 = 0;
            }
         }
         if(this.var_736 < 1700)
         {
            this.skin.alpha = this.var_736 / 1700;
         }
         this.var_736 -= param1;
      }
   }
}

import package_97.ParaBonus;

class Pool
{
    
   
   public var objects:Vector.<ParaBonus>;
   
   public var numObjects:int;
   
   public function Pool()
   {
      this.objects = new Vector.<ParaBonus>();
      super();
   }
}
