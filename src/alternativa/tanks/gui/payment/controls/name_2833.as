package alternativa.tanks.gui.payment.controls
{
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class name_2833 extends Sprite
   {
       
      
      protected var _width:Number;
      
      protected var var_1278:LabelBase;
      
      protected var var_3383:LabelBase;
      
      public function name_2833(param1:String, param2:int)
      {
         super();
         this.var_1278 = this.method_582(param1);
         addChild(this.var_1278);
         this.var_3383 = this.method_582(param2.toString());
         addChild(this.var_3383);
      }
      
      private function method_582(param1:String) : LabelBase
      {
         var _loc2_:LabelBase = null;
         _loc2_ = null;
         _loc2_ = new LabelBase();
         _loc2_.autoSize = TextFieldAutoSize.LEFT;
         _loc2_.wordWrap = false;
         _loc2_.multiline = true;
         _loc2_.align = TextFormatAlign.LEFT;
         _loc2_.text = param1;
         _loc2_.size = 12;
         _loc2_.color = 5898034;
         return _loc2_;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         var _loc2_:Number = this.var_3383.width;
         this.var_3383.x = this._width - _loc2_;
      }
   }
}
