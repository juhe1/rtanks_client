package controls
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   
   public class name_1936 extends Sprite
   {
       
      
      private const const_2079:* = 200;
      
      private const COLOR:* = 16777215;
      
      private const ALPHA:* = 0.4;
      
      private var _label:Label;
      
      public function name_1936()
      {
         this._label = new Label();
         super();
         addChild(this._label);
         this._label.size = 11;
      }
      
      public function set text(param1:String) : void
      {
         var _loc2_:Graphics = this.graphics;
         this._label.text = param1;
         if(this._label.textWidth > 200)
         {
            this._label.width = 200;
            this._label.multiline = true;
            this._label.wordWrap = true;
         }
         _loc2_.clear();
         _loc2_.beginFill(16777215,0.4);
         _loc2_.drawRect(-3,-3,this._label.textWidth + 9,this._label.textHeight + 9);
         _loc2_.endFill();
      }
   }
}
