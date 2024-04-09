package alternativa.tanks.models.battlefield.gui.chat
{
   import controls.Label;
   import flash.text.AntiAliasType;
   import package_427.name_2537;
   import package_47.BattleTeamType;
   
   public class name_2540 extends name_2537
   {
       
      
      private var var_633:Label;
      
      private var var_3117:int = 0;
      
      private var _width:int = 300;
      
      private var var_3048:BattleChatUserLabel;
      
      public function name_2540(param1:int, param2:int, param3:int, param4:String, param5:String, param6:BattleTeamType, param7:Boolean)
      {
         var _loc8_:int = 0;
         super();
         this.var_633 = new Label();
         _loc8_ = 0;
         this.var_3048 = new BattleChatUserLabel(param4,param2,true,param3);
         this.var_3048.name_2046(MessageColor.method_2076(param6,false),true);
         this.var_3048.method_2570(":");
         addChild(this.var_3048);
         _loc8_ += this.var_3048.width;
         this.var_633.color = MessageColor.method_2075(param6,param7,false);
         this.var_633.antiAliasType = AntiAliasType.ADVANCED;
         this.var_633.thickness = 150;
         this.var_633.sharpness = 200;
         this.var_633.multiline = true;
         this.var_633.wordWrap = true;
         this.var_633.mouseEnabled = false;
         var_2577.addChild(this.var_633);
         this.var_3117 = _loc8_;
         if(this.var_3117 > this._width / 2)
         {
            this.var_633.y = 15;
            this.var_633.x = 0;
            this.var_633.width = this._width - 5;
         }
         else
         {
            this.var_633.x = this.var_3117 + 3;
            this.var_633.y = 0;
            this.var_633.width = this._width - this.var_3117 - 8;
         }
         this.var_633.text = param5;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         if(this.var_3117 > this._width / 2 && this.var_633.text.length * 8 > this._width - this.var_3117)
         {
            this.var_633.y = 21;
            this.var_633.x = 0;
            this.var_633.width = this._width - 5;
            this.var_633.height = 20;
         }
         else
         {
            this.var_633.x = this.var_3117;
            this.var_633.y = 0;
            this.var_633.width = this._width - this.var_3117 - 5;
            this.var_633.height = 20;
         }
      }
   }
}
