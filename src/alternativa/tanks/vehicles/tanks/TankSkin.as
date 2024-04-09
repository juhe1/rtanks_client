package alternativa.tanks.vehicles.tanks
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_966;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_1194;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import flash.geom.ColorTransform;
   import flash.geom.Vector3D;
   import package_1.Main;
   import package_302.TrackMaterial;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_37.name_86;
   import package_68.name_175;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class TankSkin
   {
      
      private static const const_376:int = 1;
      
      private static const const_377:int = 2;
      
      private static const const_374:ColorTransform = new ColorTransform();
      
      private static var var_506:Matrix4 = new Matrix4();
      
      private static var var_515:Matrix4 = new Matrix4();
      
      private static var var_514:Vector3 = new Vector3();
      
      private static var var_498:TextureMaterialRegistry;
      
      private static const const_375:name_1192 = new name_1192();
       
      
      private var var_509:TrackSkin;
      
      private var var_507:TrackSkin;
      
      public var name_927:Number = 0;
      
      public var var_518:Number = 0;
      
      private var var_516:int;
      
      private var var_505:SkinStateMaterials;
      
      private var var_508:SkinStateMaterials;
      
      public var var_511:TankTurretDynamicSkin;
      
      private var var_510:TankSkinHull;
      
      private var var_499:Mesh;
      
      private var var_512:TankSkinTurret;
      
      protected var var_520:HullSkin;
      
      protected var var_500:TurretSkin;
      
      private var var_519:String;
      
      private var var_504:ColorTransform;
      
      private var var_501:ColorTransform;
      
      private var var_502:ColorTransform;
      
      private var var_517:ColorTransform;
      
      private var var_513:ColorTransform;
      
      public var var_503:Shadow;
      
      private var var_421:BattlefieldModel;
      
      private var registry:name_966;
      
      private var hull:Tanks3DSResource;
      
      private var turret:Tanks3DSResource;
      
      private var var_170:name_175;
      
      public function TankSkin(param1:Tanks3DSResource, param2:Tanks3DSResource, param3:Resource, param4:Resource)
      {
         this.var_504 = new ColorTransform();
         this.var_501 = new ColorTransform();
         this.var_502 = new ColorTransform();
         super();
         if(param1 == null)
         {
            throw new ArgumentError("Hull is null");
         }
         if(param2 == null)
         {
            throw new ArgumentError("Turret is null");
         }
         if(param3 == null)
         {
            throw new ArgumentError("Colormap is null");
         }
         if(var_498 == null)
         {
            var_498 = TextureMaterialRegistry(IMaterialRegistry(Main.osgi.getService(IMaterialRegistry)).textureMaterialRegistry);
         }
         this.hull = param1;
         this.turret = param2;
         this.var_421 = BattlefieldModel(Main.osgi.getService(IBattleField));
         this.var_510 = const_375.name_1199(param1);
         this.var_499 = this.method_734(this.var_510.mesh);
         this.var_512 = const_375.name_1198(param2);
         this.var_500 = new TurretSkin(param2);
         this.var_500.name_1196(this.var_501);
         this.method_732(this.var_499);
         this.var_505 = this.method_733(this.name_912,this.name_909,param3);
         this.var_508 = this.method_731(this.name_912,this.name_909,param4);
         this.var_503 = new Shadow(128,8,100,1,1,1118498,0.6);
         this.var_503.direction = new Vector3D(0,0,-1);
         this.var_503.offset = 90;
         this.var_503.backFadeRange = 90;
         this.var_503.addCaster(this.name_123);
         this.var_500.name_1204(this.var_503);
         this.var_517 = new ColorTransform(1,0.75,0.6,1,-16,-66,-66);
         this.var_513 = new ColorTransform(0.8,1,1.2,1,40,60,70);
      }
      
      private static function method_727(param1:ColorTransform, param2:String, param3:ColorTransform, param4:ColorTransform, param5:Number) : void
      {
         var _loc6_:Number = param4[param2] - param3[param2];
         param1[param2] = param3[param2] + Math.abs(param5) * _loc6_;
      }
      
      private static function method_728(param1:ColorTransform, param2:ColorTransform) : void
      {
         param2.redMultiplier = param1.redMultiplier;
         param2.greenMultiplier = param1.greenMultiplier;
         param2.blueMultiplier = param1.blueMultiplier;
         param2.alphaMultiplier = param1.alphaMultiplier;
         param2.redOffset = param1.redOffset;
         param2.greenOffset = param1.greenOffset;
         param2.blueOffset = param1.blueOffset;
         param2.alphaOffset = param1.alphaOffset;
      }
      
      private function method_733(param1:TankSkinHull, param2:TankSkinTurret, param3:Resource) : SkinStateMaterials
      {
         var _loc4_:TextureMaterial = null;
         var _loc5_:TextureMaterial = null;
         if(param3 is MultiframeImageResource)
         {
            _loc4_ = var_498.name_1193(param3 as MultiframeImageResource,param2);
            _loc5_ = var_498.name_1193(param3 as MultiframeImageResource,param1);
         }
         else
         {
            if(!(param3 is ImageResource))
            {
               throw new ArgumentError("Colormap is not ImageResource");
            }
            _loc4_ = var_498.name_1191(param3 as ImageResource,param2);
            _loc5_ = var_498.name_1191(param3 as ImageResource,param1);
         }
         var _loc6_:TrackMaterial = new TrackMaterial(param1.details);
         var _loc7_:TrackMaterial = new TrackMaterial(param1.details);
         TextureMaterialRegistry(var_498).addMaterial(_loc6_);
         TextureMaterialRegistry(var_498).addMaterial(_loc7_);
         return new SkinStateMaterials(_loc5_,_loc4_,_loc6_,_loc7_);
      }
      
      private function method_731(param1:TankSkinHull, param2:TankSkinTurret, param3:Resource) : SkinStateMaterials
      {
         var _loc4_:TextureMaterial = var_498.name_1191(param3 as ImageResource,param1);
         var _loc5_:TextureMaterial = var_498.name_1191(param3 as ImageResource,param2);
         return new SkinStateMaterials(_loc4_,_loc5_);
      }
      
      public function method_729(param1:Number) : void
      {
         if(this.name_912 != null && this.name_909 != null)
         {
            var_506.name_943(this.var_499.x,this.var_499.y,this.var_499.z,this.var_499.rotationX,this.var_499.rotationY,this.var_499.rotationZ);
            this.var_500.method_729(var_506,this.name_912,this.name_927,param1);
         }
      }
      
      public function name_969(param1:Vector3, param2:Vector3) : void
      {
         if(this.name_912 != null)
         {
            this.var_499.x = param1.x;
            this.var_499.y = param1.y;
            this.var_499.z = param1.z;
            this.var_499.rotationX = param2.x;
            this.var_499.rotationY = param2.y;
            this.var_499.rotationZ = param2.z;
         }
      }
      
      public function dispose() : void
      {
      }
      
      public function method_55() : void
      {
         this.var_516 = 1;
         this.var_499.setMaterialToAllFaces(this.var_505.hullMaterial);
         this.var_500.name_1195(this.var_505.turretMaterial);
         this.method_730(this.var_505.leftTrackMaterial,this.var_505.rightTrackMaterial);
      }
      
      public function name_242() : void
      {
         this.var_516 = 2;
         this.var_499.setMaterialToAllFaces(this.var_508.hullMaterial);
         this.var_500.name_1195(this.var_508.turretMaterial);
         this.name_261();
      }
      
      public function name_261() : void
      {
         this.var_518 = 0;
         this.var_504.redMultiplier = 1;
         this.var_504.greenMultiplier = 1;
         this.var_504.blueMultiplier = 1;
         this.var_504.redOffset = 0;
         this.var_504.greenOffset = 0;
         this.var_504.blueOffset = 0;
         method_728(this.var_504,this.var_501);
      }
      
      public function name_956(param1:Number) : void
      {
         var _loc2_:ColorTransform = null;
         if(param1 == 0)
         {
            _loc2_ = const_374;
         }
         else if(param1 < 0)
         {
            _loc2_ = this.var_513;
         }
         else
         {
            _loc2_ = this.var_517;
         }
         method_727(this.var_502,"redMultiplier",const_374,_loc2_,param1);
         method_727(this.var_502,"blueMultiplier",const_374,_loc2_,param1);
         method_727(this.var_502,"greenMultiplier",const_374,_loc2_,param1);
         method_727(this.var_502,"redOffset",const_374,_loc2_,param1);
         method_727(this.var_502,"blueOffset",const_374,_loc2_,param1);
         method_727(this.var_502,"greenOffset",const_374,_loc2_,param1);
         method_727(this.var_501,"redMultiplier",this.var_501,this.var_502,0.03);
         method_727(this.var_501,"blueMultiplier",this.var_501,this.var_502,0.03);
         method_727(this.var_501,"greenMultiplier",this.var_501,this.var_502,0.03);
         method_727(this.var_501,"redOffset",this.var_501,this.var_502,0.03);
         method_727(this.var_501,"blueOffset",this.var_501,this.var_502,0.03);
         method_727(this.var_501,"greenOffset",this.var_501,this.var_502,0.03);
      }
      
      public function name_1068(param1:Number) : void
      {
         this.name_123.alpha = param1;
         this.var_500.alpha = param1;
         this.var_503.alpha = param1 * 0.6;
      }
      
      private function method_737(param1:Vector.<Mesh>) : Boolean
      {
         return param1.length < 6 && param1[0].faces.length < 500;
      }
      
      public function name_742(param1:name_175) : void
      {
         if(this.var_170 == null)
         {
            this.var_170 = param1;
         }
         param1.addChild(this.var_499);
         this.var_421.var_117.viewport.name_1205(this.var_500);
         this.var_421.var_117.viewport.name_1203(this.var_503);
      }
      
      public function name_775() : void
      {
         this.var_170.removeChild(this.var_499);
         this.var_421.var_117.viewport.name_1202(this.var_500);
         this.var_421.var_117.viewport.name_1200(this.var_503);
      }
      
      public function method_736(param1:Vector3) : void
      {
         param1.x = this.var_500.name_144().x;
         param1.y = this.var_500.name_144().y;
         param1.z = this.var_500.name_144().z;
      }
      
      public function get name_123() : Mesh
      {
         return this.var_499;
      }
      
      public function get name_200() : Object3D
      {
         return this.var_500.name_144();
      }
      
      public function method_738() : TurretSkin
      {
         return this.var_500;
      }
      
      public function name_144() : Object3D
      {
         return this.var_500.name_144();
      }
      
      public function name_923() : Object3D
      {
         return this.var_500.name_923();
      }
      
      public function get name_912() : TankSkinHull
      {
         return this.var_510;
      }
      
      public function get name_909() : TankSkinTurret
      {
         return this.var_512;
      }
      
      public function name_926() : Vector.<name_907>
      {
         return this.name_909.name_1197();
      }
      
      private function method_734(param1:Mesh) : Mesh
      {
         var _loc2_:Mesh = Mesh(param1.clone());
         _loc2_.name = name_1194.name_1201;
         _loc2_.colorTransform = this.var_501;
         _loc2_.shadowMapAlphaThreshold = 0.1;
         _loc2_.calculateVerticesNormalsBySmoothingGroups(0.01);
         return _loc2_;
      }
      
      public function name_946(param1:Vector3, param2:name_86) : void
      {
         this.method_729(this.name_927);
      }
      
      public function name_234(param1:Number, param2:Number) : void
      {
         this.var_509.move(param1);
         this.var_507.move(param2);
      }
      
      public function method_732(param1:Mesh) : void
      {
         var _loc2_:Face = null;
         this.var_509 = new TrackSkin();
         this.var_507 = new TrackSkin();
         for each(_loc2_ in param1.faces)
         {
            if(_loc2_.id == "track" || _loc2_.material.name == "track" || _loc2_.material.name == "tracks")
            {
               this.method_735(_loc2_);
            }
         }
         this.var_509.init();
         this.var_507.init();
      }
      
      private function method_730(param1:Material, param2:Material) : void
      {
         this.var_509.setMaterial(param1);
         this.var_507.setMaterial(param2);
      }
      
      private function method_735(param1:Face) : void
      {
         var _loc2_:Vertex = param1.vertices[0];
         if(_loc2_.x < 0)
         {
            this.var_509.addFace(param1);
         }
         else
         {
            this.var_507.addFace(param1);
         }
      }
      
      public function destroy() : *
      {
         this.var_499.setMaterialToAllFaces(null);
         var_498.disposeMaterial(this.var_505.hullMaterial);
         var_498.disposeMaterial(this.var_505.turretMaterial);
         var_498.disposeMaterial(this.var_508.hullMaterial);
         var_498.disposeMaterial(this.var_508.turretMaterial);
         this.var_505 = null;
         this.var_508 = null;
         this.var_510 = null;
         this.var_512 = null;
         this.var_500.destroy();
         this.var_500 = null;
         this.var_499 = null;
         this.var_509 = null;
         this.var_507 = null;
         if(this.var_511 != null)
         {
            this.var_511.destroy();
         }
         this.var_511 = null;
      }
   }
}

import alternativa.engine3d.materials.TextureMaterial;
import package_302.TrackMaterial;

class SkinStateMaterials
{
    
   
   public var hullMaterial:TextureMaterial;
   
   public var turretMaterial:TextureMaterial;
   
   public var leftTrackMaterial:TrackMaterial;
   
   public var rightTrackMaterial:TrackMaterial;
   
   public function SkinStateMaterials(param1:TextureMaterial, param2:TextureMaterial, param3:TrackMaterial = null, param4:TrackMaterial = null)
   {
      super();
      this.hullMaterial = param1;
      this.turretMaterial = param2;
      this.leftTrackMaterial = param3;
      this.rightTrackMaterial = param4;
   }
}
