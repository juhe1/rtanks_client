package package_71
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_1194;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.sfx.name_1716;
   import alternativa.tanks.sfx.name_2500;
   import alternativa.tanks.sfx.name_657;
   import alternativa.tanks.utils.Colorizer;
   import alternativa.tanks.utils.SetControllerForTemporaryItems;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.utils.Dictionary;
   import package_238.ObjectPool;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class LaserPointerEffect implements name_657, AutoClosable
   {
      
      private static const const_1839:Class = name_2501;
      
      public static var name_1330:BitmapData = new const_1839().bitmapData;
      
      public static var battleService:IBattleField = OSGi.getInstance().getService(IBattleField) as IBattleField;
      
      private static const const_1838:Dictionary = new Dictionary();
      
      private static const const_1840:int = 0;
      
      private static const const_1849:int = 1;
      
      private static const const_1844:int = 2;
      
      private static const const_1845:int = 3;
      
      private static const const_377:int = 4;
      
      private static const const_1841:int = 200;
      
      private static const const_1846:Number = 100000;
      
      private static const const_1850:Number = 200;
      
      private static const const_415:Number = 2.2;
      
      private static const const_1851:Number = 0.333;
      
      private static const const_1842:Number = 30;
      
      private static const const_1843:Number = 10;
      
      private static const const_1848:Number = 0.001;
      
      private static const const_1847:Number = 1;
       
      
      private const const_1837:Vector3 = new Vector3();
      
      private const const_1836:Vector3 = new Vector3();
      
      private const direction:Vector3 = new Vector3();
      
      private var visible:Boolean;
      
      private var state:int;
      
      private var time:int;
      
      private var fadeInTimeMs:int;
      
      private var turret:Object3D;
      
      private var laser:Laser;
      
      private var var_170:name_175;
      
      private var var_2175:name_1716;
      
      private var var_2171:Sprite3D;
      
      private var var_2174:Number;
      
      private var var_2172:Number;
      
      private var var_2177:Number;
      
      private var var_2173:Tank;
      
      private var var_2176:Vector3;
      
      private var var_2098:SetControllerForTemporaryItems;
      
      private var const_394:Dictionary;
      
      public function LaserPointerEffect(param1:int, param2:Tank)
      {
         this.var_2176 = new Vector3();
         super();
         this.fadeInTimeMs = param1;
         this.reset(param2);
      }
      
      public function show(param1:uint) : void
      {
         this.visible = true;
         this.state = 0;
         this.var_2172 = 0;
         this.var_2177 = 1;
         this.laser.alpha = 0;
         this.laser.visible = false;
         this.laser.init(param1);
         this.var_2171.alpha = 0;
         this.var_2171.visible = false;
         this.var_2171.material = Colorizer.name_2502(const_1838,param1,name_1330);
         if(this.var_170 == null)
         {
            battleService.name_217(this);
         }
      }
      
      public function reset(param1:Tank) : void
      {
         this.laser = new Laser();
         this.var_2171 = new Sprite3D(30,30);
         this.var_2171.useShadowMap = false;
         this.var_2171.useLight = false;
         this.var_2171.blendMode = BlendMode.ADD;
         this.var_2171.sorting = Sorting.DYNAMIC_BSP;
         this.var_2171.shadowMapAlphaThreshold = 2;
         this.var_2171.depthMapAlphaThreshold = 2;
         this.turret = param1.skin.name_144();
         var _loc2_:ObjectPool = BattlefieldModel(battleService).getObjectPool();
         this.var_2175 = name_1716(_loc2_.getObject(name_1716));
         this.var_2175.init(this.turret,param1.method_457());
         this.const_394 = BattlefieldModel(battleService).getBattlefieldData().viewport.getExcludedObjects();
         this.var_2098 = new SetControllerForTemporaryItems(this.const_394);
      }
      
      public function name_1416() : void
      {
         this.visible = true;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.laser);
         param1.addChild(this.var_2171);
      }
      
      public function method_877(param1:Number) : Boolean
      {
         if(this.state == 0 || this.var_2173 != null || Math.abs(this.var_2174 - param1) > 0.001)
         {
            this.method_2230();
            this.var_2174 = param1;
            this.var_2173 = null;
            return true;
         }
         return false;
      }
      
      public function method_875(param1:Tank, param2:Vector3) : Boolean
      {
         this.method_2230();
         if(this.var_2173 != param1 || param2.distanceToSquared(this.var_2176) > 1)
         {
            this.var_2173 = param1;
            this.var_2176.copy(param2);
            return true;
         }
         return false;
      }
      
      private function method_2230() : void
      {
         if(this.state == 0)
         {
            this.time = 0;
            this.state = 1;
         }
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         var _loc3_:Number = NaN;
         _loc3_ = NaN;
         this.method_1230(param1);
         if(this.state == 4)
         {
            return false;
         }
         if(this.state == 0)
         {
            this.laser.alpha = 0;
            this.laser.visible = false;
            this.var_2171.alpha = 0;
            this.var_2171.visible = false;
            return true;
         }
         this.var_2175.name_2315(this.laser,param2,param1);
         this.const_1837.x = this.laser.x;
         this.const_1837.y = this.laser.y;
         this.const_1837.z = this.laser.z;
         this.method_2232();
         _loc3_ = Vector3.distanceBetween(this.const_1837,this.const_1836);
         this.laser.update(param1,_loc3_);
         this.laser.visible = _loc3_ >= 200;
         this.var_2171.x = this.const_1836.x;
         this.var_2171.y = this.const_1836.y;
         this.var_2171.z = this.const_1836.z;
         this.var_2171.visible = _loc3_ < 100000;
         name_2500.name_2503(this.laser,this.const_1837,this.direction,param2.pos);
         return true;
      }
      
      private function method_2232() : void
      {
         var _loc1_:Matrix3 = BattleUtils.name_1331;
         _loc1_.name_1333(this.turret);
         var _loc2_:Vector3 = BattleUtils.var_351;
         _loc1_.name_1418(_loc2_);
         if(this.var_2173 != null)
         {
            this.const_1836.copy(this.var_2176);
            BattleUtils.localToGlobal(this.var_2173 as Body,this.const_1836);
            this.direction.vDiff(this.const_1836,this.const_1837).normalize();
            this.var_2174 = _loc2_.vDot(this.direction);
         }
         if(Math.abs(this.var_2174 - this.var_2172) > 0.001)
         {
            this.var_2172 += 0.333 * (this.var_2174 - this.var_2172);
            this.var_2177 = Math.sqrt(1 - this.var_2172 * this.var_2172);
         }
         this.direction.copy(_loc2_);
         this.direction.scale(this.var_2172);
         _loc1_.method_1844(_loc2_);
         this.direction.addScaled(this.var_2177,_loc2_);
         this.method_2233();
      }
      
      private function method_1230(param1:int) : void
      {
         var _loc2_:Number = 0;
         switch(this.state)
         {
            case 1:
               _loc2_ = this.method_2231(param1,2,this.fadeInTimeMs);
               break;
            case 3:
               _loc2_ = 1 - this.method_2231(param1,4,200);
               break;
            default:
               return;
         }
         var _loc3_:Number = Math.pow(_loc2_,2.2);
         this.laser.alpha = _loc3_;
         this.var_2171.alpha = _loc3_;
      }
      
      private function method_2231(param1:int, param2:int, param3:int) : Number
      {
         this.time += param1;
         if(this.time >= param3)
         {
            this.state = param2;
            this.time = param3;
         }
         return this.time / param3;
      }
      
      private function method_2233() : void
      {
         var _loc1_:RayIntersectionData = null;
         var _loc2_:Object3D = null;
         this.var_2098.name_2470(this.turret);
         while(true)
         {
            _loc1_ = BattlefieldModel(battleService).raycast(this.const_1837,this.direction,this.const_394);
            if(_loc1_ == null)
            {
               break;
            }
            _loc2_ = _loc1_.object;
            if(_loc2_.name == name_1194.name_252 || _loc2_.name == name_1194.name_1201)
            {
               this.const_1836.vCopy(this.const_1837);
               this.const_1836.vAddScaled(_loc1_.time - 10,this.direction);
               this.var_2098.name_2471();
               return;
            }
            this.var_2098.name_2470(_loc1_.object);
         }
         this.var_2098.name_2471();
         this.const_1836.vCopy(this.const_1837);
         this.const_1836.vAddScaled(100000,this.direction);
      }
      
      public function hide() : void
      {
         this.visible = false;
         if(Boolean(this.var_170))
         {
            this.state = 3;
            this.time = 0;
         }
         else
         {
            this.kill();
         }
      }
      
      public function method_213() : Boolean
      {
         return this.visible;
      }
      
      public function destroy() : void
      {
         this.kill();
      }
      
      public function close() : void
      {
         this.kill();
         this.var_2175.destroy();
         this.var_2175 = null;
         this.turret = null;
         this.laser = null;
         this.var_2171 = null;
         this.const_394 = null;
         this.var_2098 = null;
      }
      
      public function kill() : void
      {
         if(Boolean(this.var_170))
         {
            this.var_170.removeChild(this.laser);
            this.var_170.removeChild(this.var_2171);
            this.var_170 = null;
            this.laser.close();
            this.var_2171.material = null;
            this.state = 4;
         }
         else
         {
            this.state = 0;
         }
         this.var_2173 = null;
         this.var_2176.reset();
         this.var_2174 = 0;
         this.var_2172 = 0;
         this.var_2177 = 1;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
   }
}
