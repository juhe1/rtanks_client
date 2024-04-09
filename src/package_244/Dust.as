package package_244
{
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.sfx.name_2086;
   import alternativa.tanks.sfx.name_2087;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_276.Track;
   import package_276.name_2088;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_40.TankSpawnState;
   import package_76.name_735;
   
   public class Dust
   {
      
      private static const const_1570:Number = 0.2;
      
      private static const const_1569:Number = 1;
      
      private static const bias:Vector3 = new Vector3(100,0,0);
      
      private static const const_1567:Vector3 = new Vector3();
      
      private static const const_1568:Vector3 = new Vector3();
       
      
      private var battleService:BattlefieldModel;
      
      private var var_1444:Number = 0;
      
      private var animation:name_1072;
      
      private var tanks:Dictionary;
      
      private var camera:name_735;
      
      private var nearDistance:Number;
      
      private var farDistance:Number;
      
      public var enabled:Boolean = true;
      
      private var intensity:Number;
      
      private var var_1443:Number;
      
      public function Dust(param1:BattlefieldModel)
      {
         this.tanks = new Dictionary();
         super();
         this.battleService = param1;
         this.camera = param1.var_117.viewport.camera;
      }
      
      private static function method_1652(param1:Vector3, param2:Number) : void
      {
         param1.x += (Math.random() - 0.5) * 2 * param2;
         param1.y += (Math.random() - 0.5) * 2 * param2;
         param1.z += (Math.random() - 0.5) * 2 * param2;
      }
      
      public function init(param1:BitmapData, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.farDistance = param2;
         this.nearDistance = param3;
         this.var_1444 = param4;
         this.intensity = param5;
         this.var_1443 = param6;
         this.animation = GraphicsUtils.name_1073((Main.osgi.getService(IMaterialRegistry) as IMaterialRegistry).textureMaterialRegistry as TextureMaterialRegistry,param1,32,32);
         this.animation.fps = 30;
      }
      
      public function name_237(param1:TankData) : void
      {
         this.tanks[param1] = param1.tank.method_490() / 600;
      }
      
      public function name_147(param1:TankData) : void
      {
         delete this.tanks[param1];
      }
      
      public function update() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:TankData = null;
         if(this.enabled && this.camera.softTransparency && this.camera.softTransparencyStrength > 0)
         {
            for(_loc1_ in this.tanks)
            {
               _loc2_ = _loc1_ as TankData;
               if(_loc2_ && _loc2_.name_87 == TankSpawnState.ACTIVE && Boolean(this.battleService.var_117.name_263[_loc2_]))
               {
                  this.name_955(_loc2_,100,this.var_1443);
               }
            }
         }
      }
      
      public function name_955(param1:TankData, param2:Number = 100, param3:Number = 0.2) : void
      {
         var _loc4_:Track = null;
         var _loc5_:Number = Number(this.tanks[param1]);
         var _loc6_:Track = param1.tank.name_180().name_936();
         _loc4_ = param1.tank.name_180().name_958();
         if(_loc4_.name_924 * _loc6_.name_924 < 0)
         {
            param2 = 5;
         }
         var _loc7_:Matrix3 = param1.tank.name_225;
         bias.x *= -1;
         _loc7_.name_890(bias,const_1567);
         this.method_1653(param1.tank,_loc6_,_loc5_,const_1567,param2,param3);
         bias.x *= -1;
         _loc7_.name_890(bias,const_1567);
         this.method_1653(param1.tank,_loc4_,_loc5_,const_1567,param2,param3);
      }
      
      private function method_1653(param1:Tank, param2:Track, param3:Number, param4:Vector3, param5:Number, param6:Number) : void
      {
         var _loc7_:name_2088 = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         while(_loc10_ < param2.name_2092)
         {
            _loc7_ = param2.name_2090[_loc10_];
            _loc8_ = _loc7_.speed;
            if(_loc8_ > param5 && Math.random() < param6 && param2.name_2089 > 0)
            {
               _loc9_ = _loc8_ > 500 ? Number(Number(1)) : Number(Number(0.3 + _loc8_ / 712));
               const_1568.vCopy(_loc7_.name_2091());
               method_1652(const_1568,50);
               method_1652(param4,20);
               this.method_1654(param1,param3,const_1568,param4,_loc9_);
            }
            _loc10_++;
         }
      }
      
      private function method_1654(param1:Tank, param2:Number, param3:Vector3, param4:Vector3, param5:Number) : void
      {
         var _loc6_:name_2086 = null;
         var _loc7_:name_2087 = null;
         var _loc8_:Number = NaN;
         if(this.enabled && this.camera.softTransparency && this.camera.softTransparencyStrength > 0)
         {
            _loc6_ = name_2086(this.battleService.getObjectPool().getObject(name_2086));
            _loc6_.init(param3,param4,0.01);
            _loc7_ = name_2087(this.battleService.getObjectPool().getObject(name_2087));
            _loc8_ = this.var_1444 * param2 * (1 + 1 * Math.random());
            _loc7_.init(_loc8_,_loc8_,this.animation,Math.random() * 2 * Math.PI,_loc6_,0.5,0.5,null,130,BlendMode.NORMAL,this.nearDistance,this.farDistance,this.intensity * param5 * this.camera.softTransparencyStrength,true);
            this.battleService.name_217(_loc7_);
         }
      }
   }
}
