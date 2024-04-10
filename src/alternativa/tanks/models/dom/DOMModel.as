package alternativa.tanks.models.dom
{
   import alternativa.model.class_11;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.gui.IBattlefieldGUI;
   import alternativa.tanks.models.battlefield.name_128;
   import alternativa.tanks.models.battlefield.name_652;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.dom.hud.KeyPointMarkers;
   import alternativa.tanks.models.dom.hud.KeyPointView;
   import alternativa.tanks.models.dom.hud.name_2231;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.services.objectpool.IObjectPoolService;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_132;
   import alternativa.tanks.sfx.name_89;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_292.KeyPointsHUDPanel;
   import package_330.name_1592;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_408.ControlPointsModelBase;
   import package_409.ControlPointMessages;
   import package_409.name_2229;
   import package_410.BeamEffects;
   import package_410.DominationBeamEffect;
   import package_410.name_2230;
   import package_47.BattleTeamType;
   import package_7.name_32;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class DOMModel extends ControlPointsModelBase implements IDOMModel, class_11, name_652
   {
      
      private static var var_138:IObjectPoolService;
      
      private static var var_58:TextureMaterialRegistry;
      
      public static var var_588:TankData;
       
      
      private var points:Vector.<Point>;
      
      private var var_1754:Dictionary;
      
      private var var_1757:Dictionary;
      
      private var var_13:ITank;
      
      private var var_11:BattlefieldModel;
      
      private var var_1756:BeamEffects;
      
      private var var_1758:name_2230;
      
      private var var_1755:KeyPointMarkers;
      
      private var var_117:name_128;
      
      private var startCapturingSound:Sound;
      
      private var stopCapturingSound:Sound;
      
      private var pointCapturedSound:Sound;
      
      private var enemyPointCapturedSound:Sound;
      
      private var enemyLostPointSound:Sound;
      
      private var lostPointSound:Sound;
      
      private var var_590:IBattlefieldGUI;
      
      private var var_1759:Vector.<KeyPointsHUDPanel>;
      
      public function DOMModel()
      {
         this.var_1754 = new Dictionary();
         this.var_1757 = new Dictionary();
         this.var_1759 = new Vector.<KeyPointsHUDPanel>();
         super();
         this.points = new Vector.<Point>();
         var_138 = IObjectPoolService(Main.osgi.getService(IObjectPoolService));
         var_58 = IMaterialRegistry(OSGi.getInstance().getService(IMaterialRegistry)).textureMaterialRegistry as TextureMaterialRegistry;
         var _loc1_:name_32 = name_32(Main.osgi.getService(name_32));
         this.var_11 = Main.osgi.getService(IBattleField) as BattlefieldModel;
         this.var_590 = Main.osgi.getService(IBattlefieldGUI) as IBattlefieldGUI;
         this.var_11.method_152(this);
         this.var_117 = this.var_11.getBattlefieldData();
         this.var_13 = Main.osgi.getService(ITank) as ITank;
         this.var_1756 = new BeamEffects(this.var_11);
         this.var_1755 = new KeyPointMarkers(this.var_11.var_117.viewport.camera,this.var_11);
         this.var_11.var_117.viewport.name_755(this.var_1755,0);
      }
      
      private static function method_1934(param1:String) : BattleTeamType
      {
         if(param1 == "red")
         {
            return BattleTeamType.RED;
         }
         if(param1 == "blue")
         {
            return BattleTeamType.BLUE;
         }
         return BattleTeamType.NONE;
      }
      
      public function initObject(param1:Vector.<name_1592>) : void
      {
         var _loc3_:name_1592 = null;
         var _loc4_:String = null;
         var _loc5_:KeyPointView = null;
         var _loc6_:Point = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:Vector3 = null;
         this.startCapturingSound = method_771().sounds.pointCaptureStartPositiveSound.sound;
         this.stopCapturingSound = method_771().sounds.pointCaptureStopPositiveSound.sound;
         this.pointCapturedSound = method_771().sounds.pointCapturedPositiveSound.sound;
         this.enemyPointCapturedSound = method_771().sounds.pointCapturedNegativeSound.sound;
         this.enemyLostPointSound = method_771().sounds.pointNeutralizedPositiveSound.sound;
         this.lostPointSound = method_771().sounds.pointNeutralizedNegativeSound.sound;
         this.var_1758 = new name_2230(var_58,method_771().resources);
         var _loc2_:Vector.<Point> = new Vector.<Point>();
         for each(_loc3_ in param1)
         {
            _loc4_ = _loc3_.id == 0 ? "A" : (_loc3_.id == 1 ? "B" : (_loc3_.id == 2 ? "C" : (_loc3_.id == 3 ? "D" : (_loc3_.id == 4 ? "E" : (_loc3_.id == 5 ? "F" : "G")))));
            _loc5_ = new KeyPointView(_loc4_,this.var_117.viewport,method_771().resources);
            _loc6_ = new Point(_loc3_.id,_loc3_.pos,_loc3_.radius,this,_loc5_);
            this.points.push(_loc6_);
            this.var_1755.name_2237(new name_2231(_loc6_));
            this.var_1754[_loc6_.id] = _loc6_;
            _loc2_.push(_loc6_);
            this.serverSetPointScore(_loc6_.id,_loc3_.score);
            for each(_loc7_ in _loc3_.name_1604)
            {
               this.serverTankCapturingPoint(_loc6_.id,BattleController.tankClientObjectByTankId[_loc7_]);
            }
            _loc8_ = _loc6_.name_2228;
            _loc9_ = _loc3_.pos.vClone();
            _loc9_.z -= 300;
            _loc5_.method_845(this.var_117.viewport,_loc9_);
            if(_loc8_ <= -100)
            {
               _loc5_.method_847();
            }
            else if(_loc8_ >= 100)
            {
               _loc5_.method_848();
            }
            else
            {
               _loc5_.method_846();
            }
         }
         this.var_590.method_630(new KeyPointsHUDPanel(_loc2_));
      }
      
      public function method_1939(param1:Point, param2:TankData) : void
      {
         Network(Main.osgi.getService(INetworker)).send("battle;tank_capturing_point;" + param1.id + ";" + this.method_1935(param2.tank.state.position));
      }
      
      public function method_56(param1:Sound, param2:Point) : void
      {
         var _loc3_:name_132 = this.method_79(param1,param2);
         if(_loc3_ != null)
         {
            this.var_11.name_195(_loc3_);
         }
      }
      
      private function method_79(param1:Sound, param2:Point) : name_132
      {
         var _loc3_:Sound3D = Sound3D.create(param1,name_89.name_191,name_89.name_229,name_89.name_250,1.5);
         return Sound3DEffect.create(var_138.objectPool,null,param2.pos,_loc3_);
      }
      
      public function method_1938(param1:Point, param2:TankData) : void
      {
         Network(Main.osgi.getService(INetworker)).send("battle;tank_leave_capturing_point;" + param1.id);
      }
      
      public function serverSetPointScore(param1:int, param2:int) : void
      {
         var _loc3_:Point = this.var_1754[param1];
         _loc3_.name_2228 = param2;
      }
      
      private function method_1936(param1:BattleTeamType) : name_2229
      {
         if(var_588 == null)
         {
            return ControlPointMessages.name_2236(param1);
         }
         if(param1 == var_588.teamType)
         {
            return ControlPointMessages.name_2234;
         }
         return ControlPointMessages.name_2233;
      }
      
      private function method_1937(param1:BattleTeamType) : name_2229
      {
         if(var_588 == null)
         {
            return ControlPointMessages.method_1937(param1);
         }
         if(param1 == var_588.teamType)
         {
            return ControlPointMessages.name_2232;
         }
         return ControlPointMessages.name_2235;
      }
      
      public function serverPointCapturedBy(param1:String, param2:int) : void
      {
         var _loc3_:Point = this.var_1754[param2];
         var _loc4_:String = param2 == 0 ? "A" : (param2 == 1 ? "B" : (param2 == 2 ? "C" : (param2 == 3 ? "D" : (param2 == 4 ? "E" : (param2 == 5 ? "F" : "G")))));
         var _loc5_:BattleTeamType = method_1934(param1);
         var _loc6_:name_2229 = this.method_1937(_loc5_);
         var _loc7_:String = _loc6_.getMessage(_loc4_);
         this.var_590.logUserAction(null,_loc7_,null);
         this.var_11.messages.addMessage(_loc6_.color,_loc7_);
         if(param1 == "blue")
         {
            _loc3_.view.method_848();
         }
         else
         {
            _loc3_.view.method_847();
         }
         if(var_588 == null)
         {
            return;
         }
         if(var_588.teamType.getValue() == param1.toUpperCase())
         {
            this.method_56(this.pointCapturedSound,_loc3_);
         }
         else
         {
            this.method_56(this.enemyPointCapturedSound,_loc3_);
         }
      }
      
      public function serverPointLostBy(param1:String, param2:int) : void
      {
         var _loc3_:Point = this.var_1754[param2];
         var _loc4_:String = param2 == 0 ? "A" : (param2 == 1 ? "B" : (param2 == 2 ? "C" : (param2 == 3 ? "D" : (param2 == 4 ? "E" : (param2 == 5 ? "F" : "G")))));
         var _loc5_:BattleTeamType = method_1934(param1);
         var _loc6_:name_2229 = this.method_1936(_loc5_);
         var _loc7_:String = _loc6_.getMessage(_loc4_);
         this.var_590.logUserAction(null,_loc7_,null);
         this.var_11.messages.addMessage(_loc6_.color,_loc7_);
         _loc3_.view.method_846();
         if(var_588 == null)
         {
            return;
         }
         if(var_588.teamType.getValue() == param1.toUpperCase())
         {
            this.method_56(this.lostPointSound,_loc3_);
         }
         else
         {
            this.method_56(this.enemyLostPointSound,_loc3_);
         }
      }
      
      public function updatePedestal(param1:int, param2:String) : void
      {
         var _loc3_:Point = this.var_1754[param1];
         if(param2 == "blue")
         {
            _loc3_.view.method_848();
         }
         else if(param2 == "red")
         {
            _loc3_.view.method_847();
         }
         else
         {
            _loc3_.view.method_846();
         }
      }
      
      public function serverTankCapturingPoint(param1:int, param2:ClientObject) : void
      {
         var _loc3_:Point = this.var_1754[param1];
         var _loc4_:TankData = this.var_13.getTankData(param2);
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:DominationBeamEffect = DominationBeamEffect(var_138.objectPool.getObject(DominationBeamEffect));
         var _loc6_:Vector3 = new Vector3();
         _loc3_.name_2238(_loc6_);
         _loc5_.init(_loc4_.tank.skin.name_144(),_loc6_,this.var_1758.name_2239(_loc4_.teamType),new Dictionary());
         this.var_1756.name_672(_loc4_.user,_loc5_);
         this.method_56(this.startCapturingSound,_loc3_);
      }
      
      public function serverTankLeaveCapturingPoint(param1:ClientObject, param2:int) : void
      {
         var _loc3_:Point = this.var_1754[param2];
         this.method_56(this.stopCapturingSound,_loc3_);
         this.var_1756.name_696(param1);
      }
      
      private function method_1935(param1:Vector3) : String
      {
         return param1.x + ";" + param1.y + ";" + param1.z;
      }
      
      public function name_1512(param1:Vector3, param2:Number) : Boolean
      {
         var _loc4_:Point = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc3_:Array = new Array();
         for each(_loc4_ in this.points)
         {
            _loc6_ = _loc4_.pos.distanceToSquared(param1);
            _loc3_[_loc4_.id] = _loc6_;
         }
         _loc5_ = Math.min.apply(null,_loc3_);
         return _loc5_ < param2;
      }
      
      public function tick(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         var _loc5_:Point = null;
         for each(_loc5_ in this.points)
         {
            _loc5_.tick(param1,param2,param3,param4);
            _loc5_.view.update(_loc5_.name_2228 < -100 ? -100 : (_loc5_.name_2228 > 100 ? 100 : _loc5_.name_2228),this.var_117.viewport.camera);
         }
         this.var_590.method_629();
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Point = null;
         for each(_loc2_ in this.points)
         {
            _loc2_.drawDebug(this.var_11.getBattlefieldData().viewport.name_257());
         }
         this.var_1755.show();
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         this.var_11.method_150(this);
         DOMModel.var_588 = null;
      }
      
      public function get name_750() : String
      {
         return "DOM";
      }
      
      public function startBattle() : void
      {
      }
      
      public function restartBattle() : void
      {
      }
      
      public function finishBattle() : void
      {
      }
      
      public function addUser(param1:ClientObject) : void
      {
      }
      
      public function removeUser(param1:ClientObject) : void
      {
      }
      
      public function addUserToField(param1:ClientObject) : void
      {
         var _loc2_:TankData = this.var_13.getTankData(param1);
         if(this.var_117.name_700 == param1)
         {
            var_588 = _loc2_;
         }
         this.var_1757[_loc2_] = _loc2_.tank;
      }
      
      public function removeUserFromField(param1:ClientObject) : void
      {
         var _loc2_:TankData = this.var_13.getTankData(param1);
         delete this.var_1757[_loc2_];
      }
   }
}
