package alternativa.tanks.models.battlefield.gui
{
   import assets.IconAlarm;
   import controls.Label;
   import controls.statassets.name_1154;
   import flash.text.TextFieldAutoSize;
   
   public class name_1102 extends name_1154
   {
       
      
      private var label1:Label;
      
      private var label2:Label;
      
      private var var_1891:Label;
      
      private var var_1892:String;
      
      private var var_1394:int;
      
      public function name_1102(param1:String, param2:String, param3:String)
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         super();
         this.var_1892 = param3;
         _loc6_ = 5;
         _loc7_ = 16;
         var _loc8_:IconAlarm = new IconAlarm();
         addChild(_loc8_);
         _loc8_.y = 33;
         var _loc9_:int = _loc8_.y + _loc8_.height + 2 * _loc6_;
         this.label1 = new Label();
         this.label1.size = _loc7_;
         this.label1.text = param1;
         this.label1.y = _loc9_;
         addChild(this.label1);
         width = this.label1.textWidth;
         _loc9_ += this.label1.height + _loc6_;
         this.label2 = new Label();
         this.label2.size = _loc7_;
         this.label2.text = param2;
         this.label2.y = _loc9_;
         addChild(this.label2);
         if(width < this.label2.textWidth)
         {
            width = this.label2.textWidth;
         }
         _loc9_ += this.label2.height + _loc6_;
         this.var_1891 = new Label();
         this.var_1891.size = _loc7_;
         this.var_1891.autoSize = TextFieldAutoSize.LEFT;
         this.var_1891.text = param3 + " 99:99";
         this.var_1891.y = _loc9_;
         addChild(this.var_1891);
         if(width < this.var_1891.textWidth)
         {
            width = this.var_1891.textWidth;
         }
         width += 2 * 33;
         _loc8_.x = width - _loc8_.width >> 1;
         this.label1.x = width - this.label1.width >> 1;
         this.label2.x = width - this.label2.width >> 1;
         height = _loc9_ + this.var_1891.height + 33 - 5;
      }
      
      public function set name_978(param1:int) : void
      {
         if(this.var_1394 == param1)
         {
            return;
         }
         this.var_1394 = param1;
         var _loc2_:int = this.var_1394 / 60;
         this.var_1394 -= _loc2_ * 60;
         var _loc3_:String = this.var_1394 < 10 ? "0" + this.var_1394 : this.var_1394.toString();
         this.var_1891.text = this.var_1892 + " " + _loc2_ + ":" + _loc3_;
         this.var_1891.x = width - this.var_1891.width >> 1;
      }
   }
}
