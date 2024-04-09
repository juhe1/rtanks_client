package package_458
{
   import assets.combo.name_2780;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   
   public class name_3469 extends Sprite
   {
      
      public static const const_1532:int = 20;
      
      public static const const_2867:int = 3;
       
      
      private var var_1557:String;
      
      private var _index:int;
      
      private var _width:int;
      
      private var var_3693:name_2780;
      
      public function name_3469(param1:int, param2:int, param3:String)
      {
         super();
         this._width = param1;
         this._index = param2;
         this.var_1557 = param3;
         this.init();
      }
      
      private function init() : void
      {
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,this._width,20);
         graphics.endFill();
         this.var_3693 = new name_2780();
         this.var_3693.width = this._width - 3 * 2;
         this.var_3693.height = 20;
         this.var_3693.x = 3;
         addChild(this.var_3693);
         var _loc1_:LabelBase = new LabelBase();
         addChild(_loc1_);
         _loc1_.text = this.var_1557;
         _loc1_.x = FreeUidsForm.const_2720;
         this.setSelected(false);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         this.var_3693.visible = param1;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get uid() : String
      {
         return this.var_1557;
      }
   }
}
