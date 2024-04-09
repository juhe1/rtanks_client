package alternativa.tanks.models.battlefield
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.core.Light3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.core.View;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.physics.collision.name_1083;
   import alternativa.tanks.config.Billboards;
   import alternativa.tanks.display.AxisIndicator;
   import alternativa.tanks.sfx.name_691;
   import alternativa.tanks.vehicles.tanks.TurretSkin;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.display.StageQuality;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_240.DecalFactory;
   import package_240.FadingDecalsRenderer;
   import package_240.name_656;
   import package_240.name_682;
   import package_244.Dust;
   import package_249.HidableGraphicObjects;
   import package_3.GPUCapabilities;
   import package_37.Vector3;
   import package_68.Object3DContainerProxy;
   import package_68.name_175;
   import package_76.name_735;
   
   use namespace alternativa3d;
   
   public class BattleView3D extends Sprite
   {
      
      public static var battleService:IBattleField;
      
      private static const const_39:int = 10;
      
      private static const const_35:int = 20000;
      
      public static const const_397:int = 10;
       
      
      public var camera:name_735;
      
      private var var_549:Vector.<RenderGroup>;
      
      private var var_546:Object3DContainer;
      
      private var var_545:Object3DContainer;
      
      private var mainContainer:Object3DContainer;
      
      private var var_550:Object3DContainer;
      
      private var name_1060:Object3DContainer;
      
      private var var_548:Object3DContainerProxy;
      
      private var var_554:Object3DContainerProxy;
      
      private var var_551:Boolean;
      
      private var var_543:AxisIndicator;
      
      private const const_395:name_1228 = new name_1228(100);
      
      private var var_162:DecalFactory;
      
      private const const_33:name_682 = new name_682();
      
      private const const_34:Dictionary = new Dictionary();
      
      private var var_160:FadingDecalsRenderer;
      
      private var var_547:HidableGraphicObjects;
      
      private var var_542:name_1226;
      
      public var name_688:Sprite;
      
      private const const_396:uint = 10066176;
      
      private var var_170:Point;
      
      public const const_393:Dictionary = new Dictionary();
      
      private var fog:Fog;
      
      private var var_544:AmbientShadows;
      
      private var var_552:Billboards;
      
      private var lighting:name_1227;
      
      private const const_394:Dictionary = new Dictionary();
      
      private var var_553:Boolean;
      
      private var var_555:Dust;
      
      public function BattleView3D(param1:Boolean, param2:name_1083, param3:BattlefieldModel)
      {
         this.var_170 = new Point();
         this.var_549 = Vector.<RenderGroup>([new RenderGroup(),new RenderGroup()]);
         super();
         mouseEnabled = false;
         tabEnabled = false;
         focusRect = false;
         this.camera = new name_735();
         this.camera.view = new View(100,100,GPUCapabilities.constrained);
         this.camera.view.hideLogo();
         this.camera.view.focusRect = false;
         this.camera.softTransparency = true;
         this.camera.softAttenuation = 80;
         this.var_162 = new DecalFactory(param2);
         this.var_160 = param3.var_160;
         this.name_755(this.var_160,0);
         this.var_547 = param3.hidableObjects;
         addChild(this.camera.view);
         this.var_548 = new Object3DContainerProxy();
         this.var_546 = new Object3DContainer();
         this.var_546.addChild(this.var_545 = new Object3DContainer());
         this.var_546.addChild(this.mainContainer = new Object3DContainer());
         this.var_546.addChild(this.var_550 = new Object3DContainer());
         this.var_554 = new Object3DContainerProxy(this.var_550);
         this.var_546.addChild(this.camera);
         Main.stage.quality = StageQuality.HIGH;
         this.name_688 = new Sprite();
         addChild(this.name_688);
         this.method_777 = false;
         this.var_552 = new Billboards();
         this.fog = new Fog(this.camera);
         this.var_544 = new AmbientShadows(this.camera);
         this.lighting = new name_1227(this.camera);
      }
      
      public function name_726() : void
      {
         this.var_553 = true;
      }
      
      public function method_789() : void
      {
         this.var_553 = false;
      }
      
      public function method_780(param1:Object3D) : Number
      {
         var _loc2_:Number = param1.boundMaxX - param1.boundMinX;
         var _loc3_:Number = param1.boundMaxY - param1.boundMinY;
         var _loc4_:Number = param1.boundMaxZ - param1.boundMinZ;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_ + _loc4_ * _loc4_);
      }
      
      public function method_787(param1:Object3D) : void
      {
         this.const_394[param1] = true;
      }
      
      public function method_784(param1:Object3D) : void
      {
         delete this.const_394[param1];
      }
      
      public function getExcludedObjects() : Dictionary
      {
         return this.const_394;
      }
      
      public function name_1205(param1:TurretSkin) : void
      {
         this.name_884(param1.name_144());
      }
      
      public function name_1202(param1:TurretSkin) : void
      {
         this.method_280(param1.name_144());
      }
      
      public function name_751(param1:Dust) : void
      {
         this.var_555 = param1;
      }
      
      public function name_884(param1:Object3D) : void
      {
         this.var_548.addChild(param1);
         if(param1.name != name_1194.name_252 && param1.name != name_1194.name_1201)
         {
            this.const_393[param1] = true;
         }
      }
      
      public function method_280(param1:Object3D) : void
      {
         this.var_548.removeChild(param1);
         if(param1.name != name_1194.name_252 && param1.name != name_1194.name_1201)
         {
            delete this.const_393[param1];
         }
      }
      
      public function method_790() : void
      {
         this.name_755(this.var_547,0);
      }
      
      public function method_781() : void
      {
         this.method_776(this.var_547,0);
         this.var_547.name_1240();
      }
      
      public function name_719(param1:Boolean, param2:String) : void
      {
         if(param1)
         {
            if(this.var_542 == null)
            {
               this.name_721(true);
               this.name_687(true);
               this.name_711(true);
               this.name_706(true);
               this.name_722(true);
               this.name_702(true);
               this.name_692(true);
               this.name_705(true);
               this.var_542 = new name_1226();
               this.var_542.name_1232(this.stage,this.camera,param2);
            }
         }
         else if(this.var_542 != null)
         {
            this.var_542.stop();
            this.var_542 = null;
         }
      }
      
      public function method_782(param1:int, param2:Number, param3:Number, param4:Number) : void
      {
         this.fog.name_1230(param1,param2,param3,param4);
      }
      
      public function method_795(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         this.lighting.name_1230(param1,param2,param3,param4);
      }
      
      public function method_785(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         this.camera.ssaoRadius = param1;
         this.camera.ssaoRange = param2;
         this.camera.ssaoColor = param3;
         this.camera.ssaoAlpha = param4;
      }
      
      public function name_722(param1:Boolean) : void
      {
         this.camera.ssao = param1;
      }
      
      public function name_687(param1:Boolean) : void
      {
         if(GPUCapabilities.method_95)
         {
            if(param1)
            {
               this.lighting.name_1242();
            }
            else
            {
               this.lighting.name_1238();
            }
         }
      }
      
      public function method_788() : void
      {
         this.lighting.toggle();
      }
      
      public function method_793(param1:Mesh) : void
      {
         this.var_552.add(param1);
      }
      
      public function method_786(param1:BitmapData) : void
      {
         this.var_552.name_461(param1);
      }
      
      public function name_702(param1:Boolean) : void
      {
         if(GPUCapabilities.method_95)
         {
            if(param1)
            {
               this.lighting.name_702();
            }
            else
            {
               this.lighting.name_1231();
            }
         }
      }
      
      public function name_692(param1:Boolean) : void
      {
         if(GPUCapabilities.method_95)
         {
            this.camera.deferredLighting = param1;
         }
      }
      
      public function name_705(param1:Boolean) : void
      {
         if(GPUCapabilities.method_95)
         {
            this.camera.view.antiAliasEnabled = param1;
         }
      }
      
      public function name_721(param1:Boolean) : void
      {
         if(GPUCapabilities.method_95)
         {
            if(param1)
            {
               this.var_544.enable();
            }
            else
            {
               this.var_544.disable();
            }
         }
      }
      
      public function name_1203(param1:Shadow) : void
      {
         this.var_544.add(param1);
      }
      
      public function name_1200(param1:Shadow) : void
      {
         this.var_544.remove(param1);
      }
      
      public function addDecal(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial, param5:name_656 = null, param6:Boolean = false) : void
      {
         var _loc7_:Decal = this.createDecal(param1,param2,param3,param4,param5);
         if(_loc7_ != null && !param6)
         {
            this.const_33.name_1237(_loc7_);
            if(this.const_33.getSize() > 10)
            {
               this.var_160.add(this.const_33.pop());
            }
         }
      }
      
      private function createDecal(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial, param5:name_656 = null) : Decal
      {
         var _loc6_:Decal = null;
         if(param5 == null)
         {
            param5 = name_656.name_1234;
         }
         _loc6_ = this.var_162.createDecal(param1,param2,param3,param4,KDContainer(this._mapContainer),param5);
         KDContainer(this._mapContainer).addChildAt(_loc6_,0);
         this.const_34[_loc6_] = true;
         return _loc6_;
      }
      
      public function method_187(param1:Decal) : void
      {
         if(param1 != null)
         {
            KDContainer(this._mapContainer).removeChild(param1);
            delete this.const_34[param1];
         }
      }
      
      public function name_706(param1:Boolean) : void
      {
         this.camera.softTransparency = param1;
      }
      
      public function name_711(param1:Boolean) : void
      {
         if(GPUCapabilities.method_95)
         {
            if(param1)
            {
               this.fog.enable();
            }
            else
            {
               this.fog.disable();
            }
         }
      }
      
      public function set method_777(param1:Boolean) : void
      {
         if(this.var_551 == param1)
         {
            return;
         }
         this.var_551 = param1;
         if(param1)
         {
            this.var_543 = new AxisIndicator(50);
            addChild(this.var_543);
         }
         else
         {
            removeChild(this.var_543);
            this.var_543 = null;
         }
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         this.camera.view.width = param1;
         this.camera.view.height = param2;
         if(this.var_551)
         {
            this.var_543.y = (param2 + this.camera.view.height >> 1) - 2 * this.var_543.size;
         }
         this.camera.name_1235();
         if(this.stage != null)
         {
            this.var_170.x = this.stage.stageWidth - this.camera.view.width >> 1;
            this.var_170.y = this.stage.stageHeight - this.camera.view.height >> 1;
         }
      }
      
      public function method_794() : Number
      {
         return this.var_170.x;
      }
      
      public function method_783() : Number
      {
         return this.var_170.y;
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_553)
         {
            if(this.var_551)
            {
               this.var_543.update(this.camera);
            }
            this.const_395.update();
            this.var_544.name_1233(this.const_395.name_1236());
            this.var_555.update();
            this.camera.name_1241();
            this.method_779(param1,param2);
            this.method_778(param2);
            _loc3_ = this.camera.shadowMap != null ? Number(this.camera.shadowMapStrength) : Number(0);
            if(this.camera.directionalLight != null)
            {
               this.camera.directionalLight.intensity = 0.5 + _loc3_ * (1 - 0.5);
            }
            this.camera.render();
         }
      }
      
      private function method_778(param1:int) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:name_691 = null;
         var _loc2_:name_735 = this.camera;
         for(_loc3_ in battleService.getBattlefieldData().name_694)
         {
            _loc4_ = _loc3_;
            if(!_loc4_.play(param1,_loc2_))
            {
               _loc4_.destroy();
               delete battleService.getBattlefieldData().name_694[_loc3_];
            }
         }
      }
      
      public function get _mapContainer() : Object3DContainer
      {
         return this.name_1060;
      }
      
      public function set _mapContainer(param1:Object3DContainer) : void
      {
         if(this.name_1060 != null)
         {
            this.mainContainer.removeChild(this.name_1060);
            this.name_1060 = null;
         }
         this.var_548.name_1239(param1);
         this.name_1060 = param1;
         if(this.name_1060 != null)
         {
            this.mainContainer.addChild(this.name_1060);
            this.camera.farClipping = 1.5 * this.method_780(this.name_1060);
         }
         this.var_550.name = "FRONT CONTAINER";
         this.name_1060.name = "MAP CONTAINER";
         this.name_1060.mouseEnabled = true;
         this.name_1060.mouseChildren = true;
      }
      
      public function name_786(param1:Vector.<Light3D>) : void
      {
         var _loc2_:Light3D = null;
         for each(_loc2_ in param1)
         {
            this.var_545.addChild(_loc2_);
         }
      }
      
      public function name_757() : void
      {
         this.name_719(false,"");
         this.clear(this.var_546);
         this.clear(this.name_1060);
         this.clear(this.var_545);
         this.clear(this.var_550);
         this.var_547.clear();
      }
      
      public function name_776() : void
      {
         if(this.var_542 != null)
         {
            this.var_542.stop();
            this.var_542 = null;
         }
      }
      
      private function clear(param1:Object3DContainer) : void
      {
         while(param1.numChildren > 0)
         {
            param1.removeChildAt(0);
         }
      }
      
      public function method_791(param1:Object3D) : void
      {
         if(this.name_1060 != null)
         {
            this.name_1060.addChild(param1);
            if(param1.name != name_1194.name_252 && param1.name != name_1194.name_1201)
            {
               this.const_393[param1] = true;
            }
         }
      }
      
      public function method_792(param1:Object3D) : void
      {
         if(this.name_1060 != null)
         {
            this.name_1060.removeChild(param1);
            if(param1.name != name_1194.name_252 && param1.name != name_1194.name_1201)
            {
               delete this.const_393[param1];
            }
         }
      }
      
      public function name_755(param1:name_1229, param2:int = 0) : void
      {
         var _loc3_:RenderGroup = this.var_549[param2];
         _loc3_.name_755(param1);
      }
      
      public function method_776(param1:name_1229, param2:int = 0) : void
      {
         var _loc3_:RenderGroup = this.var_549[param2];
         _loc3_.method_776(param1);
      }
      
      private function method_779(param1:int, param2:int) : void
      {
         var _loc3_:RenderGroup = null;
         for each(_loc3_ in this.var_549)
         {
            _loc3_.render(param1,param2);
         }
      }
      
      public function name_230() : name_175
      {
         return this.var_554;
      }
      
      public function name_257() : name_175
      {
         return this.var_548;
      }
      
      public function name_759(param1:Object3D) : void
      {
         if(this.var_545.numChildren > 0)
         {
            this.var_545.removeChildAt(0);
         }
         this.var_545.addChild(param1);
      }
      
      public function setFocus() : void
      {
         Main.stage.focus = this;
      }
   }
}
