package package_77
{
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import package_1.Main;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_40.TankSpawnState;
   import package_47.BattleTeamType;
   import package_76.name_735;
   import package_90.ContextMenuServiceEvent;
   import package_90.name_308;
   
   public class PlayerCamera implements class_47
   {
      
      public static var contextMenuService:name_308;
       
      
      private var battlefield:BattlefieldModel;
      
      public var var_767:TankData;
      
      private var var_768:SpectatorCameraController;
      
      public function PlayerCamera(param1:SpectatorCameraController)
      {
         super();
         this.var_768 = param1;
         this.battlefield = BattlefieldModel(Main.osgi.getService(IBattleField));
         contextMenuService.addEventListener(ContextMenuServiceEvent.FOCUS_ON_USER,this.method_1040);
      }
      
      private function method_1040(param1:ContextMenuServiceEvent) : void
      {
         this.focus(param1.userId);
      }
      
      public function handleBattleEvent(param1:Tank) : void
      {
         var _loc2_:Tank = param1;
         if(this.var_767.tank == _loc2_)
         {
            this.name_745();
         }
      }
      
      public function method_1036(param1:KeyboardEvent) : void
      {
      }
      
      public function method_190(param1:KeyboardEvent) : void
      {
         this.method_160(param1);
      }
      
      private function method_160(param1:KeyboardEvent) : void
      {
         var _loc2_:TankData = null;
         if(param1.ctrlKey)
         {
            switch(param1.keyCode)
            {
               case Keyboard.F:
                  _loc2_ = this.method_1038(BattleTeamType.NONE);
                  break;
               case Keyboard.B:
                  _loc2_ = this.method_1038(BattleTeamType.BLUE);
                  break;
               case Keyboard.R:
                  _loc2_ = this.method_1038(BattleTeamType.RED);
                  break;
               case Keyboard.U:
                  this.name_745();
            }
            if(Boolean(_loc2_))
            {
               this.method_1037(_loc2_);
            }
         }
         else if(Boolean(this.var_767))
         {
            switch(param1.keyCode)
            {
               case Keyboard.RIGHT:
                  this.method_1042();
                  break;
               case Keyboard.LEFT:
                  this.method_1043();
            }
         }
      }
      
      private function method_1038(param1:BattleTeamType) : TankData
      {
         var _loc9_:* = undefined;
         var _loc2_:TankData = null;
         var _loc3_:Tank = null;
         var _loc4_:Number = NaN;
         var _loc5_:Tank = null;
         var _loc6_:Number = 100000000000000000000;
         var _loc7_:name_735 = this.battlefield.var_117.viewport.camera;
         var _loc8_:Vector3 = new Vector3(_loc7_.x,_loc7_.y,_loc7_.z);
         for(_loc9_ in this.battlefield.var_117.name_263)
         {
            _loc2_ = TankData(_loc9_);
            _loc3_ = this.getTank(_loc2_);
            if(_loc2_.teamType == param1 && _loc2_.name_87 == TankSpawnState.ACTIVE)
            {
               _loc4_ = _loc3_.state.position.distanceTo(_loc8_);
               if(_loc4_ < _loc6_)
               {
                  _loc6_ = _loc4_;
                  _loc5_ = _loc3_;
                  break;
               }
            }
            else
            {
               _loc2_ = null;
            }
         }
         return _loc2_;
      }
      
      public function focus(param1:String) : void
      {
         var _loc2_:ClientObject = BattleController.tankClientObjectByTankId[param1];
         var _loc3_:TankData = null;
         if(_loc2_ != null)
         {
            _loc3_ = TankModel(Main.osgi.getService(ITank)).getTankData(_loc2_);
            if(_loc3_ != null && _loc3_.userName == param1)
            {
               this.method_1037(_loc3_);
            }
         }
      }
      
      private function method_1037(param1:TankData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.name_87 != TankSpawnState.ACTIVE)
         {
            return;
         }
         if(this.var_767 == null)
         {
            this.battlefield.method_200();
         }
         else
         {
            this.method_1039();
         }
         this.var_767 = param1;
         this.battlefield.name_186(param1.tank);
      }
      
      public function name_745() : void
      {
         if(Boolean(this.var_767))
         {
            this.method_1039();
            this.var_767 = null;
            this.var_768.activate(this.battlefield.var_117.viewport.camera);
            this.battlefield.method_174();
         }
      }
      
      private function method_1039() : void
      {
      }
      
      private function method_1042() : void
      {
         this.method_1037(this.method_1041(1));
      }
      
      private function method_1043() : void
      {
         this.method_1037(this.method_1041(-1));
      }
      
      private function method_1041(param1:int) : TankData
      {
         var _loc2_:TankData = null;
         var _loc3_:Vector.<TankData> = this.method_573();
         var _loc4_:int = _loc3_.indexOf(this.var_767);
         if(_loc4_ == -1)
         {
            return null;
         }
         var _loc5_:int = _loc4_;
         while(true)
         {
            _loc5_ += param1;
            if(_loc5_ == -1)
            {
               _loc5_ = _loc3_.length - 1;
            }
            else if(_loc5_ == _loc3_.length)
            {
               _loc5_ = 0;
            }
            _loc2_ = _loc3_[_loc5_];
            if(_loc2_.teamType == this.var_767.teamType && _loc2_.name_87 == TankSpawnState.ACTIVE)
            {
               break;
            }
            if(_loc4_ == _loc5_)
            {
               return null;
            }
         }
         return _loc2_;
      }
      
      private function method_573() : Vector.<TankData>
      {
         var _loc2_:* = undefined;
         var _loc1_:Vector.<TankData> = new Vector.<TankData>();
         for(_loc2_ in this.battlefield.var_117.name_263)
         {
            _loc1_.push(TankData(_loc2_));
         }
         return _loc1_;
      }
      
      private function getTank(param1:TankData) : Tank
      {
         return param1.tank;
      }
      
      public function close() : void
      {
         contextMenuService.removeEventListener(ContextMenuServiceEvent.FOCUS_ON_USER,this.method_1040);
      }
   }
}
