package package_99
{
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.osgi.service.dump.name_524;
   import alternativa.physics.ShapeContact;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_128;
   import alternativa.tanks.models.battlefield.name_652;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.dom.DOMModel;
   import alternativa.tanks.models.dom.IDOMModel;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.name_1495;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.services.objectpool.IObjectPoolService;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_1070;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.display.BitmapData;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_238.ObjectPool;
   import package_242.name_662;
   import package_251.BattleMinesModelBase;
   import package_251.name_1410;
   import package_251.name_690;
   import package_284.name_994;
   import package_319.name_1411;
   import package_34.class_3;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_42.name_73;
   import package_46.BattleEventSupport;
   import package_46.name_96;
   import package_47.BattleTeamType;
   import package_49.name_146;
   import package_49.name_163;
   import package_49.name_97;
   import package_61.RayHit;
   import package_7.name_32;
   import package_79.CTFModel;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class BattleMinesModel extends BattleMinesModelBase implements name_690, class_48, class_11, name_652, class_3
   {
      
      private static var var_138:IObjectPoolService = IObjectPoolService(Main.osgi.getService(IObjectPoolService));
      
      private static var battleEventDispatcher:name_96 = name_96(Main.osgi.getService(name_96));
      
      private static const const_499:Number = 0.5;
      
      private static const const_495:Number = 0.772;
      
      private static const const_502:Number = 0.5;
      
      private static const const_501:Number = 0.9;
      
      private static const const_500:Number = 3;
      
      private static const const_497:Number = 3;
      
      private static const const_494:Number = 0.3;
      
      private static const const_498:Number = 200;
      
      private static const const_496:int = 300;
      
      private static const const_493:int = 100;
      
      private static var var_791:name_662 = new name_662("mine_main_scale",3,0.1,10);
      
      private static var var_788:name_662 = new name_662("mine_idle_scale",3,0.1,10);
      
      private static var var_790:name_662 = new name_662("mine_main_fps",30,1,50);
      
      private static var var_789:name_662 = new name_662("mine_idle_fps",30,1,50);
      
      private static var var_58:IMaterialRegistry;
      
      private static const const_492:Class = name_1504;
       
      
      private var var_11:IBattleField;
      
      private var ctfModel:CTFModel;
      
      private var var_776:DOMModel;
      
      private var var_56:name_97;
      
      private var var_13:ITank;
      
      private var var_117:name_128;
      
      private var var_771:name_1502;
      
      private var var_772:Dictionary;
      
      private var var_770:Dictionary;
      
      private var var_777:Number;
      
      private var var_769:Vector.<name_1410>;
      
      private var var_784:TextureMaterial;
      
      private var var_783:TextureMaterial;
      
      private var var_780:TextureMaterial;
      
      private var var_774:TextureMaterial;
      
      private var var_773:Mesh;
      
      private var var_779:name_1072;
      
      private var var_778:FrameSize;
      
      private var var_782:name_1072;
      
      private var var_781:FrameSize;
      
      private var var_785:Sound;
      
      private var explosionSound:Sound;
      
      private var var_786:Sound;
      
      private var impactForce:Number;
      
      private var var_775:Number;
      
      private var var_540:BattleEventSupport;
      
      private var var_792:Dictionary;
      
      private var var_794:Tank;
      
      private var const_431:Vector3;
      
      private var var_711:RayHit;
      
      private var var_793:Vector.<ShapeContact>;
      
      private const const_491:Vector3 = new Vector3();
      
      private var var_787:TextureMaterial;
      
      public function BattleMinesModel()
      {
         this.var_771 = new name_1502();
         this.var_772 = new Dictionary();
         this.var_770 = new Dictionary();
         this.var_778 = new FrameSize();
         this.var_781 = new FrameSize();
         this.const_431 = new Vector3(0,0,-1);
         this.var_711 = new RayHit();
         this.var_793 = new Vector.<ShapeContact>();
         super();
         _interfaces.push(IModel,name_690,class_11);
         name_1505.name_725();
         name_524(Main.osgi.getService(name_524)).registerDumper(this);
         this.var_792 = new Dictionary();
         this.var_787 = new TextureMaterial(new const_492().bitmapData);
      }
      
      private function method_1055() : void
      {
      }
      
      public function initObject(param1:ClientObject) : void
      {
         this.method_1055();
         var_58 = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry));
         var _loc2_:name_1411 = method_771();
         this.var_771.name_1509 = _loc2_.activateTimeMsec;
         this.var_771.name_1510 = 100;
         this.var_771.name_1507 = 300;
         this.var_771.name_1506 = 204;
         this.var_771.name_229 = _loc2_.farVisibilityRadius * 100;
         this.var_771.name_191 = _loc2_.nearVisibilityRadius * 100;
         this.var_777 = _loc2_.radius * 100;
         this.impactForce = _loc2_.impactForce;
         this.var_775 = _loc2_.minDistanceFromBase * _loc2_.minDistanceFromBase * 10000;
         this.var_785 = _loc2_.activateSound.sound;
         this.explosionSound = _loc2_.explosionSound.sound;
         this.var_786 = _loc2_.deactivateSound.sound;
         this.method_1054(Tanks3DSResource(_loc2_.model3ds));
         var _loc3_:InitParams = new InitParams(_loc2_.blueMineTexture.data,_loc2_.redMineTexture.data,_loc2_.enemyMineTexture.data,_loc2_.friendlyMineTexture.data,_loc2_.idleExplosionTexture,_loc2_.mainExplosionTexture);
         param1.method_12(BattleMinesModel,_loc3_);
      }
      
      public function method_954(param1:Vector.<name_1410>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1.length != 0)
         {
            if(this.var_769 == null)
            {
               this.var_769 = new Vector.<name_1410>();
            }
            _loc2_ = int(param1.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this.var_769.push(param1[_loc3_]);
               _loc3_++;
            }
         }
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:name_32 = name_32(Main.osgi.getService(name_32));
         this.var_11 = IBattleField(Main.osgi.getService(IBattleField));
         this.ctfModel = CTFModel(Main.osgi.getService(name_994));
         this.var_776 = DOMModel(Main.osgi.getService(IDOMModel));
         this.var_56 = name_97(_loc2_.getModelsByInterface(name_97)[0]);
         this.var_13 = ITank(Main.osgi.getService(ITank));
         this.var_117 = this.var_11.getBattlefieldData();
         this.var_11.method_152(this);
         var _loc3_:InitParams = InitParams(param1.method_16(BattleMinesModel));
         this.var_779 = this.method_1049(_loc3_.mainExplosionTexture,3,this.var_778);
         this.var_782 = this.method_1049(_loc3_.idleExplosionTexture,3,this.var_781);
         this.var_784 = this.method_1045(_loc3_.redMineTexture);
         this.var_783 = this.method_1045(_loc3_.blueMineTexture);
         this.var_780 = this.method_1045(_loc3_.friendlyMineTexture);
         this.var_774 = this.method_1045(_loc3_.enemyMineTexture);
         var _loc5_:BattlefieldModel = BattlefieldModel(Main.osgi.getService(IBattleField));
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         this.method_1050();
         this.var_11.method_150(this);
         this.var_11 = null;
         this.ctfModel = null;
         this.var_776 = null;
         this.var_13 = null;
         this.var_56 = null;
         this.var_117 = null;
         this.var_785 = null;
         this.var_779 = null;
         this.var_782 = null;
         this.var_784 = null;
         this.var_783 = null;
         this.var_780 = null;
         this.var_774 = null;
         this.var_792 = new Dictionary();
      }
      
      public function method_955(param1:ClientObject, param2:String, param3:Number, param4:Number, param5:Number, param6:String) : void
      {
         var _loc7_:TankData = null;
         var _loc9_:Vector3 = null;
         var _loc8_:ClientObject = param1;
         if(_loc8_ != null)
         {
            _loc7_ = this.var_13.getTankData(_loc8_);
         }
         if(_loc7_ == null || _loc7_.tank == null)
         {
            if(this.var_769 == null)
            {
               this.var_769 = new Vector.<name_1410>();
            }
         }
         else
         {
            _loc9_ = new Vector3(param3,param4,param5);
            this.method_1046(param2,this.var_777,_loc9_,param6,_loc7_.teamType,this.method_1047(_loc7_),false);
         }
      }
      
      public function method_956(param1:ClientObject, param2:String) : void
      {
         var _loc4_:name_1410 = null;
         var _loc3_:name_1500 = this.var_770[param2];
         if(_loc3_ != null)
         {
            _loc3_.name_1503();
            this.name_195(this.var_785,_loc3_.position,0.3);
         }
         else
         {
            for each(_loc4_ in this.var_769)
            {
               if(_loc4_.mineId == param2)
               {
                  _loc4_.activated = true;
                  return;
               }
            }
         }
      }
      
      public function method_957(param1:ClientObject, param2:String) : void
      {
         var _loc5_:name_1500 = null;
         var _loc3_:name_1501 = this.var_772[param2];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:name_1500 = _loc3_.head;
         while(_loc4_ != null)
         {
            _loc5_ = _loc4_;
            _loc4_ = _loc4_.next;
            this.method_1048(_loc5_.position,this.var_782,this.var_781,0.5,0.9);
            this.name_195(this.var_786,_loc5_.position,0.1);
            this.method_1051(_loc5_,_loc3_);
         }
      }
      
      public function name_1412(param1:ClientObject, param2:String, param3:String) : void
      {
         var _loc7_:TankData = null;
         var _loc4_:name_1500 = this.var_770[param2];
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:name_1501 = this.var_772[_loc4_.ownerId];
         if(_loc5_ == null)
         {
            return;
         }
         this.method_1048(_loc4_.position,this.var_779,this.var_778,0.5,0.772);
         this.name_195(this.explosionSound,_loc4_.position,0.5);
         this.method_1053(_loc4_);
         var _loc6_:ClientObject = param1;
         if(_loc6_ != null)
         {
            _loc7_ = this.var_13.getTankData(_loc6_);
            if(_loc7_ != null && _loc7_.tank != null)
            {
               _loc7_.tank.method_496(_loc4_.position,_loc4_.normal,name_1495.name_1499 * this.impactForce);
            }
         }
         this.method_1051(_loc4_,_loc5_);
      }
      
      private function method_1053(param1:name_1500) : void
      {
         this.const_491.vCopy(param1.position);
         this.const_491.vAddScaled(100,param1.normal);
         this.var_11.addDecal(param1.position,this.const_491,200,this.var_787);
      }
      
      public function get name_750() : String
      {
         return "mines";
      }
      
      public function startBattle() : void
      {
      }
      
      public function restartBattle() : void
      {
      }
      
      public function finishBattle() : void
      {
         this.method_1050();
      }
      
      public function tick(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         var _loc6_:Vector3 = null;
         var _loc7_:Boolean = false;
         var _loc5_:TankData = TankData.localTankData;
         if(this.ctfModel != null && _loc5_ != null && _loc5_.enabled)
         {
            _loc6_ = _loc5_.tank.state.position;
            _loc7_ = this.ctfModel.method_805(_loc6_,this.var_775,BattleTeamType.BLUE) || this.ctfModel.method_805(_loc6_,this.var_775,BattleTeamType.RED);
            this.var_56.name_179(name_163.MINE,name_146.name_203,_loc7_);
         }
         if(this.var_776 != null && _loc5_ != null && _loc5_.enabled)
         {
            _loc6_ = _loc5_.tank.state.position;
            _loc7_ = this.var_776.name_1512(_loc6_,this.var_775);
            this.var_56.name_179(name_163.MINE,name_146.name_203,_loc7_);
         }
      }
      
      public function method_1044(param1:name_1500) : void
      {
         Network(Main.osgi.getService(name_2)).send("battle;mine_hit;" + param1.id);
      }
      
      public function addUser(param1:ClientObject) : void
      {
      }
      
      public function removeUser(param1:ClientObject) : void
      {
      }
      
      public function addUserToField(param1:ClientObject) : void
      {
         var _loc3_:name_1410 = null;
         var _loc4_:int = 0;
         var _loc5_:Vector3 = null;
         var _loc6_:ClientObject = null;
         var _loc7_:TankData = null;
         var _loc2_:TankData = this.var_13.getTankData(param1);
         if(_loc2_.local)
         {
            if(this.var_769 != null)
            {
               _loc4_ = 0;
               while(_loc4_ < this.var_769.length)
               {
                  _loc3_ = this.var_769[_loc4_];
                  _loc6_ = param1;
                  if(_loc6_ != null)
                  {
                     _loc7_ = this.var_13.getTankData(_loc6_);
                     if(_loc7_ != null && _loc7_.tank != null)
                     {
                        this.var_769.splice(_loc4_,1);
                        _loc4_--;
                        _loc5_ = new Vector3(_loc3_.x,_loc3_.y,_loc3_.z);
                        this.method_1046(_loc3_.mineId,this.var_777,_loc5_,_loc3_.ownerId,_loc7_.teamType,this.method_1047(_loc7_),_loc3_.activated);
                     }
                  }
                  _loc4_++;
               }
            }
         }
         else if(this.var_769 != null)
         {
            _loc4_ = 0;
            while(_loc4_ < this.var_769.length)
            {
               _loc3_ = this.var_769[_loc4_];
               if(_loc3_.ownerId == param1.id)
               {
                  this.var_769.splice(_loc4_,1);
                  _loc4_--;
                  _loc5_ = new Vector3(_loc3_.x,_loc3_.y,_loc3_.z);
                  this.method_1046(_loc3_.mineId,this.var_777,_loc5_,_loc3_.ownerId,_loc2_.teamType,this.method_1047(_loc2_),_loc3_.activated);
               }
               _loc4_++;
            }
         }
      }
      
      public function removeUserFromField(param1:ClientObject) : void
      {
      }
      
      public function get dumperName() : String
      {
         return "mines";
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         var _loc3_:name_1500 = null;
         var _loc2_:String = "=== Mines ===\n";
         if(this.var_769 != null)
         {
            _loc2_ += "Deferred:\n" + this.var_769.join("\n") + "\n";
         }
         _loc2_ += "On field:\n";
         for each(_loc3_ in this.var_770)
         {
            _loc2_ += _loc3_ + "\n";
         }
         return _loc2_;
      }
      
      private function method_1048(param1:Vector3, param2:name_1072, param3:FrameSize, param4:Number, param5:Number) : void
      {
         var _loc7_:ObjectPool = BattlefieldModel(this.var_11).getObjectPool();
         var _loc8_:name_1071 = name_1071(_loc7_.getObject(name_1071));
         _loc8_.init(param1,50);
         var _loc9_:name_1070 = name_1070(_loc7_.getObject(name_1070));
         _loc9_.init(param3.width,param3.height,param2,0,_loc8_,param4,param5);
         this.var_11.name_217(_loc9_);
      }
      
      private function method_1046(param1:String, param2:Number, param3:Vector3, param4:String, param5:BattleTeamType, param6:Material, param7:Boolean) : void
      {
         var _loc8_:name_1501 = null;
         var _loc9_:name_1500 = null;
         var _loc10_:RayHit = new RayHit();
         if(this.var_117.name_247.name_251(param3,Vector3.DOWN,name_73.name_252,10000000000,null,_loc10_))
         {
            _loc8_ = this.var_772[param4];
            if(_loc8_ == null)
            {
               _loc8_ = new name_1501();
               this.var_772[param4] = _loc8_;
            }
            _loc9_ = name_1500.create(param1,param4,param2,this.var_773,param6,param5,this.var_771,this);
            _loc9_.name_731(_loc10_.position,_loc10_.normal);
            if(param7)
            {
               _loc9_.name_1503();
            }
            _loc8_.method_1046(_loc9_);
            this.var_770[param1] = _loc9_;
            _loc9_.name_1511 = this.method_1052() <= 500;
            _loc9_.name_1322();
         }
      }
      
      private function method_1052() : int
      {
         var _loc2_:* = undefined;
         var _loc1_:int = 0;
         for(_loc2_ in this.var_770)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      private function method_1050() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:name_1501 = null;
         var _loc3_:name_1500 = null;
         for(_loc1_ in this.var_772)
         {
            _loc2_ = this.var_772[_loc1_];
            _loc2_.name_1508();
            delete this.var_772[_loc1_];
         }
         for(_loc1_ in this.var_770)
         {
            _loc3_ = this.var_770[_loc1_];
            _loc3_.name_1327();
            delete this.var_770[_loc1_];
         }
         this.var_769 = null;
      }
      
      private function method_1054(param1:Tanks3DSResource) : void
      {
         this.var_773 = Mesh(param1.objects[0]);
         if(this.var_773.sorting != Sorting.AVERAGE_Z)
         {
            this.var_773.sorting = Sorting.AVERAGE_Z;
            this.var_773.calculateFacesNormals(true);
         }
      }
      
      private function method_1051(param1:name_1500, param2:name_1501) : void
      {
         delete this.var_770[param1.id];
         param1.name_1327();
         param2.method_1051(param1);
      }
      
      private function name_195(param1:Sound, param2:Vector3, param3:Number) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc4_:Sound3D = Sound3D.create(param1,name_89.name_191,name_89.name_229,name_89.name_250,param3);
         this.var_11.name_195(Sound3DEffect.create(var_138.objectPool,null,param2,_loc4_,0));
      }
      
      private function method_1049(param1:MultiframeImageResource, param2:int, param3:FrameSize) : name_1072
      {
         var _loc4_:name_1072 = GraphicsUtils.name_1073(var_58.textureMaterialRegistry as TextureMaterialRegistry,param1.data,param1.frameWidth,param1.frameHeight,param1.numFrames);
         _loc4_.material.resolution = param2;
         _loc4_.fps = param1.fps;
         param3.height = param1.frameHeight * param2;
         param3.width = param1.frameWidth * param2;
         return _loc4_;
      }
      
      private function method_1045(param1:BitmapData) : TextureMaterial
      {
         return var_58.textureMaterialRegistry.getMaterial(null,param1,1);
      }
      
      private function method_1047(param1:TankData) : Material
      {
         switch(param1.teamType)
         {
            case BattleTeamType.NONE:
               return param1 == TankData.localTankData ? this.var_780 : this.var_774;
            case BattleTeamType.BLUE:
               return this.var_783;
            case BattleTeamType.RED:
               return this.var_784;
            default:
               return this.var_774;
         }
      }
   }
}

import flash.display.BitmapData;
import platform.client.fp10.core.resource.types.MultiframeImageResource;

class InitParams
{
    
   
   public var blueMineTexture:BitmapData;
   
   public var redMineTexture:BitmapData;
   
   public var enemyMineTexture:BitmapData;
   
   public var friendlyMineTexture:BitmapData;
   
   public var idleExplosionTexture:MultiframeImageResource;
   
   public var mainExplosionTexture:MultiframeImageResource;
   
   public function InitParams(param1:BitmapData, param2:BitmapData, param3:BitmapData, param4:BitmapData, param5:MultiframeImageResource, param6:MultiframeImageResource)
   {
      super();
      this.blueMineTexture = param1;
      this.redMineTexture = param2;
      this.enemyMineTexture = param3;
      this.friendlyMineTexture = param4;
      this.idleExplosionTexture = param5;
      this.mainExplosionTexture = param6;
   }
}

class FrameSize
{
    
   
   public var width:int;
   
   public var height:int;
   
   public function FrameSize()
   {
      super();
   }
}
