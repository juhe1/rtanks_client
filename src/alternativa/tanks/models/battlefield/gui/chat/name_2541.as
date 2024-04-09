package alternativa.tanks.models.battlefield.gui.chat
{
   import alternativa.osgi.OSGi;
   import controls.Label;
   import flash.text.AntiAliasType;
   import package_427.name_2537;
   import package_47.BattleTeamType;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2541 extends name_2537
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
       
      
      private var message:String;
      
      private var _width:int;
      
      private var var_633:Label;
      
      private var var_3141:Label;
      
      private var var_3117:int = 0;
      
      public function name_2541(param1:int, param2:String, param3:Boolean)
      {
         var _loc4_:int = 0;
         this.var_633 = new Label();
         super();
         this._width = param1;
         _loc4_ = 0;
         _loc4_ = 14;
         this.var_3141 = new Label();
         this.var_3141.color = MessageColor.name_1140;
         this.var_3141.text = localeService.getText(name_390.const_837) + ":";
         this.var_3141.thickness = 50;
         this.var_3141.sharpness = 0;
         this.var_3141.mouseEnabled = false;
         var_2577.addChild(this.var_3141);
         this.var_3141.x = _loc4_;
         _loc4_ += this.var_3141.textWidth + 1;
         this.var_633.color = MessageColor.method_2075(BattleTeamType.NONE,param3,true);
         this.var_633.antiAliasType = AntiAliasType.ADVANCED;
         this.var_633.thickness = 150;
         this.var_633.sharpness = 200;
         this.var_633.multiline = true;
         this.var_633.wordWrap = true;
         this.var_633.mouseEnabled = false;
         var_2577.addChild(this.var_633);
         this.var_3117 = _loc4_;
         if(this.var_3117 > param1 / 2)
         {
            this.var_633.y = 15;
            this.var_633.x = 0;
            this.var_633.width = param1 - 5;
         }
         else
         {
            this.var_633.x = this.var_3117 + 3;
            this.var_633.y = 0;
            this.var_633.width = param1 - this.var_3117 - 8;
         }
         this.var_633.text = param2;
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
