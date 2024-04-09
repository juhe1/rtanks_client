package alternativa.tanks.models.battlefield.effects.levelup
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.name_1083;
   import alternativa.tanks.engine3d.name_1076;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import package_1.Main;
   import package_120.name_408;
   import package_288.name_1075;
   import package_288.name_1077;
   import package_288.name_1078;
   import package_37.Vector3;
   import package_42.name_73;
   import package_61.RayHit;
   
   public class LevelUpEffect
   {
      
      public static var battleService:IBattleField = OSGi.getInstance().getService(IBattleField) as IBattleField;
      
      public static var userInfoService:name_408 = OSGi.getInstance().getService(name_408) as name_408;
      
      private static const const_115:Class = name_1082;
      
      private static const const_112:BitmapData = new const_115().bitmapData;
      
      private static const const_116:Class = name_1080;
      
      private static const const_111:BitmapData = new const_116().bitmapData;
      
      private static const const_118:Class = name_1081;
      
      private static const const_113:BitmapData = new const_118().bitmapData;
      
      private static const const_114:Vector3 = new Vector3();
      
      private static const const_117:Vector3 = new Vector3(0,0,1);
      
      private static const var_397:RayHit = new RayHit();
      
      private static var var_58:IMaterialRegistry;
       
      
      private var battlefield:BattlefieldModel;
      
      public function LevelUpEffect()
      {
         super();
         this.battlefield = Main.osgi.getService(IBattleField) as BattlefieldModel;
         var_58 = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry));
      }
      
      private static function method_578(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         const_114.reset(param1,param2,param3);
         var _loc5_:name_1083 = battleService.getBattlefieldData().name_247;
         if(_loc5_.name_251(const_114,const_117,name_73.name_252,param4,null,var_397))
         {
            return var_397.t;
         }
         return param4;
      }
      
      public function name_220(param1:Tank, param2:int) : void
      {
         var _loc3_:Object3D = param1.skin.name_144();
         var _loc4_:Number = this.method_579(_loc3_.x,_loc3_.y,_loc3_.z);
         this.method_581(_loc4_,_loc3_);
         this.method_582(param1.tankData.userName,_loc4_,param2,_loc3_);
         this.method_580(_loc4_,_loc3_);
         this.method_583(_loc3_);
      }
      
      private function method_579(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = method_578(param1,param2,param3,2000);
         return Math.max(500,_loc4_);
      }
      
      private function method_581(param1:Number, param2:Object3D) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:name_1077 = null;
         var _loc6_:Number = 0;
         var _loc7_:Number = Math.PI * 2 / 6;
         var _loc8_:TextureMaterial = var_58.textureMaterialRegistry.getMaterial(name_1076.name_1079,const_112,const_112.height / const_112.width,false);
         var _loc9_:int = 0;
         while(_loc9_ < 6)
         {
            _loc3_ = Math.sin(_loc6_) * 90;
            _loc4_ = Math.cos(_loc6_) * 90;
            _loc5_ = name_1077(this.battlefield.getObjectPool().getObject(name_1077));
            _loc5_.init(500,200,30,param1,0.8,0.5,_loc3_,_loc4_,-50,param2,_loc8_);
            this.battlefield.name_217(_loc5_);
            _loc6_ += _loc7_;
            _loc9_++;
         }
      }
      
      private function method_582(param1:String, param2:Number, param3:int, param4:Object3D) : void
      {
         var _loc5_:BigRankIcon = new BigRankIcon();
         var _loc6_:Boolean = !userInfoService.hasData(param1) ? false : Boolean(userInfoService.getData(param1).premium);
         _loc5_.init(_loc6_,param3);
         var _loc7_:BitmapData = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         _loc7_.draw(_loc5_);
         var _loc8_:TextureMaterial = new TextureMaterial(_loc7_,false,true,MipMapping.PER_PIXEL,1);
         var _loc9_:name_1075 = name_1075(this.battlefield.getObjectPool().getObject(name_1075));
         _loc9_.init(500,270,270,0,param2 * 0.8,param2 * 0.15,0.35,0,0,50,param4,_loc8_,BlendMode.NORMAL);
         this.battlefield.name_217(_loc9_);
      }
      
      private function method_580(param1:Number, param2:Object3D) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:TextureMaterial = null;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:name_1075 = null;
         _loc3_ = 15;
         _loc4_ = 100;
         _loc5_ = var_58.textureMaterialRegistry.getMaterial(name_1076.name_1079,const_111,const_111.height / const_111.width,false);
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc7_ = Math.PI * 2 * Math.random();
            _loc8_ = Math.sin(_loc7_) * _loc4_;
            _loc9_ = Math.cos(_loc7_) * _loc4_;
            _loc10_ = -110 * _loc6_ - 50;
            _loc11_ = name_1075(this.battlefield.getObjectPool().getObject(name_1075));
            _loc11_.init(400,150,150,_loc7_,param1 * 0.7,param1 * 0.15,0.7,_loc8_,_loc9_,_loc10_,param2,_loc5_,BlendMode.ADD);
            this.battlefield.name_217(_loc11_);
            _loc6_++;
         }
      }
      
      private function method_583(param1:Object3D) : void
      {
         var _loc2_:TextureMaterial = var_58.textureMaterialRegistry.getMaterial(name_1076.name_1079,const_113,const_113.height / const_113.width,false);
         var _loc3_:name_1078 = name_1078(this.battlefield.getObjectPool().getObject(name_1078));
         _loc3_.init(900,220,3,true,param1,_loc2_);
         this.battlefield.name_217(_loc3_);
      }
   }
}
