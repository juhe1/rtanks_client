package package_482
{
   import controls.Label;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.name_1139;
   import package_1.Main;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_480.name_3474;
   import package_54.name_102;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class name_3476 extends Sprite
   {
      
      public static var localeService:name_102;
       
      
      private var _data:name_3474;
      
      private var _label:Label;
      
      private var var_3698:Sprite;
      
      private var var_3699:Bitmap;
      
      public function name_3476(param1:name_3474)
      {
         super();
         if(param1 != null && param1.battleId != null && param1.mapName != null)
         {
            this._data = param1;
            this.init();
            this.addEventListener(MouseEvent.CLICK,this.method_2024,false,0,true);
         }
      }
      
      private function method_2024(param1:MouseEvent) : void
      {
         if(PanelModel(Main.osgi.name_6(name_115)).isInBattle)
         {
            PanelModel(Main.osgi.name_6(name_115)).showExitFromBattleAlert();
            Lobby(Main.osgi.name_6(ILobby)).battleSelect.battleSelectModel.battleToSelect = this._data.battleId;
            return;
         }
         if(PanelModel(Main.osgi.name_6(name_115)).isBattleSelect)
         {
            Network(Main.osgi.name_6(name_2)).send("lobby;get_show_battle_info;" + this._data.battleId);
         }
         else
         {
            Lobby(Main.osgi.name_6(ILobby)).battleSelect.battleSelectModel.battleToSelect = this._data.battleId;
            PanelModel(Main.osgi.name_6(name_115)).showBattleSelect(null);
         }
      }
      
      private function init() : void
      {
         mouseChildren = true;
         mouseEnabled = true;
         buttonMode = true;
         tabEnabled = false;
         tabChildren = false;
         this.var_3698 = new Sprite();
         addChild(this.var_3698);
         this._label = new Label();
         this._label.htmlText = "<u>" + this._data.mapName + "</u>";
         this._label.color = name_1139.name_1894;
         this.var_3698.addChild(this._label);
         this.var_3698.y = -1;
         this.var_3698.useHandCursor = true;
      }
      
      public function method_1476() : void
      {
         this.removeEventListener(MouseEvent.CLICK,this.method_2024);
      }
      
      public function get method_3298() : Sprite
      {
         return this.var_3698;
      }
   }
}
