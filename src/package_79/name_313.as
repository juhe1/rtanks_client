package package_79
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.materials.Material;
   import alternativa.physics.collision.CollisionPrimitive;
   import alternativa.physics.name_888;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.display.BitmapData;
   import forms.battlelist.BattleMode;
   import package_1.Main;
   import package_249.name_1430;
   import package_270.MaterialRegistry;
   import package_277.name_904;
   import package_311.name_1307;
   import package_311.name_1312;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_47.BattleTeamType;
   import package_61.RayHit;
   import package_68.name_175;
   import package_74.name_272;
   
   public class name_313
   {
      
      public static var lightingEffectsService:name_272;
      
      public static const name_1301:Number = 80;
      
      private static const const_460:int = 95;
      
      private static const const_461:int = 400;
      
      private static const const_408:int = 128;
      
      private static const const_398:int = 256;
      
      private static var var_711:RayHit = new RayHit();
      
      private static var const_431:Vector3 = new Vector3(0,0,-20000);
      
      private static var matrix:Matrix3 = new Matrix3();
      
      private static var name_1289:Vector3 = new Vector3();
       
      
      public var teamType:BattleTeamType;
      
      public var takeCommandSent:Boolean;
      
      public var name_1299:CollisionPrimitive;
      
      private var var_712:TankData;
      
      private var var_713:String;
      
      private var var_710:name_1287;
      
      private var var_709:Vector3;
      
      private var skin:AnimatedSprite3D;
      
      private var var_170:name_175;
      
      private var startTime:int;
      
      private var var_715:int = 1000;
      
      private var var_714:BitmapData;
      
      protected var var_609:OmniLight;
      
      public function name_313(param1:BattleTeamType, param2:Vector3, param3:int, param4:int, param5:Vector.<Material>, param6:BitmapData, param7:TanksCollisionDetector)
      {
         this.var_710 = name_1287.AT_BASE;
         super();
         this.teamType = param1;
         this.var_709 = param2.vClone();
         this.var_710 = name_1287.AT_BASE;
         this.var_714 = param6;
         this.method_983(128,256,param5);
         this.method_982(param1);
         this.var_709.z -= 50;
         this.var_709.z += 80;
         this.name_731(this.var_709);
         this.startTime = this.var_715 * Math.random();
      }
      
      private function method_982(param1:BattleTeamType) : void
      {
         var _loc2_:name_1312 = lightingEffectsService.name_1313(BattleMode.CTF);
         var _loc3_:name_1307 = _loc2_.name_1310(param1);
         this.var_609 = new OmniLight(_loc3_.name_1308(),_loc2_.name_1314(),_loc2_.name_1316());
         this.var_609.intensity = _loc3_.name_1309();
      }
      
      public function get name_1286() : TankData
      {
         return this.var_712;
      }
      
      public function get name_1290() : String
      {
         return this.var_713;
      }
      
      public function get name_1293() : Vector3
      {
         return this.var_709;
      }
      
      private function name_731(param1:Vector3) : void
      {
         this.skin.x = param1.x;
         this.skin.y = param1.y;
         this.skin.z = param1.z;
         this.var_609.x = param1.x;
         this.var_609.y = param1.y;
         this.var_609.z = param1.z + 0.75 * 400;
         this.name_1299.transform.m03 = param1.x;
         this.name_1299.transform.m13 = param1.y;
         this.name_1299.transform.m23 = param1.z + 0.5 * 400;
         this.name_1299.calculateAABB();
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         this.var_170.addChild(this.skin);
         this.var_170.addChild(this.var_609);
         BattlefieldModel(Main.osgi.getService(IBattleField)).hidableObjects.add(new name_1430(this.skin));
      }
      
      public function get state() : name_1287
      {
         return this.var_710;
      }
      
      public function name_1291(param1:String, param2:TankData) : void
      {
         this.var_713 = param1;
         this.var_712 = param2;
         this.skin.visible = param2 != null;
         this.takeCommandSent = false;
         if(param2 != null)
         {
            this.skin.alpha = param2 == TankData.localTankData ? 0.5 : 1;
         }
         this.var_710 = name_1287.CARRIED;
      }
      
      public function name_1295() : void
      {
         this.reset();
         this.name_731(this.var_709);
         this.var_710 = name_1287.AT_BASE;
      }
      
      public function name_1294(param1:Vector3, param2:TanksCollisionDetector) : void
      {
         this.reset();
         if(param2.name_251(param1,const_431,name_73.name_252,1,null,var_711))
         {
            this.name_731(var_711.position);
         }
         else
         {
            this.name_731(param1);
         }
         this.var_710 = name_1287.DROPPED;
      }
      
      public function toString() : String
      {
         return "[CTFFlag teamType=" + this.teamType + ", state=" + this.var_710 + ", carrierId=" + this.var_713 + ", takeCommandSent=" + this.takeCommandSent + "]";
      }
      
      public function dispose() : void
      {
         this.skin.alternativa3d::removeFromParent();
         this.var_609.alternativa3d::removeFromParent();
      }
      
      public function update(param1:int) : void
      {
         var _loc2_:Tank = null;
         var _loc3_:Object3D = null;
         this.skin.update(param1 * 0.001);
         if(this.var_712 != null)
         {
            _loc2_ = this.var_712.tank;
            if(_loc2_ == null || _loc2_.skin == null)
            {
               return;
            }
            _loc3_ = _loc2_.skin.name_144();
            matrix.name_932(_loc3_.rotationX,_loc3_.rotationY,_loc3_.rotationZ);
            matrix.name_890(_loc2_.skin.name_909.name_1434,name_1289);
            name_1289.x += _loc3_.x;
            name_1289.y += _loc3_.y;
            name_1289.z += _loc3_.z - 40;
            this.name_731(name_1289);
         }
      }
      
      private function method_983(param1:int, param2:int, param3:Vector.<Material>) : void
      {
         var _loc4_:Number = param1 * 400 / param2;
         var _loc5_:AnimatedSprite3D = new AnimatedSprite3D(_loc4_,400);
         var _loc6_:name_1072 = GraphicsUtils.name_1073(MaterialRegistry(Main.osgi.getService(IMaterialRegistry)).textureMaterialRegistry as TextureMaterialRegistry,this.var_714,param1,param2);
         _loc6_.fps = 1;
         _loc5_.name_1433(_loc6_);
         _loc5_.name_1431(1);
         _loc5_.originY = 1;
         _loc5_.name_1432 = true;
         this.skin = _loc5_;
         this.name_1299 = new name_904(new Vector3(0.5 * 95,0.5 * 95,0.5 * 400),name_73.name_171,name_888.name_947);
      }
      
      private function reset() : void
      {
         this.var_713 = null;
         this.var_712 = null;
         this.skin.alpha = 1;
         this.skin.visible = true;
         this.var_609.visible = true;
         this.takeCommandSent = false;
      }
      
      public function name_1302() : Boolean
      {
         return this.skin.x == this.var_709.x && this.skin.y == this.var_709.y && this.skin.z == this.var_709.z;
      }
   }
}
