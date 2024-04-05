package package_79
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import alternativa.osgi.service.dump.name_524;
   import alternativa.physics.collision.name_774;
   import alternativa.physics.name_660;
   import alternativa.physics.name_889;
   import alternativa.tanks.engine3d.MaterialSequence;
   import alternativa.tanks.engine3d.name_1076;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.gui.name_80;
   import alternativa.tanks.models.battlefield.name_128;
   import alternativa.tanks.models.battlefield.name_652;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.class_7;
   import alternativa.tanks.services.materialregistry.name_100;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_24.LogLevel;
   import package_246.BattlefieldMessages;
   import package_278.name_1288;
   import package_284.CaptureTheFlagModelBase;
   import package_284.name_1297;
   import package_284.name_1298;
   import package_284.name_994;
   import package_32.class_2;
   import package_32.name_245;
   import package_33.GameActionEnum;
   import package_34.class_3;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_40.TankSpawnState;
   import package_41.Vector3dData;
   import package_47.BattleTeamType;
   import package_54.name_102;
   import package_6.ObjectRegister;
   import package_60.TextConst;
   import package_7.name_11;
   import package_7.name_32;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class CTFModel extends CaptureTheFlagModelBase implements class_2, name_994, class_36, class_11, name_652, class_3
   {
      
      public static var battleInputService:name_245;
      
      private static const const_407:Number = 2.5;
      
      private static var var_58:name_100;
      
      public static const const_405:uint = 15741974;
      
      public static const const_401:uint = 4691967;
      
      public static const const_400:uint = 65280;
      
      public static const const_406:uint = 16776960;
      
      private static var FLAG_LOCK_DURATION:name_1288 = new name_1288("FLAG_LOCK_DURATION");
       
      
      private const const_408:int = 85;
      
      private const const_398:int = 176;
      
      private var var_591:Boolean;
      
      private var flagLockTime:name_1288;
      
      private var var_590:name_80;
      
      private var var_11:BattlefieldModel;
      
      private var var_13:class_7;
      
      private var var_117:name_128;
      
      private var flags:Dictionary;
      
      private var var_588:TankData;
      
      private var var_589:BattlefieldMessages;
      
      private var messages:Object;
      
      private const const_402:String = "taken";
      
      private const const_403:String = "lost";
      
      private const const_404:String = "returned";
      
      private const const_399:String = "captured";
      
      private var var_592:String;
      
      private var var_593:String;
      
      private var flagDropSound:Sound;
      
      private var flagReturnSound:Sound;
      
      private var flagTakeSound:Sound;
      
      private var winSound:Sound;
      
      private var pos:Vector3;
      
      private var pos3d:Vector3dData;
      
      private var posRedFlag:Vector3;
      
      private var posBlueFlag:Vector3;
      
      private var locale:name_102;
      
      public function CTFModel()
      {
         this.flagLockTime = new name_1288("flagLockTime");
         this.pos = new Vector3();
         this.pos3d = new Vector3dData(0,0,0);
         super();
         FLAG_LOCK_DURATION.value = 5000;
         var_365.push(name_66,name_994,class_11,class_36);
      }
      
      public function initObject(param1:ClientObject, param2:Vector3, param3:Vector3) : void
      {
         var_58 = name_100(Main.osgi.name_6(name_100));
         var _loc4_:FlagData = new FlagData(method_771().redFlagSprite,method_771().redPedestalModel);
         var _loc5_:FlagData = new FlagData(method_771().blueFlagSprite,method_771().bluePedestalModel);
         param1.method_12(CTFModel,new InitParams(_loc4_,_loc5_));
         this.flagDropSound = method_771().sounds.flagDropSound.sound;
         this.flagReturnSound = method_771().sounds.flagReturnSound.sound;
         this.flagTakeSound = method_771().sounds.flagTakeSound.sound;
         this.winSound = method_771().sounds.winSound.sound;
         this.method_814();
         this.posBlueFlag = param2;
         this.posRedFlag = param3;
         this.objectLoaded(null);
         var _loc6_:name_524 = name_524(Main.osgi.name_6(name_524));
         if(_loc6_ != null)
         {
            _loc6_.registerDumper(this);
         }
      }
      
      public function method_816(param1:ClientObject, param2:name_1297) : void
      {
         if(param2 == null)
         {
            name_11.log(LogLevel.name_79,"CTFModel::initFlagsState Null state received");
            throw new ArgumentError("State cannot be null");
         }
         if(this.flags != null)
         {
            name_11.log(LogLevel.name_79,"CTFModel::initFlagsState Called more than once");
            return;
         }
         var _loc3_:InitParams = InitParams(param1.method_19(CTFModel));
         if(_loc3_ == null)
         {
            name_11.log(LogLevel.name_79,"CTFModel::initFlagsState Init params not found");
            return;
         }
         this.flags = new Dictionary();
         this.method_810(BattleTeamType.BLUE,param2.blueFlag,_loc3_.blueFlagData);
         this.method_810(BattleTeamType.RED,param2.redFlag,_loc3_.redFlagData);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:name_32 = name_32(Main.osgi.name_6(name_32));
         this.var_590 = Main.osgi.name_6(name_80) as name_80;
         this.var_11 = BattlefieldModel(Main.osgi.name_6(name_83));
         this.var_11.method_152(this);
         this.var_117 = this.var_11.getBattlefieldData();
         this.var_13 = Main.osgi.name_6(class_7) as class_7;
         this.var_589 = this.var_11.messages;
         battleInputService.name_219(this);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc3_:name_313 = null;
         var _loc2_:name_524 = name_524(Main.osgi.name_6(name_524));
         if(_loc2_ != null)
         {
            _loc2_.unregisterDumper(this.dumperName);
         }
         battleInputService.name_150(this);
         if(this.flags != null)
         {
            for each(_loc3_ in this.flags)
            {
               _loc3_.dispose();
            }
            this.flags = null;
         }
         this.var_11.method_150(this);
         this.var_590 = null;
         this.var_11 = null;
         this.var_117 = null;
         this.var_588 = null;
      }
      
      public function flagTaken(param1:ClientObject, param2:String, param3:BattleTeamType) : void
      {
         var _loc6_:FlagMessage = null;
         var _loc7_:String = null;
         if(this.flags == null)
         {
            name_11.log(LogLevel.name_79,"CTFModel::flagTaken() flags are not initialized");
            return;
         }
         var _loc4_:name_313 = this.flags[param3];
         var _loc5_:TankData = this.getTankData(param2,null);
         _loc4_.name_1291(param2,_loc5_);
         if(this.var_590 != null)
         {
            if(this.var_588 != null)
            {
               _loc6_ = this.method_807("taken",this.var_588.teamType != param3);
               if(_loc5_ != null)
               {
                  this.var_589.addMessage(_loc6_.color,_loc5_.userName + " " + _loc6_.text);
               }
               this.var_590.logUserAction(param2,_loc6_.text);
            }
            else if(this.var_11.spectatorMode)
            {
               if(_loc5_ != null)
               {
                  _loc7_ = String(this.locale.getText(TextConst.const_359));
                  switch(_loc5_.teamType)
                  {
                     case BattleTeamType.RED:
                        this.var_589.addMessage(15741974,_loc5_.userName + " " + _loc7_);
                        break;
                     case BattleTeamType.BLUE:
                        this.var_589.addMessage(4691967,_loc5_.userName + " " + _loc7_);
                        break;
                     case BattleTeamType.NONE:
                        this.var_589.addMessage(16776960,_loc5_.userName + " " + _loc7_);
                  }
                  this.var_590.logUserAction(param2,_loc7_);
               }
            }
            this.var_11.soundManager.playSound(this.flagTakeSound,0,1);
         }
         this.var_590.method_628(param3);
         _loc4_.takeCommandSent = false;
         name_313(this.flags[param3 == BattleTeamType.RED ? BattleTeamType.BLUE : BattleTeamType.RED]).takeCommandSent = false;
      }
      
      public function returnFlagToBase(param1:ClientObject, param2:BattleTeamType, param3:String) : void
      {
         var _loc4_:FlagMessage = null;
         var _loc5_:String = null;
         var _loc6_:TankData = null;
         this.method_806(param2);
         if(this.var_588 != null)
         {
            _loc4_ = this.method_807("returned",this.var_588.teamType == param2);
            if(param3 == null || param3 == "null")
            {
               _loc5_ = this.var_588.teamType == param2 ? this.var_592 : this.var_593;
               this.var_589.addMessage(_loc4_.color,_loc5_);
               this.var_590.method_634(_loc5_);
            }
            else
            {
               _loc6_ = this.getTankData(param3,null);
               if(_loc6_ != null)
               {
                  this.var_589.addMessage(_loc4_.color,_loc6_.userName + " " + _loc4_.text);
                  this.var_590.logUserAction(param3,_loc4_.text);
               }
            }
         }
         else if(this.var_11.spectatorMode)
         {
            if(param3 == null || param3 == "null")
            {
               if(param2 == BattleTeamType.RED)
               {
                  _loc5_ = String(this.locale.getText(TextConst.CTF_RED_FLAG_RETURNED));
                  this.var_589.addMessage(15741974,_loc5_);
               }
               else
               {
                  _loc5_ = String(this.locale.getText(TextConst.CTF_BLUE_FLAG_RETURNED));
                  this.var_589.addMessage(4691967,_loc5_);
               }
               this.var_590.method_634(_loc5_);
            }
            else
            {
               _loc6_ = this.getTankData(param3,null);
               if(_loc6_ != null)
               {
                  _loc5_ = String(this.locale.getText(TextConst.const_240));
                  switch(_loc6_.teamType)
                  {
                     case BattleTeamType.RED:
                        this.var_589.addMessage(15741974,_loc6_.userName + " " + _loc5_);
                        break;
                     case BattleTeamType.BLUE:
                        this.var_589.addMessage(4691967,_loc6_.userName + " " + _loc5_);
                        break;
                     case BattleTeamType.NONE:
                        this.var_589.addMessage(16776960,_loc6_.userName + " " + _loc5_);
                  }
                  this.var_590.logUserAction(param3,_loc5_);
               }
            }
         }
         this.var_11.soundManager.playSound(this.flagReturnSound,0,1);
      }
      
      public function dropFlag(param1:ClientObject, param2:Vector3dData, param3:BattleTeamType) : void
      {
         var _loc5_:FlagMessage = null;
         var _loc6_:String = null;
         if(this.flags == null)
         {
            name_11.log(LogLevel.name_79,"CTFModel::flagTaken flags are not initialized");
            return;
         }
         var _loc4_:name_313 = this.flags[param3];
         if(this.var_590 != null && _loc4_.name_1286 != null)
         {
            if(this.var_588 != null)
            {
               _loc5_ = this.method_807("lost",this.var_588.teamType == param3);
               this.var_589.addMessage(_loc5_.color,_loc4_.name_1286.userName + " " + _loc5_.text);
               this.var_590.logUserAction(_loc4_.name_1290,_loc5_.text);
            }
            else if(this.var_11.spectatorMode)
            {
               _loc6_ = String(this.locale.getText(TextConst.const_208));
               switch(_loc4_.name_1286.teamType)
               {
                  case BattleTeamType.RED:
                     this.var_589.addMessage(15741974,_loc4_.name_1286.userName + " " + _loc6_);
                     break;
                  case BattleTeamType.BLUE:
                     this.var_589.addMessage(4691967,_loc4_.name_1286.userName + " " + _loc6_);
                     break;
                  case BattleTeamType.NONE:
                     this.var_589.addMessage(16776960,_loc4_.name_1286.userName + " " + _loc6_);
               }
               this.var_590.logUserAction(_loc4_.name_1286.userName,_loc6_);
            }
            this.var_11.soundManager.playSound(this.flagDropSound,0,1);
            if(_loc4_.name_1286 == this.var_588 && this.var_591)
            {
               this.var_591 = false;
               this.flagLockTime.value = getTimer() + FLAG_LOCK_DURATION.value;
            }
         }
         this.pos.x = param2.x;
         this.pos.y = param2.y;
         this.pos.z = param2.z;
         _loc4_.name_1294(this.pos,this.var_117.name_247);
         this.var_590.method_635(param3);
      }
      
      public function flagDelivered(param1:ClientObject, param2:BattleTeamType, param3:String) : void
      {
         var _loc6_:FlagMessage = null;
         var _loc7_:String = null;
         if(this.flags == null)
         {
            name_11.log(LogLevel.name_79,"CTFModel::flagTaken flags are not initialized");
            return;
         }
         var _loc4_:BattleTeamType = param2 == BattleTeamType.RED ? BattleTeamType.BLUE : BattleTeamType.RED;
         this.method_806(_loc4_);
         var _loc5_:TankData = this.getTankData(param3,null);
         if(_loc5_ != null)
         {
            if(this.var_588 != null)
            {
               _loc6_ = this.method_807("captured",this.var_588.teamType == param2);
               this.var_589.addMessage(_loc6_.color,_loc5_.userName + " " + _loc6_.text);
               this.var_590.logUserAction(param3,_loc6_.text);
            }
            else if(this.var_11.spectatorMode)
            {
               _loc7_ = String(this.locale.getText(TextConst.const_357));
               switch(_loc5_.teamType)
               {
                  case BattleTeamType.RED:
                     this.var_589.addMessage(15741974,_loc5_.userName + " " + _loc7_);
                     break;
                  case BattleTeamType.BLUE:
                     this.var_589.addMessage(4691967,_loc5_.userName + " " + _loc7_);
                     break;
                  case BattleTeamType.NONE:
                     this.var_589.addMessage(16776960,_loc5_.userName + " " + _loc7_);
               }
               this.var_590.logUserAction(param3,_loc7_);
            }
            this.var_11.soundManager.playSound(this.winSound,0,1);
         }
      }
      
      public function get name_750() : String
      {
         return "Capture The Flag";
      }
      
      public function startBattle() : void
      {
      }
      
      public function restartBattle() : void
      {
         this.method_806(BattleTeamType.BLUE);
         this.method_806(BattleTeamType.RED);
      }
      
      public function finishBattle() : void
      {
         this.var_591 = false;
      }
      
      public function tick(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         var _loc5_:name_313 = null;
         var _loc6_:name_313 = null;
         var _loc7_:name_313 = null;
         if(this.flags == null)
         {
            return;
         }
         if(this.var_588 != null && this.var_588.enabled)
         {
            _loc6_ = this.flags[this.var_588.teamType];
            _loc7_ = this.flags[this.var_588.teamType == BattleTeamType.RED ? BattleTeamType.BLUE : BattleTeamType.RED];
            if(_loc7_.state != name_1287.CARRIED && param1 > this.flagLockTime.value)
            {
               this.method_809(_loc7_);
            }
            else if(_loc7_.name_1286 == this.var_588 && _loc6_.state == name_1287.AT_BASE)
            {
               this.method_809(_loc6_);
            }
            if(_loc6_.state == name_1287.DROPPED)
            {
               this.method_809(_loc6_);
            }
         }
         for each(_loc5_ in this.flags)
         {
            _loc5_.update(param2);
         }
      }
      
      public function addUser(param1:ClientObject) : void
      {
      }
      
      public function removeUser(param1:ClientObject) : void
      {
      }
      
      public function addUserToField(param1:ClientObject) : void
      {
         var _loc3_:name_313 = null;
         var _loc2_:TankData = this.var_13.getTankData(param1);
         if(this.var_117.name_700 == param1)
         {
            this.var_588 = _loc2_;
         }
         if(this.flags != null)
         {
            for each(_loc3_ in this.flags)
            {
               if(_loc3_.state == name_1287.CARRIED && _loc3_.name_1290 == param1.id)
               {
                  _loc3_.name_1291(_loc3_.name_1290,_loc2_);
                  break;
               }
            }
         }
      }
      
      public function removeUserFromField(param1:ClientObject) : void
      {
      }
      
      public function get dumperName() : String
      {
         return "ctf";
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         var _loc3_:name_313 = null;
         var _loc2_:String = "\n=== CaptureTheFlagModel dump ===\n";
         if(this.flags != null)
         {
            for each(_loc3_ in this.flags)
            {
               _loc2_ += _loc3_.toString() + "\n";
            }
         }
         _loc2_ += "dropCommandSent=" + this.var_591 + "\n";
         return _loc2_ + "=== End of CaptureTheFlagModel dump ===";
      }
      
      public function method_805(param1:Vector3, param2:Number, param3:BattleTeamType) : Boolean
      {
         if(this.flags == null)
         {
            return false;
         }
         var _loc4_:name_313 = this.flags[param3];
         if(_loc4_ == null)
         {
            return false;
         }
         var _loc5_:Vector3 = _loc4_.name_1293;
         var _loc6_:Number = _loc5_.x - param1.x;
         var _loc7_:Number = _loc5_.y - param1.y;
         var _loc8_:Number = _loc5_.z - param1.z;
         return _loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_ < param2;
      }
      
      public function method_804(param1:TankData) : Boolean
      {
         var _loc2_:BattleTeamType = param1.teamType == BattleTeamType.BLUE ? BattleTeamType.RED : BattleTeamType.BLUE;
         var _loc3_:name_313 = this.flags[_loc2_];
         return _loc3_.name_1286 == param1;
      }
      
      private function method_810(param1:BattleTeamType, param2:name_1298, param3:FlagData) : void
      {
         var _loc7_:Object3D = null;
         var _loc9_:TankData = null;
         var _loc4_:MaterialSequence = var_58.method_499.name_1296(name_1076.name_1079,param3.flagSprite.data,85,2.5);
         var _loc5_:Vector3 = param2.name_1300;
         var _loc6_:name_313 = new name_313(param1,_loc5_,85,176,_loc4_.materials,param3.flagSprite.data,this.var_117.name_247);
         this.flags[param1] = _loc6_;
         _loc6_.name_742(this.var_117.viewport.name_257());
         if(param2.name_1292 != null)
         {
            _loc9_ = this.getTankData(param2.name_1292,this.var_117.bfObject.register);
            _loc6_.name_1291(param2.name_1292,_loc9_);
            this.var_590.method_628(param1);
         }
         else if(param2.name_1289 != null)
         {
            _loc5_.x = param2.name_1289.x;
            _loc5_.y = param2.name_1289.y;
            _loc5_.z = param2.name_1289.z;
            if(!_loc6_.name_1302())
            {
               _loc6_.name_1294(_loc5_,this.var_117.name_247);
            }
            else
            {
               _loc6_.name_1295();
            }
            this.var_590.method_635(param1);
         }
         _loc7_ = this.method_815(param3.pedestalModel);
         var _loc8_:Vector3 = _loc6_.name_1293.vClone();
         _loc8_.z -= name_313.name_1301 - 1;
         _loc7_.x = _loc8_.x;
         _loc7_.y = _loc8_.y;
         _loc7_.z = _loc8_.z;
         this.var_117.viewport.name_257().addChild(_loc7_);
      }
      
      private function method_815(param1:Tanks3DSResource) : Object3D
      {
         var _loc2_:BitmapData = null;
         var _loc3_:Mesh = Mesh(param1.objects[0]);
         var _loc4_:BSP = new BSP();
         _loc4_.createTree(_loc3_);
         if(param1.textures == null)
         {
            _loc2_ = new StubBitmapData(16776960);
         }
         else
         {
            _loc2_ = param1.method_765(0);
            if(_loc2_ == null)
            {
               _loc2_ = new StubBitmapData(16776960);
            }
         }
         var _loc5_:TextureMaterial = var_58.textureMaterialRegistry.getMaterial(null,_loc2_,2);
         _loc5_.resolution = 1;
         _loc4_.setMaterialToAllFaces(_loc5_);
         return _loc4_;
      }
      
      private function method_806(param1:BattleTeamType) : void
      {
         if(this.flags == null)
         {
            name_11.log(LogLevel.name_79,"CTFModel::returnFlag() flags are not initialized");
            return;
         }
         var _loc2_:name_313 = this.flags[param1];
         _loc2_.name_1295();
         _loc2_ = this.flags[_loc2_.teamType == BattleTeamType.RED ? BattleTeamType.BLUE : BattleTeamType.RED];
         _loc2_.takeCommandSent = false;
         this.var_590.method_633(param1);
      }
      
      private function method_809(param1:name_313) : void
      {
         var _loc4_:name_774 = null;
         if(param1.takeCommandSent || this.var_588 == null || this.var_588.name_87 == TankSpawnState.NEWCOME || this.var_588.name_87 == TankSpawnState.SUICIDE)
         {
            return;
         }
         var _loc2_:name_660 = this.var_588.tank;
         var _loc3_:name_889 = _loc2_.var_302.head;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_.name_899;
            if(this.var_117.name_247.method_698(_loc4_,param1.name_1299))
            {
               param1.takeCommandSent = true;
               this.method_812(this.var_117.bfObject,param1.teamType);
               return;
            }
            _loc3_ = _loc3_.next;
         }
      }
      
      private function method_812(param1:ClientObject, param2:BattleTeamType) : void
      {
         var _loc3_:Vector3 = this.var_588.tank.state.position;
         Network(Main.osgi.name_6(name_2)).send("battle;attempt_to_take_flag;" + param2.getValue() + ";" + _loc3_.x + ";" + _loc3_.y + ";" + _loc3_.z);
      }
      
      private function method_161(param1:Event) : void
      {
         if(this.var_589 != null)
         {
            this.var_589.x = 0.5 * Main.stage.stageWidth;
            this.var_589.y = 40;
         }
      }
      
      private function method_814() : void
      {
         if(this.messages != null)
         {
            return;
         }
         this.messages = {};
         this.locale = name_102(Main.osgi.name_6(name_102));
         this.method_808("taken",this.locale,TextConst.CTF_GOT_ENEMY_FLAG,65280,TextConst.CTF_GOT_OUR_FLAG,16776960);
         this.method_808("lost",this.locale,TextConst.CTF_LOST_OUR_FLAG,65280,TextConst.CTF_LOST_ENEMY_FLAG,16776960);
         this.method_808("returned",this.locale,TextConst.CTF_RETURNED_OUR_FLAG,65280,TextConst.CTF_RETURNED_ENEMY_FLAG,16776960);
         this.method_808("captured",this.locale,TextConst.CTF_CAPTURED_ENEMY_FLAG,65280,TextConst.CTF_CAPTURED_OUR_FLAG,16776960);
         this.var_592 = this.locale.getText(TextConst.CTF_OUR_FLAG_RETURNED);
         this.var_593 = this.locale.getText(TextConst.CTF_ENEMY_FLAG_RETURNED);
      }
      
      private function method_808(param1:String, param2:name_102, param3:String, param4:uint, param5:String, param6:uint) : void
      {
         var _loc7_:FlagMessage = new FlagMessage(param2.getText(param3),param4);
         var _loc8_:FlagMessage = new FlagMessage(param2.getText(param5),param6);
         this.messages[param1] = new FlagActionMessages(_loc7_,_loc8_);
      }
      
      private function method_807(param1:String, param2:Boolean) : FlagMessage
      {
         var _loc3_:FlagActionMessages = this.messages[param1];
         return param2 ? _loc3_.positive : _loc3_.negative;
      }
      
      private function getTankData(param1:String, param2:ObjectRegister) : TankData
      {
         var _loc3_:ClientObject = BattleController.tankClientObjectByTankId[param1];
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:TankData = this.var_13.getTankData(_loc3_);
         if(_loc4_ == null || _loc4_.tank == null)
         {
            return null;
         }
         return _loc4_;
      }
      
      public function method_28(param1:GameActionEnum, param2:Boolean) : void
      {
         if(param1 == GameActionEnum.DROP_FLAG && param2)
         {
            this.method_813();
         }
      }
      
      private function method_813() : void
      {
         if(this.flags == null || this.var_117 == null || this.var_588 == null || this.var_591 || !this.var_13.userControlsEnabled)
         {
            return;
         }
         var _loc1_:name_313 = this.flags[this.var_588.teamType == BattleTeamType.BLUE ? BattleTeamType.RED : BattleTeamType.BLUE];
         if(_loc1_ == null || _loc1_.name_1286 != this.var_588)
         {
            return;
         }
         var _loc2_:Vector3 = this.var_588.tank.state.position;
         this.pos3d.x = _loc2_.x;
         this.pos3d.y = _loc2_.y;
         this.pos3d.z = _loc2_.z;
         this.var_591 = true;
         this.method_811(this.var_117.bfObject,this.pos3d);
      }
      
      private function method_811(param1:ClientObject, param2:Vector3dData) : void
      {
         var _loc3_:Object = new Object();
         _loc3_.x = param2.x;
         _loc3_.y = param2.y;
         _loc3_.z = param2.z;
         Network(Main.osgi.name_6(name_2)).send("battle;flag_drop;" + JSON.stringify(_loc3_));
      }
   }
}

class InitParams
{
    
   
   public var redFlagData:FlagData;
   
   public var blueFlagData:FlagData;
   
   public function InitParams(param1:FlagData, param2:FlagData)
   {
      super();
      this.redFlagData = param1;
      this.blueFlagData = param2;
   }
}

import platform.client.fp10.core.resource.types.ImageResource;
import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;

class FlagData
{
    
   
   public var flagSprite:ImageResource;
   
   public var pedestalModel:Tanks3DSResource;
   
   public function FlagData(param1:ImageResource, param2:Tanks3DSResource)
   {
      super();
      this.flagSprite = param1;
      this.pedestalModel = param2;
   }
}

class FlagMessage
{
    
   
   public var text:String;
   
   public var color:uint;
   
   public function FlagMessage(param1:String, param2:uint)
   {
      super();
      this.text = param1;
      this.color = param2;
   }
}

class FlagActionMessages
{
    
   
   public var positive:FlagMessage;
   
   public var negative:FlagMessage;
   
   public function FlagActionMessages(param1:FlagMessage, param2:FlagMessage)
   {
      super();
      this.positive = param1;
      this.negative = param2;
   }
}
