package package_455
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.battlelist.BattleMode;
   
   public class name_2931 extends Sprite
   {
      
      private static const const_2697:Class = name_3450;
      
      private static const const_2695:BitmapData = Bitmap(new const_2697()).bitmapData;
      
      private static const const_2699:Class = name_3449;
      
      private static const const_2700:BitmapData = Bitmap(new const_2699()).bitmapData;
      
      private static const const_2696:Class = name_3451;
      
      private static const const_2698:BitmapData = Bitmap(new const_2696()).bitmapData;
       
      
      private var var_3489:Boolean;
      
      private var _icon:Bitmap;
      
      private var var_2949:BattleMode;
      
      private var var_3487:Bitmap;
      
      private var var_3486:Bitmap;
      
      private var var_3488:Bitmap;
      
      public function name_2931(param1:BattleMode)
      {
         super();
         this.var_2949 = param1;
         this.var_3488 = new Bitmap(const_2698);
         addChild(this.var_3488);
         this.var_3487 = new Bitmap(const_2695);
         addChild(this.var_3487);
         this.var_3486 = new Bitmap(const_2700);
         addChild(this.var_3486);
         this._icon = new Bitmap(name_3448.method_2322(param1));
         addChild(this._icon);
         this._icon.x = (width - this._icon.width) / 2;
         this._icon.y = (height - this._icon.height) / 2;
         addEventListener(MouseEvent.CLICK,this.onClick);
         this.isPressed = false;
         this.lock = false;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.isPressed = !this.var_3489;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get isPressed() : Boolean
      {
         return this.var_3489;
      }
      
      public function destroy() : void
      {
         if(hasEventListener(MouseEvent.CLICK))
         {
            removeEventListener(MouseEvent.CLICK,this.onClick);
         }
         if(hasEventListener(MouseEvent.MOUSE_OVER))
         {
            removeEventListener(MouseEvent.MOUSE_OVER,this.method_1530);
         }
         if(hasEventListener(MouseEvent.MOUSE_OUT))
         {
            removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
      }
      
      public function set isPressed(param1:Boolean) : void
      {
         this.var_3489 = param1;
         if(this.var_3489)
         {
            this._icon.y = (height - this._icon.height) / 2 + 1;
            removeEventListener(MouseEvent.MOUSE_OVER,this.method_1530);
            removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
            this.setState(3);
         }
         else
         {
            this._icon.y = (height - this._icon.height) / 2;
            this.setState(1);
            addEventListener(MouseEvent.MOUSE_OVER,this.method_1530);
            addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
      }
      
      private function setState(param1:int) : void
      {
         switch(param1)
         {
            case 1:
               this.var_3487.visible = true;
               this.var_3486.visible = false;
               this.var_3488.visible = false;
               break;
            case 2:
               this.var_3486.visible = true;
               break;
            case 3:
               this.var_3487.visible = false;
               this.var_3486.visible = false;
               this.var_3488.visible = true;
         }
      }
      
      private function method_1530(param1:MouseEvent) : void
      {
         this.setState(2);
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this.setState(1);
      }
      
      public function get battleMode() : BattleMode
      {
         return this.var_2949;
      }
      
      public function set lock(param1:Boolean) : void
      {
         this.mouseChildren = !param1;
         this.mouseEnabled = !param1;
         this.buttonMode = !param1;
         this.useHandCursor = !param1;
      }
   }
}
