package alternativa.tanks.model.quest.common.gui.window
{
   import alternativa.osgi.OSGi;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import package_115.class_60;
   import package_115.name_329;
   import package_470.name_3309;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class QuestItemViewInfoPanel extends Sprite
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
       
      
      private var var_3356:class_60;
      
      private var _width:int;
      
      private var _height:int;
      
      private var var_3367:name_3309;
      
      private var var_3635:LabelBase;
      
      private var var_3634:LabelBase;
      
      private var var_3636:LabelBase;
      
      private var var_3637:LabelBase;
      
      private var var_3638:Vector.<LabelBase>;
      
      private const const_2748:int = 5;
      
      private const const_2811:int = 4;
      
      private const const_2816:int = 14;
      
      private const const_2813:int = 9;
      
      private const const_2815:int = 14;
      
      private const const_2812:int = 8;
      
      private const const_2814:int = 10;
      
      private const const_1759:uint = 5898034;
      
      private const const_1606:uint = 16777215;
      
      public function QuestItemViewInfoPanel(param1:class_60, param2:int, param3:int)
      {
         super();
         this.var_3356 = param1;
         this._width = param2;
         this._height = param3;
         this.var_3638 = new Vector.<LabelBase>();
         this.method_3039();
         this.method_3259();
         this.method_3257();
      }
      
      private function method_3039() : void
      {
         this.var_3367 = new name_3309(this._width,this._height);
         addChild(this.var_3367);
      }
      
      private function method_3259() : void
      {
         this.method_3255();
         this.method_3256();
         this.method_3258();
      }
      
      private function method_3255() : void
      {
         this.var_3636 = new LabelBase();
         this.var_3636.color = 5898034;
         this.var_3636.align = TextFormatAlign.LEFT;
         this.var_3636.text = localeService.getText(name_390.const_649);
         this.var_3636.x = 5;
         this.var_3636.y = 4;
         this.var_3367.addChild(this.var_3636);
      }
      
      private function method_3256() : void
      {
         this.var_3634 = new LabelBase();
         this.var_3634.color = 16777215;
         this.var_3634.align = TextFormatAlign.LEFT;
         this.var_3634.text = this.method_3253();
         this.var_3634.x = this._width - 9 - this.var_3634.textWidth;
         this.var_3634.y = this.var_3636.y + 14;
         this.var_3367.addChild(this.var_3634);
      }
      
      private function method_3258() : void
      {
         this.var_3635 = new LabelBase();
         this.var_3635.color = 16777215;
         this.var_3635.align = TextFormatAlign.LEFT;
         this.var_3635.text = this.method_1449();
         this.var_3635.wordWrap = true;
         this.var_3635.width = this.var_3634.x - 10;
         this.var_3635.x = this.var_3636.x;
         this.var_3635.y = this.var_3634.y;
         this.var_3367.addChild(this.var_3635);
      }
      
      private function method_1449() : String
      {
         return this.var_3356.description.replace("%COUNT%",this.var_3356.finishCriteria.toString());
      }
      
      private function method_3253() : String
      {
         return this.var_3356.progress + "/" + this.var_3356.finishCriteria;
      }
      
      private function method_3257() : void
      {
         this.var_3637 = new LabelBase();
         this.var_3637.color = 5898034;
         this.var_3637.align = TextFormatAlign.LEFT;
         this.var_3637.text = localeService.getText(name_390.const_1028);
         this.var_3637.x = 5;
         this.method_3252();
         this.var_3367.addChild(this.var_3637);
      }
      
      private function method_3260() : void
      {
         this.var_3637.y = this._height - 14 * (this.var_3638.length + 1) - 8;
      }
      
      public function name_3312(param1:class_60) : void
      {
         this.var_3356 = param1;
         this.var_3635.text = this.method_1449();
         this.var_3634.text = this.method_3253();
         this.var_3634.x = this._width - 9 - this.var_3634.textWidth;
         this.method_3254();
         this.method_3252();
      }
      
      private function method_3254() : void
      {
         var _loc1_:LabelBase = null;
         for each(_loc1_ in this.var_3638)
         {
            this.var_3367.removeChild(_loc1_);
         }
         this.var_3638.splice(0,this.var_3638.length);
      }
      
      private function method_3252() : void
      {
         var _loc1_:name_329 = null;
         var _loc2_:LabelBase = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_3356.prizes.length)
         {
            _loc1_ = this.var_3356.prizes[_loc3_];
            _loc2_ = new LabelBase();
            _loc2_.color = 16777215;
            _loc2_.align = TextFormatAlign.LEFT;
            _loc2_.text = _loc1_.name;
            _loc2_.x = 5;
            _loc2_.y = this._height - 8 - (_loc3_ + 1) * 14;
            this.var_3367.addChild(_loc2_);
            this.var_3638.push(_loc2_);
            _loc3_++;
         }
         this.method_3260();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
   }
}
