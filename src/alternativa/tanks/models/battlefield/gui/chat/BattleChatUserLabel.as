package alternativa.tanks.models.battlefield.gui.chat
{
   import alternativa.tanks.model.friends.FriendsService;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import controls.base.LabelBase;
   import filters.name_1131;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import package_1.Main;
   import package_297.name_1138;
   import package_390.ChatUserLabel;
   import package_4.ClientObject;
   import package_40.TankSpawnState;
   import package_58.name_112;
   
   public class BattleChatUserLabel extends ChatUserLabel
   {
       
      
      private var var_3558:LabelBase;
      
      public function BattleChatUserLabel(param1:String, param2:int, param3:Boolean = true, param4:int = 0)
      {
         var _loc5_:ClientObject = null;
         var _loc6_:TankData = null;
         this.var_3558 = new LabelBase();
         var_1557 = param1;
         var_1550 = param2;
         var_845 = param4;
         var_2590 = false;
         var_2589 = param3;
         var _loc7_:Boolean = false;
         if(BattlefieldModel(Main.osgi.getService(IBattleField)).spectatorMode)
         {
            _loc5_ = BattleController.tankClientObjectByTankId[param1];
            if(_loc5_ != null)
            {
               _loc6_ = TankModel(Main.osgi.getService(ITank)).getTankData(_loc5_);
               if(_loc6_ != null)
               {
                  _loc7_ = _loc6_.name_87 == TankSpawnState.ACTIVE;
               }
            }
         }
         this.var_2588 = _loc7_;
         super(param1);
         if(!self)
         {
            addEventListener(MouseEvent.MOUSE_OVER,this.method_1530);
            addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
      }
      
      override protected function method_2565() : Array
      {
         return name_1131.name_1147;
      }
      
      protected function method_3181() : Array
      {
         return name_1131.const_1750;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         var_2577.filters = this.method_2565();
         this.var_3558.filters = this.method_2565();
      }
      
      private function method_1530(param1:MouseEvent) : void
      {
         var_2577.filters = this.method_3181();
         this.var_3558.filters = this.method_3181();
      }
      
      override protected function method_2555(param1:MouseEvent) : void
      {
         super.method_2555(param1);
      }
      
      override protected function method_2561() : void
      {
         var _loc3_:TankData = null;
         var _loc4_:int = 0;
         var _loc5_:Bitmap = null;
         method_2554(var_1557);
         name_122(var_1550);
         method_2558(FriendsService.method_1174(var_913));
         var _loc1_:ClientObject = BattleController.tankClientObjectByTankId[userId];
         var _loc2_:name_112 = null;
         if(_loc1_ != null)
         {
            _loc3_ = TankModel(Main.osgi.getService(ITank)).getTankData(_loc1_);
            if(_loc3_ != null && _loc3_.object != null)
            {
               if(_loc3_.object.gameClass == null)
               {
                  return;
               }
               _loc2_ = name_112(_loc3_.object.name_176(name_112));
               _loc4_ = int(_loc2_.getResistance(false));
               _loc5_ = null;
               if(_loc4_ > 0)
               {
                  _loc5_ = name_1138.method_2074(_loc3_);
                  _loc5_.y += 4;
                  _loc5_.x = var_1554.x + var_1554.textWidth + 7;
                  var_2577.addChild(_loc5_);
                  this.var_3558.text = _loc4_ == 100 ? "??" : _loc4_.toString();
                  addChild(this.var_3558);
                  this.var_3558.x = _loc5_.x + 3;
                  this.var_3558.color = MessageColor.name_1140;
                  this.var_3558.filters = this.method_2565();
               }
            }
         }
      }
      
      override protected function method_2566() : void
      {
         super.method_2566();
         var_1554.antiAliasType = AntiAliasType.ADVANCED;
         var_1554.thickness = 150;
         var_1554.sharpness = 200;
      }
   }
}
